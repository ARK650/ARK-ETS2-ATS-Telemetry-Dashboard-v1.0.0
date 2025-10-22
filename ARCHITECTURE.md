# ARK Dashboard Architecture

Technical deep dive into the system design and data flow.

---

## 📐 System Overview

The ARK Dashboard is a **real-time telemetry visualization system** that bridges SCS Software's game engine with modern web browsers using WebSockets.

### Core Components

```
┌─────────────────────────────────────────────────────────────────┐
│                        ARCHITECTURE                              │
└─────────────────────────────────────────────────────────────────┘

┌──────────────────┐
│  ETS2/ATS Game   │  ◄── User plays the game
│   (SCS Engine)   │
└────────┬─────────┘
         │ Shared Memory (60 Hz)
         │ Direct memory writes
         ▼
┌──────────────────┐
│   SCS SDK DLL    │  ◄── Funbit's telemetry plugin
│  (Shared Memory  │      Reads game memory structures
│     Reader)      │      Serializes to internal format
└────────┬─────────┘
         │ In-process function calls
         │
         ▼
┌──────────────────┐
│ Ets2Telemetry    │  ◄── Funbit Telemetry Server
│  Server (.exe)   │      HTTP REST API on port 25555
│                  │      Converts to JSON format
└────────┬─────────┘
         │ HTTP GET /api/ets2/telemetry
         │ Polled every 100ms
         ▼
┌──────────────────┐
│   server.js      │  ◄── Our Node.js WebSocket Server
│  (Node.js 20+)   │      Port 3000
│                  │      Broadcasts to all clients
└────────┬─────────┘
         │ WebSocket (ws://)
         │ Binary frames, ~10 msgs/sec
         ▼
┌──────────────────┐
│  index.html      │  ◄── Dashboard Web Interface
│   (Browser)      │      Real-time visualization
│  - JavaScript    │      60 FPS animations
│  - CSS3 Anims    │      Responsive design
└──────────────────┘
```

---

## 🔄 Data Flow

### 1. Game → Shared Memory (60 Hz)

**Technology:** Direct memory writes  
**Frequency:** 60 times per second  
**Format:** Binary structures (C++ structs)

The SCS game engine writes telemetry data to a **shared memory region** accessible by external processes. This includes:

- Truck position, speed, rotation
- Engine RPM, gear, fuel level
- Input states (throttle, brake, steering)
- Warning states (lights, brakes, etc.)
- Job information

**Performance:** ~1-2ms latency

### 2. Shared Memory → SCS SDK DLL (In-Process)

**Technology:** C++ DLL plugin  
**Frequency:** Reads every frame (60 Hz)  
**Format:** Native C++ structs → Funbit internal format

Funbit's plugin (`scs-telemetry.dll`) is loaded by the game and:

1. Registers callbacks with SCS SDK
2. Receives telemetry events from game engine
3. Stores latest values in memory
4. Provides access to Funbit server process

**Key Files:**
- `plugins/scs-telemetry.dll` - The SCS SDK implementation
- Located in game's root directory

**Performance:** <1ms overhead per frame

### 3. SCS SDK DLL → Funbit Server (IPC)

**Technology:** Inter-Process Communication (named pipes or shared memory)  
**Frequency:** On-demand (HTTP request triggers read)  
**Format:** Internal binary → JSON serialization

When the HTTP API is queried, Funbit server:

1. Reads latest telemetry from plugin
2. Serializes to JSON format
3. Returns via HTTP response

**Performance:** ~5-10ms per request

### 4. Funbit Server → server.js (HTTP Polling)

**Technology:** HTTP GET requests  
**Frequency:** Every 100ms (10 Hz)  
**Format:** JSON over HTTP

Our Node.js server (`server.js`) continuously polls:

```javascript
const FUNBIT_URL = 'http://localhost:25555/api/ets2/telemetry';

setInterval(async () => {
    const response = await fetch(FUNBIT_URL);
    const data = await response.json();
    broadcastToClients(data);
}, 100);
```

**Why polling?**
- Funbit doesn't provide WebSocket/streaming
- 100ms interval = good balance between performance and responsiveness
- Lower intervals cause unnecessary CPU usage

**Performance:** ~10-20ms HTTP round-trip

### 5. server.js → Dashboard (WebSocket)

**Technology:** WebSocket protocol (RFC 6455)  
**Frequency:** ~10 messages per second  
**Format:** JSON strings over WebSocket frames

```javascript
// Server broadcasts to all connected clients
wss.clients.forEach(client => {
    if (client.readyState === WebSocket.OPEN) {
        client.send(JSON.stringify(data));
    }
});
```

**Benefits of WebSocket:**
- Full-duplex communication
- Low latency (~1-5ms on LAN)
- Efficient binary/text framing
- Automatic reconnection handling

**Performance:** <5ms delivery on local network

### 6. Dashboard Rendering (Browser)

