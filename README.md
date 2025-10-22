# 🚚 ARK Custom ETS2/ATS Telemetry Dashboard# ARK ETS2 Pro Dashboard 🚛# 🚚 ARK ETS2/ATS Dashboard# 🚚 ARK Custom ETS2/ATS Telemetry Dashboard



Professional real-time telemetry dashboard for Euro Truck Simulator 2 and American Truck Simulator with WebSocket streaming and mobile support.



![License](https://img.shields.io/badge/license-MIT-blue.svg)A professional, automotive-style telemetry dashboard for Euro Truck Simulator 2 and American Truck Simulator. Features real-time truck data visualization with a sleek, modern interface optimized for desktop and mobile devices.

![Node.js](https://img.shields.io/badge/node-%3E%3D18.0.0-brightgreen.svg)

![ETS2](https://img.shields.io/badge/ETS2-compatible-orange.svg)

![ATS](https://img.shields.io/badge/ATS-compatible-orange.svg)

![License](https://img.shields.io/badge/license-MIT-blue.svg)Professional telemetry dashboard for Euro Truck Simulator 2 and American Truck Simulator.A lightweight, custom telemetry dashboard for Euro Truck Simulator 2 and American Truck Simulator. This project gives you full control over your dashboard design without relying on external servers.

---

![Node.js](https://img.shields.io/badge/node-%3E%3D16.0.0-brightgreen.svg)

## ✨ Features

![ETS2](https://img.shields.io/badge/ETS2-compatible-orange.svg)

### 🎨 Modern UI/UX

- **Automotive-style fonts** (Orbitron for numbers, Rajdhani for text)![ATS](https://img.shields.io/badge/ATS-compatible-orange.svg)

- **Subtle glows** mimicking real car dashboard lighting (12px blur, 0.4 opacity)

- **Realistic truck-specific SVG icons** for all 10 warning lights## 🚀 Quick Start## 🎯 What This Does

- **Responsive design** - Works perfectly on desktop and mobile (iPhone 14 Pro Max optimized)

- **Dark theme** with ultra-dark background (#0a0a0a) for OLED displays## ✨ Features



### 🚦 Real-time Telemetry Display

- **10 Warning Lights Grid**

  - 🅿️ Parking Brake (air brake style indicator)### 🎨 Modern UI/UX

  - ⛽ Low Fuel (fuel pump icon)

  - ⚙️ **Gear Display with Progressive Shift Light**- **Automotive-style fonts** (Orbitron & Rajdhani) for authentic dashboard feel### First Time Setup:This custom server:

  - 🛑 ABS (brake disc with caliper - custom simulation logic)

  - 🔄 TCS/Traction Control (wheel with slip marks - custom simulation)- **Subtle glows** mimicking real car dashboard lighting

  - 🔵 Engine Brake (engine block with EB marking)

  - 🚛 Trailer Brake (trailer with emphasized brakes)- **Realistic truck-specific icons** for all warning lights1. Make sure **Funbit ETS2 Telemetry Server** is running (port 25555)- ✅ Reads telemetry data directly from the game using the official SCS SDK plugin

  - 🚨 Rotating Beacon (dome light with beams)

  - 🔒 Differential Lock (axle with lock icon)- **Responsive design** - Works perfectly on desktop and mobile (iPhone 14 Pro Max tested)

  - ⚠️ Hazard Warning (triangle with exclamation)

- **Dark theme** with ultra-dark background (#0a0a0a) for OLED displays2. Run: `npm install` (one time only)- ✅ Provides real-time WebSocket streaming (100ms updates)

- **Live Input Monitoring**

  - Throttle bar (green gradient with pulse animations)

  - Brake bar (red gradient with pulse animations)

  - Clutch bar (blue gradient with pulse animations)### 🚦 Real-time Telemetry Display3. Double-click: **`ARK-Dashboard.bat`**- ✅ Exposes a REST API for data access

  - Real-time percentage display

- **10 Warning Lights Grid**

- **Steering Wheel Display**

  - Visual rotation indicator  - Parking Brake (air brake style indicator)4. Select option **[1]** to start with browser- ✅ Serves your custom HTML dashboard

  - Angle display (-100% to +100%)

  - Sequential turn signals (6 segments per side, animated)  - Low Fuel (fuel pump icon)

  - Hazard light synchronization (both sides blink together)

  - **Gear Display with Progressive Shift Light**- ✅ No Python required, pure JavaScript solution

- **Job Information Panel**

  - Departure city → Destination city  - ABS (brake disc with caliper - custom logic)

  - Cargo type and weight (in metric tons)

  - Truck manufacturer and model  - TCS/Traction Control (wheel with slip marks - custom logic)### Daily Use:- ✅ Full control over dashboard design and features

  - Trailer connection status

  - Engine Brake (engine block with EB marking)

### 🔴 Progressive Shift Light System

- **Normal Operation (< 92% RPM)**: Cyan gear display  - Trailer Brake (trailer with emphasized brakes)1. Start ETS2 or ATS

- **Shift Soon (92-97% RPM)**: Solid red gear display

- **Shift NOW (> 97% RPM)**: Flashing red gear display with animation  - Rotating Beacon (dome light with beams)

- Only active in forward gears (disabled in neutral/reverse)

- Tuned for truck engines (typically 2000-2500 RPM max)  - Differential Lock (axle with lock icon)2. Double-click **`ARK-Dashboard.bat`**## 🏗️ Architecture



### 🎯 Custom Simulation Logic  - Hazard Warning (triangle with exclamation)



#### ABS (Anti-lock Braking System)3. Choose option 1 or 2

Activates when:

- Brake input > 50%- **Live Input Monitoring**

- Speed > 30 km/h

- Air pressure > 65 PSI  - Throttle bar (green gradient with pulse/shine animations)4. Dashboard opens automatically!```



#### TCS (Traction Control System)  - Brake bar (red gradient with pulse/shine animations)

Activates when:

- Throttle input > 60%  - Clutch bar (orange gradient with pulse/shine animations)┌─────────────────┐

- Speed < 50 km/h

- RPM > 70% of max  - Real-time percentage display with automotive fonts

- In forward gear

---│   ETS2 / ATS    │  (Game Running)

---

- **Steering Wheel Display**

## 🚀 Quick Start

  - Visual rotation indicator│   Game Process  │

### ⚡ **Easy Method (Windows - Recommended)**

  - Angle display (-180° to +180°) in Orbitron font

**Just 3 clicks to start!**

  - Sequential turn signals (6 segments per side, animated)## 📱 iPhone/Phone Setup└────────┬────────┘

1. **Download and unzip** this repository

2. **Double-click `ARK-Dashboard.bat`**  - Hazard light synchronization (both sides blink together)

3. **Select option [1] - Start Dashboard**

         │

✨ The launcher automatically:

- Starts the WebSocket server- **Job Information Panel**

- Opens your browser to the dashboard

- Shows your network IP for phone/tablet access  - Departure city### First Time:         │ SCS SDK Plugin (ets2-telemetry-server.dll)

- Handles everything for you!

  - Destination city

**Launcher Options:**

- **[1]** Start Dashboard (opens in browser automatically)  - Cargo type1. On PC: Start dashboard (option 1 or 2)         │ Writes to Shared Memory

- **[2]** Start Server Only (for phone use, no browser)

- **[3]** Show Network IP (get phone/tablet connection URL)  - Weight (in metric tons)

- **[4]** Stop Server

- **[5]** Exit2. On PC: Select option **[3]** to see network IP         ▼



---### 🔴 Progressive Shift Light System



### 🛠️ Manual Method (All Platforms)- **Normal Operation (< 92% RPM)**: Cyan gear display3. On Phone: Connect to **same Wi-Fi** as PC┌─────────────────┐



#### Prerequisites- **High RPM (92-97%)**: Solid red warning - consider shifting

1. **Euro Truck Simulator 2** or **American Truck Simulator**

2. **[Funbit ETS2 Telemetry Server](https://github.com/Funbit/ets2-telemetry-server/releases)** (v3.3.0+)- **Redline (> 97%)**: Flashing red - SHIFT NOW!4. On Phone: Open Safari and enter the URL shown│  Shared Memory  │  (Local\SCSTelemetry)

3. **Node.js 18+** ([Download](https://nodejs.org/))

- Only activates in forward gears (not neutral or reverse)

#### Installation Steps

5. (Optional) Add to Home Screen for app-like experience│   Memory Map    │

**Step 1: Install Funbit Telemetry Server**

### 🧮 Custom Logic Implementation

1. Download latest release from [Funbit's GitHub](https://github.com/Funbit/ets2-telemetry-server/releases)

2. Extract ZIP to folder (e.g., `C:\ETS2-Telemetry`)Since ETS2/ATS don't provide ABS/TCS status, we simulate them realistically:└────────┬────────┘

3. Run `Ets2Telemetry.exe`

4. Click "Install" to add plugin to game directory

5. Server starts on `http://localhost:25555`

6. Keep it running in background- **ABS Simulation**: Activates when:### What Works:         │



**Step 2: Install Dashboard Dependencies**  - Brake input > 50%



```powershell  - Speed > 30 km/h- ✅ iPhone 14 Pro Max optimized (no scrolling)         │ Funbit Server reads via Windows API

# Navigate to dashboard folder

cd "E:\ETS 2\Custom dash\Ark-dash"  - Air pressure > 65 PSI



# Install Node.js dependencies  - ✅ Portrait and landscape modes         │ Exposes HTTP API on port 25555

npm install

```- **TCS Simulation**: Activates when:



**Step 3: Start the WebSocket Server**  - Throttle > 60%- ✅ Touch-friendly controls         ▼



```powershell  - Speed < 50 km/h

# Run the server

node server.js  - RPM > 70% of max- ✅ Real-time updates (10 Hz)┌─────────────────┐

```

  - In forward gear

You should see:

```- ✅ All screen sizes supported│  Funbit Server  │  http://localhost:25555/api/ets2/telemetry

WebSocket server running on port 3000

Polling Funbit server at http://localhost:25555/api/ets2/telemetry- **Hazard Lights**: Synchronized blinking when both turn signals are active

```

- **Sequential Turn Signals**: 6-segment animated arrows with progressive lighting│  (Background)   │

**Step 4: Launch the Game**



1. Start **ETS2** or **ATS**

2. Load a save or start new game## 🎯 Live Demo---└────────┬────────┘

3. Start driving!



**Step 5: Open Dashboard**

Open `index.html` in your browser while running:         │

Open browser and go to:

```1. Euro Truck Simulator 2 or American Truck Simulator

http://localhost:3000

```2. [Funbit ETS2 Telemetry Server](https://github.com/Funbit/ets2-telemetry-server)## 🎮 Features         │ HTTP Polling (100ms interval)



---3. The included Node.js WebSocket server (`server.js`)



## 📱 Mobile Access (Phone/Tablet)         ▼



### Using the Launcher (Easiest)## 📋 Prerequisites



1. Start dashboard using `ARK-Dashboard.bat`### Warning Lights:┌─────────────────┐

2. Select option **[3] - Show Network IP**

3. Copy the URL shown (e.g., `http://192.168.1.100:3000`)### Required Software

4. On your phone/tablet, connect to **same Wi-Fi** as PC

5. Open browser and enter the URL1. **Euro Truck Simulator 2** or **American Truck Simulator**- 🅿️ Parking Brake│  ARK Custom     │  ← YOUR CUSTOM SERVER



### Manual Method   - Available on [Steam](https://store.steampowered.com/)



**Find PC IP Address:**- ⛽ Low Fuel│  Server         │  Port 3000

```powershell

ipconfig2. **Funbit ETS2 Telemetry Server** (v3.3.0 or later)

# Look for "IPv4 Address" (e.g., 192.168.1.100)

```   - Download: [GitHub Releases](https://github.com/Funbit/ets2-telemetry-server/releases)- ⚠️ Hazard Lights│  (server.js)    │



**Connect from Phone:**   - This is the bridge between the game and your dashboard

```

http://YOUR_PC_IP:3000- 🛑 ABS (simulated during hard braking)└────────┬────────┘

```

3. **Node.js** (v16.0.0 or later)

### iPhone Pro Tip

1. Open dashboard in Safari   - Download: [nodejs.org](https://nodejs.org/)- ⚡ TCS (simulated during wheel spin)         │

2. Tap **Share** button

3. Select **Add to Home Screen**   - Required to run the WebSocket server

4. Dashboard opens like a native app (fullscreen, no browser UI)!

- 🔧 Engine Brake / Retarder         │ WebSocket + REST API

**Optimized for:** iPhone 14 Pro Max (430×932px viewport)  

**Works on:** All modern smartphones and tablets4. **Modern Web Browser**



---   - Chrome, Edge, Firefox, or Safari- 🚛 Trailer Brake         ▼



## 🏗️ Architecture   - Mobile browsers supported (iOS Safari, Chrome Mobile)



```- 🚨 Rotating Beacon┌─────────────────┐

┌──────────────────┐

│  ETS2/ATS Game   │  ← You play the game## 🚀 Quick Start

│  (SCS Engine)    │

└────────┬─────────┘- 🔒 Differential Lock│   Dashboard     │  ← YOUR CUSTOM DASHBOARD

         │ Shared Memory (60 Hz)

         ▼### Step 1: Install Funbit Telemetry Server

┌──────────────────┐

│   SCS SDK DLL    │  ← Funbit's telemetry plugin│   (index.html)  │  http://localhost:3000/index.html

│  (ets2-telemetry-│     Reads game memory

│   server.dll)    │1. Download the latest release from [Funbit's GitHub](https://github.com/Funbit/ets2-telemetry-server/releases)

└────────┬─────────┘

         │ IPC2. Extract the ZIP file to a folder (e.g., `C:\ETS2-Telemetry`)### Controls Display:└─────────────────┘

         ▼

┌──────────────────┐3. Run `Ets2Telemetry.exe`

│ Ets2Telemetry    │  ← Funbit Telemetry Server

│  Server (.exe)   │     HTTP REST API (port 25555)4. Click "Install" to install the plugin to your game directory- ◀ ▶ Turn signals (animated)```

└────────┬─────────┘

         │ HTTP GET (polled every 100ms)5. The server will start on `http://localhost:25555`

         ▼

┌──────────────────┐6. Keep it running in the background- 🎯 Steering wheel (180° rotation)

│   server.js      │  ← Our Node.js WebSocket Server

│  (Node.js 20+)   │     Port 3000

│                  │     Broadcasts to all clients

└────────┬─────────┘### Step 2: Install Dashboard Dependencies- 🟢 Throttle bar## 📋 Prerequisites

         │ WebSocket (ws://)

         │ ~10 messages/second

         ▼

┌──────────────────┐```bash- 🔴 Brake bar

│  index.html      │  ← Dashboard Web Interface

│   (Browser)      │     Real-time visualization# Navigate to the dashboard folder

│                  │     60 FPS animations

└──────────────────┘cd "E:\ETS 2\Custom dash\Ark-dash"- 🟡 Clutch barBefore running your custom server, you need:

```



### Data Flow

# Install Node.js dependencies (websocket library)

1. **Game → Shared Memory:** Game writes telemetry data 60 times/second

2. **Shared Memory → SCS SDK:** Funbit plugin reads memory structuresnpm install

3. **SCS SDK → Funbit Server:** Plugin provides data to server via IPC

4. **Funbit Server → server.js:** Our server polls HTTP API every 100ms```### Job Information:### 1. Install Funbit ETS2 Telemetry Server

5. **server.js → Dashboard:** WebSocket broadcasts JSON to all browsers

6. **Dashboard → Screen:** JavaScript updates DOM, CSS animates at 60 FPS



**Total latency:** ~20-40ms end-to-end### Step 3: Start the WebSocket Server- From/To citiesThis installs the plugin DLL that reads game memory.



---



## 📊 Telemetry Data Reference```bash- Cargo type



### Properties Currently Used# Run the server



| Category | Properties | Usage |node server.js- Weight1. Download: https://github.com/Funbit/ets2-telemetry-server/releases

|----------|-----------|-------|

| **Truck Core** | `speed`, `engineRpm`, `engineRpmMax`, `gear`, `displayedGear`, `forwardGears` | Gauges & shift light |```

| **Inputs** | `gameSteer`, `gameThrottle`, `gameBrake`, `gameClutch` | Live input bars |

| **Warning States** | `parkBrakeOn`, `fuelWarningOn`, `motorBrakeOn`, `differentialLockOn`, `lightsBeaconOn` | Warning lights |2. Extract and run `Ets2Telemetry.exe`

| **Turn Signals** | `blinkerLeftOn`, `blinkerRightOn`, `blinkerLeftActive`, `blinkerRightActive` | Sequential signals |

| **Custom Logic** | `airPressure`, `retarderBrake` | ABS/TCS simulation |You should see:

| **Truck Info** | `make`, `model` | Job panel display |

| **Trailer** | `attached`, `name`, `mass` | Trailer status |```---3. Click **"Install"** button

| **Job** | `sourceCity`, `destinationCity`, `cargo`, `mass` | Route information |

| **Game** | `gameName` | ETS2 vs ATS detection |WebSocket server running on port 3000



### Complete Data ReferencePolling Funbit server at http://localhost:25555/api/ets2/telemetry4. This copies `ets2-telemetry-server.dll` to your game folder



See **[TELEMETRY_DATA.md](TELEMETRY_DATA.md)** for:```

- ALL available telemetry properties (100+ documented)

- Data types and ranges## 🔧 Launcher Menu Options

- Unit conversion formulas

- API endpoint documentation### Step 4: Launch the Game

- Example responses

### 2. Verify Plugin Installation

---

1. Start **Euro Truck Simulator 2** or **American Truck Simulator**

## 🎨 Customization

2. Load a game or start a new one**[1] Start Dashboard (Opens in Browser)**The plugin should be at:

### Change Warning Light Colors

3. Begin driving (telemetry only works when in-game, not in menus)

Edit `index.html` around line 170-230:

- Starts server + opens browser automatically- **ETS2**: `steamapps/common/Euro Truck Simulator 2/bin/win_x64/plugins/ets2-telemetry-server.dll`

```css

/* Parking Brake - Change red to your color */### Step 5: Open the Dashboard

.warning-light.parking-brake.active {

    background: linear-gradient(135deg, #ff0000 0%, #cc0000 100%);- Best for PC use- **ATS**: `steamapps/common/American Truck Simulator/bin/win_x64/plugins/ets2-telemetry-server.dll`

    box-shadow: 0 0 12px rgba(255, 0, 0, 0.4),

                0 0 20px rgba(255, 0, 0, 0.15);Open `index.html` in your browser:

}

- **Double-click** the file in Windows Explorer, or- Shows network IP for phone access

/* Fuel Warning - Change amber to your color */

.warning-light.fuel-warning.active {- Navigate to: `file:///E:/ETS%202/Custom%20dash/Ark-dash/index.html`

    background: linear-gradient(135deg, #ff9900 0%, #cc7700 100%);

    box-shadow: 0 0 12px rgba(255, 153, 0, 0.4),### 3. Install Node.js

                0 0 20px rgba(255, 153, 0, 0.15);

}You should see **"Connected"** in green at the top!

```

**[2] Start Server Only**- Download from: https://nodejs.org/

### Adjust Shift Light Thresholds

## 📱 Mobile Access

Edit `index.html` around line 1125:

- Starts server with console output- Version 14 or higher recommended

```javascript

// Calculate RPM percentage### Access Dashboard on Phone/Tablet

const rpmPercentage = (rpm / maxRpm) * 100;

- Good for debugging

// Adjust these percentages to your preference

if (rpmPercentage > 97) {  // Flashing red (default: 97%)1. **Find your PC's local IP address:**

    gearDisplay.classList.add('redline');

} else if (rpmPercentage > 92) {  // Solid red (default: 92%)   ```powershell- Use for phone-only access## 🚀 Installation

    gearDisplay.classList.add('shift-light');

    gearDisplay.classList.remove('redline');   # Windows PowerShell

}

```   ipconfig



**Lower numbers** = shift light activates earlier     # Look for "IPv4 Address" under your WiFi adapter (e.g., 192.168.1.100)

**Higher numbers** = shift light activates later

   ```**[3] Show Network IP**1. **Clone or download this project**

### Modify ABS/TCS Logic



Edit `index.html` around line 1015:

2. **Ensure both devices are on the same WiFi network**- Displays URL for phone/tablet   ```bash

```javascript

// ABS simulation - adjust these thresholds

const absActive = 

    (data.truck?.gameBrake || 0) > 0.5 &&      // Brake threshold (0-1)3. **Start an HTTP server** to serve the dashboard:- Use when you need the IP address   cd "e:\ETS 2\Custom dash\Ark-dash"

    truckSpeed > 30 &&                         // Minimum speed (km/h)

    (data.truck?.airPressure || 0) > 65;       // Air pressure (PSI)   ```bash



// TCS simulation - adjust these thresholds   # Option 1: Using Node.js http-server   ```

const tcsActive = 

    (data.truck?.gameThrottle || 0) > 0.6 &&   // Throttle threshold (0-1)   npx http-server -p 8080

    truckSpeed < 50 &&                         // Maximum speed (km/h)

    rpmPercent > 0.7 &&                        // RPM threshold (0-1)   **[4] Stop Server**

    (data.truck?.gear || 0) > 0;               // Forward gear only

```   # Option 2: Using Python (if installed)



### Change Fonts   python -m http.server 8080- Stops all Node.js processes2. **Install dependencies**



Edit `index.html` line 14-16:   ```



```html- Clean shutdown   ```bash

<!-- Replace with your preferred Google Fonts -->

<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Rajdhani:wght@500;700&display=swap" rel="stylesheet">4. **On your mobile device**, navigate to:

```

   ```   npm install

Then update CSS font-family references throughout the file.

   http://192.168.1.100:8080/index.html

---

   ```**[5] Exit**   ```

## 🔧 Troubleshooting

   (Replace `192.168.1.100` with your actual IP)

### Dashboard Shows "Disconnected"

- Stops server and closes launcher   This installs only `express` and `ws` - no Python required!

**Cause:** WebSocket server not running

5. **For iOS**: Add to Home Screen for full-screen experience

**Solutions:**

1. Make sure `node server.js` is running (or use `ARK-Dashboard.bat`)   - Tap Share (box with arrow) → "Add to Home Screen"

2. Check PowerShell/CMD window for errors

3. Verify no other app is using port 3000   - Opens without browser UI bars, like a native app

4. Try refreshing browser (F5 or Ctrl+F5)

---3. **Done!** You're ready to run your custom server.

### Dashboard Shows "No Data"

### Mobile Optimization Features

**Cause:** Funbit server not providing data

- ✅ **iPhone 14 Pro Max** fully tested and optimized

**Solutions:**

1. Make sure **Funbit Telemetry** (`Ets2Telemetry.exe`) is running- ✅ No scrolling required - everything fits perfectly

2. Verify Funbit shows "Connected to game"

3. Make sure game is actually running (not just main menu)- ✅ Black status bars for OLED displays## 📋 Requirements## 🎮 Usage

4. Try loading a job or driving the truck

5. Check firewall isn't blocking port 25555- ✅ Touch-optimized spacing and sizing

6. Restart Funbit server

- ✅ Compact layout with reduced gaps (6px)

### Mobile Device Can't Connect

- ✅ Smaller steering wheel (120px × 75px)

**Cause:** Network configuration issues

- ✅ Compact input bars (6px padding, 22px height)- **Node.js** (already installed ✓)### Step 1: Start Funbit Server

**Solutions:**

1. Verify phone and PC are on **same Wi-Fi network**- ✅ Side-by-side job panel (no stacking)

2. Double-check IP address using `ipconfig` or launcher option [3]

3. Try disabling Windows Firewall temporarily to test- ✅ Landscape and portrait support- **npm packages** (run `npm install`)1. Run `Ets2Telemetry.exe`

4. Make sure you're using `http://` not `https://`

5. Check router isn't blocking local network communication

6. Try restarting router

## 🏗️ Architecture & Data Flow- **Funbit ETS2 Telemetry Server** (must be running)2. Keep it running in the background

### Warning Lights Don't Activate



**Cause:** Game doesn't have those features active

```- **ETS2 or ATS** game3. You should see "Ready" status

**Solutions:**

1. **ABS:** Requires hard braking (>50%) at speed (>30 km/h)┌─────────────────────────────┐

2. **TCS:** Requires heavy throttle (>60%) at low speed (<50 km/h)

3. **Trailer:** Only shows when trailer is attached│   ETS2/ATS Game Process     │

4. Some lights may not work in specific truck models

5. Make sure you're actually driving (not in menu/paused)│   (Shared Memory)           │



### Shift Light Activates Too Early/Late└──────────────┬──────────────┘### For Phone Access:### Step 2: Start YOUR Custom Server



**Solution:** Adjust thresholds in customization section above               │



Truck engines typically have lower RPM than cars:               │ SCS SDK Plugin DLL reads memory- PC and phone on **same Wi-Fi network**```bash

- Most trucks: 1900-2500 RPM max

- Shift light at 92% = ~2100-2300 RPM (good for most trucks)               │ (ets2-telemetry-server.dll)



---               ▼- Port 3000 allowed through firewall (usually auto-allowed)npm start



## 📚 Additional Documentation┌─────────────────────────────┐



- **[START_HERE.md](START_HERE.md)** - Complete beginner's guide with step-by-step setup│  Funbit Telemetry Server    │  Port: 25555```

- **[TELEMETRY_DATA.md](TELEMETRY_DATA.md)** - ALL available telemetry properties documented

- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Technical deep dive into system design│  (Ets2Telemetry.exe)        │  API: /api/ets2/telemetry

- **[TELEMETRY_GUIDE.md](TELEMETRY_GUIDE.md)** - Building custom SCS SDK solutions

└──────────────┬──────────────┘---

---

               │

## 🤝 Contributing

               │ HTTP GET requests (every 100ms)You should see:

Contributions welcome! Please:

               ▼

1. Fork the repository

2. Create feature branch (`git checkout -b feature/amazing-feature`)┌─────────────────────────────┐## 🌐 Access URLs```

3. Commit changes (`git commit -m 'Add amazing feature'`)

4. Push to branch (`git push origin feature/amazing-feature`)│  Node.js WebSocket Server   │  Port: 3000

5. Open Pull Request

│  (server.js)                │  Broadcasts JSON data═══════════════════════════════════════════════════════════

**Ideas for contributions:**

- Additional warning lights└──────────────┬──────────────┘

- More gauge types (fuel, temperature, etc.)

- Sound alerts for warnings               │### On PC:  🚚 ARK CUSTOM ETS2/ATS TELEMETRY SERVER

- Data logging/replay

- Multiple dashboard themes               │ WebSocket connection (ws://localhost:3000)

- VR support

               ▼```═══════════════════════════════════════════════════════════

---

┌─────────────────────────────┐

## 📄 License

│  Dashboard (index.html)     │  Your Browserhttp://localhost:3000/index.html📱 Dashboard:  http://localhost:3000/index.html

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

│  Real-time Visualization    │  Updates every 100ms

---

└─────────────────────────────┘```🔌 API:        http://localhost:3000/api/telemetry

## 🙏 Acknowledgments

```

- **[Funbit](https://github.com/Funbit/ets2-telemetry-server)** - For the amazing ETS2 Telemetry Server

- **[SCS Software](https://www.scssoft.com/)** - For ETS2/ATS and the SDK📊 Status:     http://localhost:3000/api/status

- **Google Fonts** - Orbitron & Rajdhani fonts

- **Community** - For feedback and feature ideas### How It Works



---### On Phone:📡 WebSocket:  ws://localhost:3000



## 🔗 Links1. **ETS2/ATS Game** runs and stores telemetry data in shared memory



- **Funbit Telemetry Server:** https://github.com/Funbit/ets2-telemetry-server2. **Funbit's SCS SDK Plugin** (DLL) reads this memory via official SCS SDK```═══════════════════════════════════════════════════════════

- **SCS SDK Documentation:** https://modding.scssoft.com/wiki/Documentation/Engine/SDK/Telemetry

- **ETS2 Modding Wiki:** https://modding.scssoft.com/3. **Funbit Server** exposes the data as a JSON REST API on port 25555



---4. **server.js** polls the Funbit API every 100ms and caches the datahttp://[YOUR-PC-IP]:3000/index.html⏳ Waiting for ETS2/ATS connection...



**Made with ❤️ for the trucking community**5. **server.js** broadcasts updates to all connected browsers via WebSocket



*Happy trucking! 🚛*6. **Dashboard (index.html)** receives data and updates the UI in real-time``````




### Why This Architecture?Use option [3] in the launcher to see your PC's IP address.



- **Game** → No built-in API, data only in memory### Step 3: Start the Game

- **Funbit** → Trusted, battle-tested solution used by thousands

- **server.js** → Provides WebSocket for real-time updates (faster than polling)---1. Launch Euro Truck Simulator 2 or American Truck Simulator

- **Browser** → Can't directly access game memory or local APIs due to CORS/security

2. Wait for it to load

## 📊 Telemetry Data Reference

## ❗ Troubleshooting3. Your server will show: **"🎮 ETS2/ATS Connected!"**

See **[TELEMETRY_DATA.md](TELEMETRY_DATA.md)** for complete list of all available properties.



### Core Data Points We Use

### Dashboard shows "Disconnected"### Step 4: Open Dashboard

| Property | Type | Description | Usage |

|----------|------|-------------|-------|1. Make sure Funbit server is runningOpen your browser to:

| `truck.speed` | float | Speed in m/s | Speed calculation (× 3.6 for km/h) |

| `truck.engineRpm` | float | Current RPM | Shift light thresholds |2. Start ETS2/ATS game```

| `truck.engineRpmMax` | float | Maximum RPM | Shift light calculation |

| `truck.displayedGear` | int | Current gear (-1=R, 0=N, 1-12) | Gear display |3. Refresh browserhttp://localhost:3000/index.html

| `truck.forwardGears` | int | Total forward gears | Transmission info |

| `truck.gameSteer` | float | Steering input (-1 to 1) | Steering wheel rotation |```

| `truck.gameThrottle` | float | Throttle input (0 to 1) | Throttle bar |

| `truck.gameBrake` | float | Brake input (0 to 1) | Brake bar |### Can't access from phone

| `truck.gameClutch` | float | Clutch input (0 to 1) | Clutch bar |

1. Check both devices on same Wi-Fi## 📡 API Endpoints

### Warning Light States

2. Use option [3] to get correct IP

| Property | Type | Description |

|----------|------|-------------|3. Check Windows Firewall allows Node.js### REST API

| `truck.parkBrakeOn` | bool | Parking brake engaged |

| `truck.fuelWarningOn` | bool | Low fuel warning |

| `truck.blinkerLeftOn` | bool | Left turn signal switch |

| `truck.blinkerRightOn` | bool | Right turn signal switch |### Server won't start#### GET /api/telemetry

| `truck.blinkerLeftActive` | bool | Left blinker flashing state |

| `truck.blinkerRightActive` | bool | Right blinker flashing state |1. Use option [4] to stop old serverReturns current telemetry data in JSON format.

| `truck.lightsBeaconOn` | bool | Rotating beacon active |

| `truck.differentialLockOn` | bool | Diff lock engaged |2. Check port 3000 is not used by another app

| `truck.motorBrakeOn` | bool | Engine brake active |

| `truck.retarderBrake` | int | Retarder level (0-3) |3. Try restarting PCExample response:

| `truck.airPressure` | float | Air pressure (PSI) - for ABS logic |

```json

### Job Information

### Weird display on phone{

| Property | Type | Description |

|----------|------|-------------|1. Refresh browser (pull down in Safari)  "game": {

| `job.sourceCity` | string | Departure city |

| `job.destinationCity` | string | Destination city |2. Try landscape mode    "connected": true,

| `job.cargo` | string | Cargo name |

| `job.mass` | float | Cargo weight (kg) |3. Clear Safari cache    "paused": false,

| `trailer.name` | string | Trailer/cargo name (fallback) |

| `trailer.mass` | float | Trailer weight (kg) |    "gameName": "ETS2",

| `trailer.attached` | bool | Trailer connection status |

---    "time": "0001-01-08T21:09:00Z"

## 🎨 Customization Guide

  },

### Changing Colors

## 📁 Files  "truck": {

Edit the CSS in `index.html` around line 170-240:

    "speed": 85.5,

```css

/* Warning Light Colors */- `ARK-Dashboard.bat` - Main launcher (double-click this!)    "engineRpm": 1450,

.warning-light.parking-brake.active {

    background: linear-gradient(145deg, #0066ff, #0044cc); /* Blue */- `server.js` - Node.js server    "gear": 8,

    border-color: #0088ff;

    box-shadow: 0 0 12px rgba(0, 102, 255, 0.4); /* Subtle glow */- `index.html` - Dashboard interface    "fuel": 450.2,

}

- `package.json` - Dependencies    "fuelCapacity": 700,

.warning-light.low-fuel.active {

    background: linear-gradient(145deg, #ff3300, #cc0000); /* Red */    "make": "Scania",

}

```---    "model": "R"



### Adjusting Shift Light Thresholds  },



Find the gear display logic in `index.html` around line 1125:## 🎯 How It Works  "job": {



```javascript    "sourceCity": "Berlin",

// Current thresholds for trucks

if (rpmPercentage > 97) {```    "destinationCity": "Praha",

    // Flashing red (redline) - starts at 97% of max RPM

    gearDisplay.classList.add('redline');ETS2/ATS → Funbit (port 25555) → Your Server (port 3000) → Browser    "cargo": "Furniture",

} else if (rpmPercentage > 92) {

    // Solid red (high RPM) - starts at 92% of max RPM                                        ↓    "income": 15420

    gearDisplay.classList.add('shift-light');

}                                   WebSocket (10 Hz)  }



// Example: For a truck with 2500 RPM max:                                        ↓}

// - Solid red at: 2500 × 0.92 = 2300 RPM

// - Flashing red at: 2500 × 0.97 = 2425 RPM                                 PC/Phone/Tablet```



// Adjust these percentages to your preference:```

// Aggressive: 90% and 95%

// Conservative: 95% and 98%#### GET /api/status

```

1. Game shares data with Funbit's pluginReturns server status information.

### Modifying ABS/TCS Logic

2. Funbit exposes HTTP API

Find around line 1015-1030:

3. Your server polls API every 100ms### WebSocket

```javascript

// ABS: Active when hard braking at speed4. WebSocket streams data to dashboardConnect to `ws://localhost:3000` to receive real-time updates.

const truckSpeed = (data.truck?.speed || 0) * 3.6; // m/s to km/h

const absActive = (data.truck?.gameBrake || 0) > 0.5 &&  // Brake > 50%5. Dashboard updates 10 times per second

                 truckSpeed > 30 &&                      // Speed > 30 km/h

                 (data.truck?.airPressure || 0) > 65;    // Air pressure sufficientThe server broadcasts telemetry data every 100ms (10 Hz) to all connected clients.



// TCS: Active during wheel spin---

const rpmPercent = (data.truck?.engineRpm || 0) / (data.truck?.engineRpmMax || 1);

const tcsActive = (data.truck?.gameThrottle || 0) > 0.6 &&  // Throttle > 60%## 🎨 Customizing Your Dashboard

                 truckSpeed < 50 &&                         // Speed < 50 km/h

                 rpmPercent > 0.7 &&                        // RPM > 70%## 🔥 Pro Tips

                 (data.truck?.gear || 0) > 0;               // In forward gear

```Your dashboard is in `index.html`. You have complete freedom to:



### Changing Fonts- **Second Monitor:** Open dashboard on monitor 2, game on monitor 1



The dashboard uses Google Fonts. Edit around line 14:- **iPhone App:** Add to Home Screen for full-screen experience- Change the design, colors, layout



```html- **Auto-start:** Copy launcher to Windows Startup folder- Add new gauges and indicators

<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;600;700;800;900&family=Rajdhani:wght@500;600;700&display=swap" rel="stylesheet">

- **Multiple Devices:** Connect phone, tablet, and PC simultaneously!- Show/hide specific data

<!-- Try other automotive fonts: -->

<!-- Electrolize: -->- Add animations and effects

<!-- https://fonts.googleapis.com/css2?family=Electrolize&display=swap -->

<!-- Audiowide: -->---- Use any CSS framework (Bootstrap, Tailwind, etc.)

<!-- https://fonts.googleapis.com/css2?family=Audiowide&display=swap -->

```- Add your own JavaScript logic



### Adding Custom Warning Lights## 📊 Performance



1. **Add HTML** in the warning grid (around line 850):### Example: Adding a New Gauge



```html- Update Rate: 10 Hz (100ms)```html

<div class="warning-light my-custom" id="my-custom">

    <svg viewBox="0 0 24 24" fill="currentColor">- CPU Usage: <1%<div class="gauge custom">

        <!-- Your SVG icon here -->

        <circle cx="12" cy="12" r="8"/>- Memory: ~50 MB    <div class="gauge-value" id="custom-value">0</div>

    </svg>

    <div class="warning-label">Custom</div>- Network: ~20 KB/s    <div class="gauge-label">CUSTOM</div>

</div>

```- Latency: <100ms over Wi-Fi</div>



2. **Add CSS** styling (around line 240):```



```css---

.warning-light.my-custom svg { 

    color: #ff00ff; /* Icon color when inactive */```javascript

}

## 📝 Versionfunction updateDashboard(data) {

.warning-light.my-custom.active {

    background: linear-gradient(145deg, #ff00ff, #cc00cc);    // Your custom logic here

    border-color: #ff44ff;

    box-shadow: 0 0 12px rgba(255, 0, 255, 0.4);- Dashboard: v2.0    document.getElementById('custom-value').textContent = 

}

```- Features: ABS/TCS simulation, 180° steering, turn signals        Math.round(data.truck.speed * 0.621371); // MPH conversion



3. **Add JavaScript** logic (around line 1010):- Mobile: iPhone 14 Pro Max optimized}



```javascript- Server: Express + WebSocket```

// Example: Activate when cruise control is on

updateWarningLight('my-custom', data.truck?.cruiseControlOn || false);

```

---## 📂 Project Structure

## 🔧 Troubleshooting



### Dashboard Shows "Disconnected"

**🚛 Happy Trucking! 🛣️**```

**1. Check Funbit Server:**

```bashArk-dash/

# Open browser and visit:

http://localhost:25555*Made for truck simulation enthusiasts*├── server.js           ← Your custom telemetry server

# Should show Funbit dashboard with "Ready" status

```├── index.html          ← Your custom dashboard (main UI)

├── package.json        ← Node.js dependencies

**2. Check Node.js Server:**├── direct-reader.js    ← Console-based telemetry viewer

```bash├── memory-reader.js    ← Memory reader helper module

# Ensure server.js is running└── README.md           ← This file

node server.js```

# Should show "WebSocket server running on port 3000"

# Should show "Polling Funbit server..."## 🔧 Configuration

```

Edit `server.js` to change:

**3. Check Game:**

- Game must be **running** and **driving** (not in menu)```javascript

- Telemetry plugin only works when in-gameconst PORT = 3000;              // Your server port

- Try restarting the game if it was started before Funbitconst FUNBIT_API = 'http://localhost:25555/api/ets2/telemetry';

const POLL_INTERVAL = 100;      // Update rate in milliseconds

### No Data Updating / All Zeros```



**1. Verify Funbit is reading game:**## 🐛 Troubleshooting

- Open `http://localhost:25555` in browser

- Click "Dashboard" tab### "Connection to Funbit server lost"

- Should show live data updating (speed, RPM, etc.)- ✅ Make sure Funbit `Ets2Telemetry.exe` is running

- If not, reinstall the plugin via Funbit's "Install" button- ✅ Check if port 25555 is accessible

- ✅ Verify Funbit server shows "Ready" status

**2. Check server.js console:**

- Should show no errors### "Game not connecting"

- Data should be polling every 100ms- ✅ Make sure the game is actually running

- Look for "Connection to Funbit server lost" messages- ✅ Verify the plugin DLL is installed in your game folder

- ✅ Restart the game if needed

**3. Check browser console (F12):**- ✅ Check Funbit server shows "Connected to simulator"

- Open Developer Tools (F12)

- Go to Console tab### Dashboard shows "Disconnected"

- Look for WebSocket connection errors- ✅ Make sure YOUR server (server.js) is running

- Should show "Connected to telemetry server"- ✅ Check the browser console for errors (F12)

- ✅ Verify WebSocket connection to ws://localhost:3000

**4. Verify game plugin installation:**

- **ETS2**: Check for DLL at:### No data showing

  ```- ✅ Complete the steps above first

  C:\Program Files (x86)\Steam\steamapps\common\Euro Truck Simulator 2\bin\win_x64\plugins\ets2-telemetry-server.dll- ✅ Open http://localhost:3000/api/telemetry in browser to see raw data

  ```- ✅ Check if data.truck exists and has values

- **ATS**: Check for DLL at:

  ```## 🚀 Advanced: Direct Memory Reading (No Funbit)

  C:\Program Files (x86)\Steam\steamapps\common\American Truck Simulator\bin\win_x64\plugins\ets2-telemetry-server.dll

  ```If you want to read directly from shared memory without Funbit server running, you'll need:



### Warning Lights Not Activating1. **Native Node.js module** with Windows API access

2. **Python** (for node-gyp compilation)

**Check data in console:**3. Install `trucksim-telemetry` package

```javascript

// Add this temporarily to updateDashboard function (line 995):**Note**: This is more complex and requires compilation. The current solution (using Funbit API) is simpler and recommended.

console.log('Received data:', data);

## 📚 Telemetry Data Reference

// Check if properties exist:

console.log('Park brake:', data.truck?.parkBrakeOn);Full property reference: https://github.com/Funbit/ets2-telemetry-server/blob/master/Telemetry.md

console.log('Fuel warning:', data.truck?.fuelWarningOn);

```Common properties:

- `truck.speed` - Speed in m/s (multiply by 3.6 for km/h)

**Common issues:**- `truck.engineRpm` - Engine RPM

- Some properties only exist when certain conditions are met- `truck.gear` - Current gear (0 = neutral, negative = reverse)

- ABS/TCS use custom logic (see Customization section)- `truck.fuel` - Current fuel in liters

- Beacon only shows if your truck has one equipped- `truck.cruiseControlOn` - Cruise control status

- Diff lock only shows if your truck has it- `job.income` - Job payment in euros

- `navigation.speedLimit` - Current speed limit

### Mobile Access Not Working

## 🎯 Why This Approach?

**1. Firewall:**

- Allow Node.js through Windows Firewall### Advantages:

- Allow HTTP server (if using http-server or Python)1. ✅ **Full Control** - You own the server code

2. ✅ **No Dependencies** - Just Express + WebSocket

**2. Network:**3. ✅ **Easy to Customize** - Modify anything you want

- PC and phone MUST be on same WiFi network4. ✅ **Learning** - Understand how telemetry works

- Corporate/hotel WiFi may block device-to-device communication5. ✅ **Portable** - Easy to share and deploy



**3. IP Address:**### Limitations:

- Use PC's **local** IP (192.168.x.x), NOT `localhost`- Requires Funbit server running in background (lightweight)

- Find it with: `ipconfig` in PowerShell- Adds one extra hop in data flow (negligible latency)



**4. Port:**## 📝 License

- Ensure port 3000 (WebSocket) and 8080 (HTTP) are not blocked

- Try disabling firewall temporarily to testFree to use, modify, and distribute. Based on the SCS SDK and Funbit's open-source work.



**5. Mobile browser:**## 🤝 Credits

- Clear browser cache

- Try private/incognito mode- **SCS Software** - For Euro Truck Simulator 2 and the SDK

- iOS: Use Safari for best compatibility- **Funbit** - For the original telemetry server and plugin

- Android: Chrome works best- **You** - For building something awesome!



### Shift Light Not Working---



**Check RPM data:****Ready to customize your dashboard? Edit `index.html` and make it yours!** 🚚💨

```javascript
// Add to gear display section:
console.log('RPM:', rpm, 'Max:', maxRpm, 'Percentage:', rpmPercentage);
```

**Verify:**
- You're in a forward gear (not neutral or reverse)
- RPM is actually above 92% of max
- For 2500 RPM max: solid red starts at 2300 RPM
- Flashing red starts at 2425 RPM

### Turn Signals Not Animating

**Check data:**
```javascript
console.log('Left blinker:', data.truck?.blinkerLeftActive);
console.log('Right blinker:', data.truck?.blinkerRightActive);
```

**Common issues:**
- CSS animations may be disabled in browser
- Check if `.active` class is being applied
- Verify blinker data is coming from game (press turn signal in game)

## 📚 Additional Documentation

- **[START_HERE.md](START_HERE.md)** - Beginner's guide with step-by-step setup
- **[TELEMETRY_DATA.md](TELEMETRY_DATA.md)** - Complete API reference with ALL available properties
- **[TELEMETRY_GUIDE.md](TELEMETRY_GUIDE.md)** - Advanced guide for building custom solutions
- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Technical deep dive into system design

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Ideas for Contributions
- 🎨 Additional dashboard themes (light mode, different color schemes)
- 📱 Android-specific optimizations and testing
- 🎮 Support for other simulators (rFactor 2, Assetto Corsa)
- 🌍 Internationalization/translations (Spanish, German, French)
- 📊 Data logging and replay functionality
- 🎵 Sound effects for warnings (beeps, alerts)
- 🗺️ GPS navigation display using game navigation data
- 📈 Performance metrics (fuel economy, distance traveled)
- 🏆 Achievement tracking

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

You are free to:
- ✅ Use commercially
- ✅ Modify
- ✅ Distribute
- ✅ Private use

## 🙏 Acknowledgments

- **[Funbit](https://github.com/Funbit)** for the excellent ETS2 Telemetry Server
- **SCS Software** for Euro Truck Simulator 2 and American Truck Simulator
- **Google Fonts** for Orbitron and Rajdhani typefaces
- The ETS2/ATS modding community for feedback and testing

## 🔗 Useful Links

- **Funbit Telemetry Server**: https://github.com/Funbit/ets2-telemetry-server
- **Funbit Documentation**: https://github.com/Funbit/ets2-telemetry-server/blob/master/Telemetry.md
- **SCS Software**: https://www.scssoft.com/
- **ETS2 on Steam**: https://store.steampowered.com/app/227300/
- **ATS on Steam**: https://store.steampowered.com/app/270880/
- **SCS SDK**: https://modding.scssoft.com/

## 💬 Support & Community

**Having issues?**

1. Check the [Troubleshooting](#-troubleshooting) section above
2. Review the additional documentation files
3. Search [existing issues](../../issues) on GitHub
4. Open a [new issue](../../issues/new) with:
   - Your setup (OS, browser, game version)
   - Steps to reproduce the problem
   - Screenshots if applicable
   - Console errors (F12 → Console tab)

**Want to chat?**
- Join discussions in GitHub Issues
- Share your customizations!

## ⭐ Show Your Support

If you found this project helpful:
- ⭐ **Star** the repository
- 🍴 **Fork** and customize for your needs
- 📢 **Share** with the ETS2/ATS community
- 🐛 **Report bugs** to help improve it
- 💡 **Suggest features** you'd like to see

## 📸 Screenshots

### Desktop View
![Desktop Dashboard](docs/screenshots/desktop.png)

### Mobile View (iPhone)
![Mobile Dashboard](docs/screenshots/mobile.png)

### Warning Lights Active
![Warning Lights](docs/screenshots/warnings.png)

### Shift Light Activated
![Shift Light](docs/screenshots/shift-light.png)

---

**Made with ❤️ for the trucking simulation community**

**Happy Trucking! 🚛💨**

*Last updated: October 21, 2025*
