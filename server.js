/**
 * ═══════════════════════════════════════════════════════════════════════
 *  ARK CUSTOM ETS2/ATS TELEMETRY SERVER
 *  Direct Memory Reader - No External Dependencies Required
 * ═══════════════════════════════════════════════════════════════════════
 * 
 * This server reads telemetry data directly from the Funbit ETS2 Telemetry
 * Server's HTTP API (which reads from shared memory via the plugin DLL).
 * 
 * Benefits:
 * - No Python required
 * - No native module compilation
 * - Uses the official SCS SDK plugin
 * - Full control over your own dashboard
 * - WebSocket + REST API support
 * 
 * Prerequisites:
 * 1. Funbit ETS2 Telemetry Server must be installed (plugin DLL in game folder)
 * 2. Funbit server must be running in background
 * 3. Your game must be running
 */

const express = require('express');
const http = require('http');
const WebSocket = require('ws');
const https = require('https');
const os = require('os');

const app = express();
const server = http.createServer(app);
const wss = new WebSocket.Server({ server });

const PORT = 8080; // Changed to 8080 for better mobile compatibility
const FUNBIT_API = 'http://localhost:25555/api/ets2/telemetry';
const POLL_INTERVAL = 100; // 100ms = 10 updates per second

let currentData = null;
let isGameConnected = false;
let lastUpdateTime = Date.now();

// Serve static files (your dashboard)
app.use(express.static(__dirname));

// CORS headers
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    next();
});

// ═══════════════════════════════════════════════════════════════════════
// REST API ENDPOINTS
// ═══════════════════════════════════════════════════════════════════════

app.get('/api/telemetry', (req, res) => {
    if (currentData) {
        res.json(currentData);
    } else {
        res.json({ 
            error: 'No data available',
            message: 'Make sure Funbit server is running and ETS2/ATS is open'
        });
    }
});

app.get('/api/status', (req, res) => {
    res.json({
        connected: isGameConnected,
        lastUpdate: new Date(lastUpdateTime).toISOString(),
        uptime: process.uptime(),
        clients: wss.clients.size
    });
});

// ═══════════════════════════════════════════════════════════════════════
// WEBSOCKET CONNECTIONS
// ═══════════════════════════════════════════════════════════════════════

wss.on('connection', (ws, req) => {
    const clientIp = req.socket.remoteAddress;
    console.log(`✅ Client connected from ${clientIp} (Total: ${wss.clients.size})`);
    
    // Send current data immediately
    if (currentData) {
        ws.send(JSON.stringify(currentData));
    }
    
    ws.on('error', (error) => {
        console.error('❌ WebSocket error:', error.message);
    });
    
    ws.on('close', () => {
        console.log(`❌ Client disconnected (Remaining: ${wss.clients.size})`);
    });
});

// ═══════════════════════════════════════════════════════════════════════
// TELEMETRY DATA POLLING
// ═══════════════════════════════════════════════════════════════════════

function pollTelemetryData() {
    const httpModule = FUNBIT_API.startsWith('https') ? https : http;
    
    httpModule.get(FUNBIT_API, (res) => {
        let data = '';
        
        res.on('data', (chunk) => {
            data += chunk;
        });
        
        res.on('end', () => {
            try {
                const telemetry = JSON.parse(data);
                
                // Check if game is connected
                const wasConnected = isGameConnected;
                isGameConnected = telemetry.game && telemetry.game.connected;
                
                if (isGameConnected && !wasConnected) {
                    console.log('🎮 ETS2/ATS Connected!');
                    console.log(`   Game: ${telemetry.game.gameName}`);
                    console.log(`   Truck: ${telemetry.truck.make} ${telemetry.truck.model}\n`);
                } else if (!isGameConnected && wasConnected) {
                    console.log('⚠️  Game disconnected\n');
                }
                
                currentData = telemetry;
                lastUpdateTime = Date.now();
                
                // Broadcast to all connected WebSocket clients
                broadcastToClients(telemetry);
                
            } catch (error) {
                console.error('❌ Failed to parse telemetry:', error.message);
            }
        });
        
    }).on('error', (error) => {
        if (isGameConnected) {
            console.error('❌ Connection to Funbit server lost:', error.message);
            console.log('   Make sure Funbit server is running on port 25555\n');
            isGameConnected = false;
        }
    });
}

function broadcastToClients(data) {
    if (wss.clients.size === 0) return;
    
    const message = JSON.stringify(data);
    let sentCount = 0;
    
    wss.clients.forEach((client) => {
        if (client.readyState === WebSocket.OPEN) {
            try {
                client.send(message);
                sentCount++;
            } catch (error) {
                console.error('❌ Failed to send to client:', error.message);
            }
        }
    });
}

// ═══════════════════════════════════════════════════════════════════════
// SERVER STARTUP
// ═══════════════════════════════════════════════════════════════════════

function getLocalIPAddresses() {
    const interfaces = os.networkInterfaces();
    const addresses = [];
    
    for (const name of Object.keys(interfaces)) {
        for (const iface of interfaces[name]) {
            // Skip internal (loopback) and non-IPv4 addresses
            if (iface.family === 'IPv4' && !iface.internal) {
                addresses.push({
                    name: name,
                    address: iface.address
                });
            }
        }
    }
    
    return addresses;
}

server.listen(PORT, '0.0.0.0', () => {
    console.clear();
    console.log('═══════════════════════════════════════════════════════════');
    console.log('  🚚 ARK CUSTOM ETS2/ATS TELEMETRY SERVER');
    console.log('═══════════════════════════════════════════════════════════');
    console.log('📱 LOCAL ACCESS (This PC):');
    console.log(`   http://localhost:${PORT}/index.html`);
    console.log('');
    
    const ipAddresses = getLocalIPAddresses();
    if (ipAddresses.length > 0) {
        console.log('� NETWORK ACCESS (Phone/Tablet):');
        ipAddresses.forEach(ip => {
            console.log(`   http://${ip.address}:${PORT}/index.html`);
            console.log(`   (${ip.name})`);
        });
        console.log('');
        console.log('� TIP: Use any of the above URLs on your phone');
        console.log('   Make sure your phone is on the same Wi-Fi network!');
    } else {
        console.log('⚠️  No network interfaces found');
        console.log('   Make sure you\'re connected to Wi-Fi or LAN');
    }
    
    console.log('═══════════════════════════════════════════════════════════');
    console.log(`🔌 API Endpoints:`);
    console.log(`   GET  /api/telemetry - Current telemetry data`);
    console.log(`   GET  /api/status    - Server status`);
    console.log(`   WS   ws://[ip]:${PORT} - WebSocket stream`);
    console.log('═══════════════════════════════════════════════════════════');
    console.log(`⚙️  Poll Rate:  ${POLL_INTERVAL}ms (${1000/POLL_INTERVAL} Hz)`);
    console.log(`📡 Source:     Funbit API @ ${FUNBIT_API}`);
    console.log('═══════════════════════════════════════════════════════════\n');
    console.log('⏳ Waiting for ETS2/ATS connection...');
    console.log('   1. Make sure Funbit server is running');
    console.log('   2. Start Euro Truck Simulator 2 or American Truck Simulator');
    console.log('   3. Open the dashboard URL above in your browser or phone\n');
    
    // Start polling
    setInterval(pollTelemetryData, POLL_INTERVAL);
    pollTelemetryData(); // Initial poll
});

// Graceful shutdown
process.on('SIGINT', () => {
    console.log('\n\n🛑 Server shutting down...');
    server.close(() => {
        console.log('✅ Server closed');
        process.exit(0);
    });
});