**Technology:** HTML5 + CSS3 + Vanilla JavaScript  
**Frequency:** 60 FPS animations  
**Format:** DOM manipulation + CSS transitions

```javascript
socket.onmessage = (event) => {
    const data = JSON.parse(event.data);
    updateDashboard(data);  // Updates DOM
};
```

**Rendering Pipeline:**

1. **Receive WebSocket message** (~10 Hz)
2. **Parse JSON** (<1ms)
3. **Update DOM elements** (speed, RPM, gear, etc.)
4. **Trigger CSS transitions** (smooth 60 FPS animations)
5. **Repaint** (browser handles automatically)

**Performance:**
- JSON parse: <1ms
- DOM updates: 2-5ms
- Total frame time: <16ms (maintains 60 FPS)

---

## ⚡ Performance Characteristics

### Latency Breakdown

| Stage | Latency | Notes |
|-------|---------|-------|
| Game → Shared Memory | 1-2ms | Direct memory write |
| Shared Memory → SDK | <1ms | In-process read |
| SDK → Funbit Server | 5-10ms | IPC + JSON serialize |
| Funbit → server.js | 10-20ms | HTTP GET request |
| server.js → Dashboard | 1-5ms | WebSocket on LAN |
| **Total End-to-End** | **~20-40ms** | Acceptable for telemetry |

### Network Performance

**Local Access (localhost):**
- Latency: <5ms
- Bandwidth: Negligible (~2KB per message)
- Connection: Direct loopback

**LAN Access (same network):**
- Latency: 1-10ms (depends on Wi-Fi/Ethernet)
- Bandwidth: ~20 KB/s sustained
- Connection: Local network routing

**Mobile Access (Wi-Fi):**
- Latency: 5-30ms (depends on signal strength)
- Bandwidth: Same as LAN
- Connection: Router → Access Point → Device

### Resource Usage

**Funbit Telemetry Server:**
- CPU: <1% (idle), ~2-3% (active)
- RAM: ~50-80 MB
- Disk I/O: None (all in-memory)

**server.js (Node.js):**
- CPU: <1% (single client), ~2-5% (10+ clients)
- RAM: ~30-50 MB
- Network: ~20 KB/s outbound per client

**Dashboard (Browser):**
- CPU: 5-10% (animations + rendering)
- RAM: 50-100 MB per tab
- GPU: Minimal (CSS transforms use hardware acceleration)

---

## 🔐 Security Considerations

### Network Security

**Current State:** **NO AUTHENTICATION**

- Any device on local network can access dashboard
- No encryption (HTTP/WS, not HTTPS/WSS)
- No password protection

**Risk Assessment:**
- **Low risk:** Dashboard is read-only, can't control game
- **Medium risk:** Exposes game state to local network
- **Acceptable for:** Home LAN use

**Recommended for Production:**

1. **Add authentication:**
   ```javascript
   // In server.js
   wss.on('connection', (ws, req) => {
       const token = req.headers['authorization'];
       if (token !== 'your-secret-token') {
           ws.close(1008, 'Unauthorized');
       }
   });
   ```

2. **Enable HTTPS/WSS:**
   - Use SSL certificates
   - Prevents man-in-the-middle attacks

3. **Restrict IP range:**
   - Bind server to specific network interface
   - Use firewall rules

### Funbit API Security

**Funbit Considerations:**
- Listens on `0.0.0.0:25555` (all interfaces)
- No authentication required
- Exposes game telemetry to local network

**Mitigation:**
- Funbit is designed for local network use
- Dashboard doesn't store or transmit data externally
- No sensitive personal information exposed

---

## 🏗️ Code Architecture

### File Structure

```
Ark-dash/
├── index.html          # Frontend (Dashboard UI)
├── server.js           # Backend (WebSocket server)
├── package.json        # Node.js dependencies
├── README.md           # Main documentation
├── START_HERE.md       # Beginner's guide
├── TELEMETRY_DATA.md   # Complete data reference
├── ARCHITECTURE.md     # This file
└── TELEMETRY_GUIDE.md  # Custom implementation guide
```

### server.js Design

**Pattern:** Event-driven polling with broadcast

```javascript
// Core loop
const POLL_INTERVAL = 100;  // 10 Hz

async function pollTelemetry() {
    try {
        const response = await fetch(FUNBIT_URL);
        const data = await response.json();
        
        // Broadcast to all WebSocket clients
        wss.clients.forEach(client => {
            if (client.readyState === WebSocket.OPEN) {
                client.send(JSON.stringify(data));
            }
        });
    } catch (error) {
        console.error('Polling error:', error);
    }
}

setInterval(pollTelemetry, POLL_INTERVAL);
```

**Design Decisions:**

- **Polling vs. Streaming:** Funbit doesn't support WebSockets, so polling is necessary
- **100ms interval:** Balance between responsiveness and CPU usage
- **Broadcast pattern:** All clients receive same data (no per-client customization)
- **Error handling:** Catches fetch errors, continues polling

### index.html Design

**Pattern:** Event-driven DOM updates

```javascript
// WebSocket connection
const socket = new WebSocket('ws://localhost:3000');

socket.onmessage = (event) => {
    const data = JSON.parse(event.data);
    
    // Update speed
    speedElement.textContent = Math.round(data.truck.speed * 3.6);
    
    // Update RPM with progressive shift light
    updateShiftLight(data.truck.engineRpm, data.truck.engineRpmMax);
    
    // Update warning lights
    updateWarningLights(data);
};
```

**Key Techniques:**

1. **CSS-driven animations:**
   ```css
   .warning-light.active {
       transition: all 0.3s ease;
       box-shadow: 0 0 20px rgba(255, 0, 0, 0.8);
   }
   ```

2. **Hardware-accelerated transforms:**
   ```css
   .gauge-needle {
       transform: rotate(45deg);
       will-change: transform;  /* GPU acceleration */
   }
   ```

3. **Progressive enhancement:**
   - Works without JavaScript (static HTML)
   - Enhances with CSS (visual design)
   - JavaScript adds interactivity

---

## 🔧 Customization Points

### Change Update Frequency

**In server.js:**
```javascript
const POLL_INTERVAL = 50;  // 20 Hz (more responsive, higher CPU)
// or
const POLL_INTERVAL = 200; // 5 Hz (lower CPU, less responsive)
```

### Add Data Filtering

**In server.js (before broadcast):**
```javascript
// Only send specific properties
const filteredData = {
    speed: data.truck.speed,
    rpm: data.truck.engineRpm,
    gear: data.truck.displayedGear
};
client.send(JSON.stringify(filteredData));
```

### Implement Data Logging

**In server.js:**
```javascript
const fs = require('fs');

function logTelemetry(data) {
    const logEntry = {
        timestamp: Date.now(),
        speed: data.truck.speed,
        rpm: data.truck.engineRpm
    };
    fs.appendFileSync('telemetry.log', JSON.stringify(logEntry) + '\n');
}
```

---

## 🚀 Scalability

### Current Limits

**Single Server:**
- **Max clients:** ~100 simultaneous connections
- **Bottleneck:** WebSocket broadcast loop
- **Network:** 2 MB/s total bandwidth

### Scaling Strategies

**Horizontal Scaling (Multiple Servers):**
```
        ┌─ server.js (port 3000) ─ clients 1-50
Funbit ─┼─ server.js (port 3001) ─ clients 51-100
        └─ server.js (port 3002) ─ clients 101-150
```

**Load Balancing:**
```
                    ┌─ server.js (instance 1)
Funbit ─ HAProxy ─┼─ server.js (instance 2)
                    └─ server.js (instance 3)
```

**Caching Layer:**
```javascript
let cachedData = null;
let lastUpdate = 0;

async function pollTelemetry() {
    const now = Date.now();
    if (now - lastUpdate < 100) {
        return cachedData;  // Return cached
    }
    
    cachedData = await fetchFromFunbit();
    lastUpdate = now;
    return cachedData;
}
```

---

## 📊 Monitoring & Debugging

### Enable Verbose Logging

**In server.js:**
```javascript
const DEBUG = true;

function log(message, data) {
    if (DEBUG) {
        console.log(`[${new Date().toISOString()}] ${message}`, data);
    }
}

log('Client connected', { clientCount: wss.clients.size });
log('Telemetry data', data);
```

### Performance Profiling

**Browser DevTools:**
1. Open dashboard in Chrome
2. Press F12 → Performance tab
3. Click Record
4. Drive for 10 seconds
5. Stop recording
6. Analyze frame times

**Node.js Profiling:**
```powershell
node --inspect server.js
# Open chrome://inspect in Chrome
```

### Network Analysis

**Wireshark capture:**
```
tcp.port == 3000 && websocket
```

Shows WebSocket frame sizes and timing.

---

## 🔗 External Dependencies

### Runtime Dependencies

| Dependency | Version | Purpose |
|------------|---------|---------|
| Node.js | 18+ | JavaScript runtime |
| ws | ^8.18.0 | WebSocket server library |

### External Services

| Service | Port | Purpose |
|---------|------|---------|
| Funbit Telemetry | 25555 | Game data source |
| ARK Dashboard | 3000 | WebSocket server |

---

## 📚 References

- **WebSocket RFC:** https://datatracker.ietf.org/doc/html/rfc6455
- **SCS SDK:** https://modding.scssoft.com/wiki/Documentation/Engine/SDK/Telemetry
- **Funbit Server:** https://github.com/Funbit/ets2-telemetry-server
- **Node.js ws Library:** https://github.com/websockets/ws

---

*Last updated: October 21, 2025*  
*Architecture version: 1.0*
