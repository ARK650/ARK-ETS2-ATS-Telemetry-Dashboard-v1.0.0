# 🚚 ARK Custom ETS2/ATS Telemetry Dashboard

A professional, automotive-style telemetry dashboard for Euro Truck Simulator 2 and American Truck Simulator. Features real-time truck data visualization with a sleek, modern interface optimized for desktop and mobile devices.

![Node.js](https://img.shields.io/badge/node-%3E%3D18.0.0-brightgreen.svg)
![ETS2](https://img.shields.io/badge/ETS2-compatible-orange.svg)
![ATS](https://img.shields.io/badge/ATS-compatible-orange.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

---

## ✨ Features

### 🎨 Modern UI/UX

- **Automotive-style fonts** (Orbitron for numbers, Rajdhani for text)
- **Subtle glows** mimicking real car dashboard lighting (12px blur, 0.4 opacity)
- **Realistic truck-specific SVG icons** for all 10 warning lights
- **Responsive design** - Works perfectly on desktop (1080p/1440p) and mobile (iPhone 14 Pro Max optimized)
- **Dark theme** with ultra-dark background (#0a0a0a) for OLED displays

### 🚦 Real-time Telemetry Display

- **10 Warning Lights Grid**
  - 🅿️ Parking Brake 
  - ⛽ Low Fuel 
  - 🛑 ABS (brake disc with caliper - custom simulation logic)
  - 🔄 TCS/Traction Control (wheel with slip marks - custom simulation)
  - 🔵 Engine Brake/Retarder (engine block with EB marking)
  - 🚛 Trailer Brake (trailer with emphasized brakes)
  - 🚨 Rotating Beacon (dome light with beams)
  - 🔒 Differential Lock (axle with lock icon)

- **Live Input Monitoring**
  - Throttle bar (green gradient with pulse/shine animations)
  - Brake bar (red gradient with pulse/shine animations)
  - Clutch bar (yellow/orange gradient with pulse/shine animations)
  - Real-time percentage display with automotive fonts

- **Steering Wheel Display**
  - Visual rotation indicator (±90° semicircle rotation)
  - Angle display in degrees (LEFT 45° / RIGHT 45° / CENTER)
  - Motion blur effect for smooth, realistic movement
  - Sequential turn signals (6 segments per side + triangular arrows, animated)
  - Hazard light synchronization (both sides blink together)

- **Job Information Panel**
  - Departure city → Destination city
  - Cargo type and weight (in metric tons)
  - Truck manufacturer and model
  - Trailer connection status

### 🔴 Progressive Shift Light System

- **Normal Operation (< 92% RPM)**: Cyan gear display
- **Shift Soon (92-97% RPM)**: Solid red gear display
- **Shift NOW (> 97% RPM)**: Flashing red gear display with 0.6s strobe animation
- Only active in forward gears (disabled in neutral/reverse)
- Tuned for truck engines (typically 1900-2500 RPM max)

### 🎯 Custom Simulation Logic

Since ETS2/ATS don't provide ABS/TCS status directly, we simulate them realistically:

#### ABS (Anti-lock Braking System)
Activates when:
- Brake input > 50%
- Speed > 30 km/h
- Air pressure > 65 PSI

#### TCS (Traction Control System)
Activates when:
- Throttle input > 60%
- Speed < 50 km/h
- RPM > 70% of max
- In forward gear

---

## 🚀 Quick Start

### ⚡ **Easy Method (Windows - Recommended)**

**Just 3 clicks to start!**

1. **Download and unzip** this repository
2. **Double-click `ARK-Dashboard.bat`**
3. **Select option [1] - Start Dashboard**

✨ The launcher automatically:
- Starts the WebSocket server on port 8080
- Opens your browser to the dashboard
- Shows your network IP for phone/tablet access
- Handles everything for you!

**Launcher Options:**
- **[1]** Start Dashboard - Opens in browser automatically (best for PC use)
- **[2]** Start Server Only - For phone-only use, no browser opens
- **[3]** Show Network IP - Get URL for phone/tablet connection
- **[4]** QR Code Connection - Open QR code page for easy mobile scanning
- **[5]** Stop Server - Clean shutdown
- **[6]** Exit

---

### 🛠️ Manual Method (All Platforms)

#### Prerequisites

1. **Euro Truck Simulator 2** or **American Truck Simulator**
2. **[Funbit ETS2 Telemetry Server](https://github.com/Funbit/ets2-telemetry-server/releases)** (v3.3.0+)
3. **Node.js 18+** ([Download](https://nodejs.org/))

#### Installation Steps

**Step 1: Install Funbit Telemetry Server**

1. Download latest release from [Funbit's GitHub](https://github.com/Funbit/ets2-telemetry-server/releases)
2. Extract ZIP to folder (e.g., `C:\ETS2-Telemetry`)
3. Run `Ets2Telemetry.exe`
4. Click "Install" to add plugin to game directory
5. Server starts on `http://localhost:25555`
6. Keep it running in background

**Step 2: Install Dashboard Dependencies**

```powershell
# Navigate to dashboard folder
cd "E:\ETS 2\Custom dash\Ark-dash"

# Install Node.js dependencies
npm install
```

**Step 3: Start the WebSocket Server**

```powershell
# Run the server
node server.js
```

You should see:
```
WebSocket server running on port 8080
Polling Funbit server at http://localhost:25555/api/ets2/telemetry
```

**Step 4: Launch the Game**

1. Start **ETS2** or **ATS**
2. Load a save or start new game
3. Start driving!

**Step 5: Open Dashboard**

Open browser and go to:
```
http://localhost:8080
```

---

## 📱 Mobile Access (Phone/Tablet)

### Using the Launcher (Easiest)

1. Start dashboard using `ARK-Dashboard.bat`
2. Select option **[3] - Show Network IP**
3. Copy the URL shown (e.g., `http://192.168.1.100:8080`)
4. On your phone/tablet, connect to **same Wi-Fi** as PC
5. Open browser and enter the URL

**OR use option [4]** for QR code - just scan with your phone camera!

### Manual Method

**Find PC IP Address:**

```powershell
ipconfig
# Look for "IPv4 Address" (e.g., 192.168.1.100)
```

**Connect from Phone:**

```
http://YOUR_PC_IP:8080
```

### iPhone Pro Tip

1. Open dashboard in Safari
2. Tap **Share** button
3. Select **Add to Home Screen**
4. Dashboard opens like a native app (fullscreen, no browser UI)!

**Optimized for:** iPhone 14 Pro Max (430×932px viewport)  
**Works on:** All modern smartphones and tablets

### Mobile Optimization Features

- ✅ iPhone 14 Pro Max fully tested and optimized
- ✅ No scrolling required - everything fits perfectly
- ✅ Black status bars for OLED displays
- ✅ Touch-optimized spacing and sizing
- ✅ Compact layout with reduced gaps (6px)
- ✅ Smaller steering wheel (120px × 75px)
- ✅ Compact input bars (6px padding, 22px height)
- ✅ Side-by-side job panel (no stacking)
- ✅ Landscape and portrait support

---

## 🏗️ Architecture & Data Flow

```
┌─────────────────────────────┐
│   ETS2/ATS Game Process     │
│   (Shared Memory)           │
└──────────────┬──────────────┘
               │
               │ SCS SDK Plugin DLL reads memory
               │ (ets2-telemetry-server.dll)
               ▼
┌─────────────────────────────┐
│  Funbit Telemetry Server    │  Port: 25555
│  (Ets2Telemetry.exe)        │  API: /api/ets2/telemetry
└──────────────┬──────────────┘
               │
               │ HTTP GET requests (every 100ms)
               ▼
┌─────────────────────────────┐
│  Node.js WebSocket Server   │  Port: 8080
│  (server.js)                │  Broadcasts JSON data
└──────────────┬──────────────┘
               │
               │ WebSocket connection (ws://localhost:8080)
               ▼
┌─────────────────────────────┐
│  Dashboard (index.html)     │  Your Browser
│  Real-time Visualization    │  Updates every 100ms
└─────────────────────────────┘
```

### How It Works

1. **ETS2/ATS Game** runs and stores telemetry data in shared memory

2. **Funbit's SCS SDK Plugin** (DLL) reads this memory via official SCS SDK

3. **Funbit Server** exposes the data as a JSON REST API on port 25555

4. **server.js** polls the Funbit API every 100ms and caches the data

5. **server.js** broadcasts updates to all connected browsers via WebSocket

6. **Dashboard (index.html)** receives data and updates the UI in real-time

### Why This Architecture?

- **Game** → No built-in API, data only in memory
- **Funbit** → Trusted, battle-tested solution used by thousands
- **server.js** → Provides WebSocket for real-time updates (faster than polling)
- **Browser** → Can't directly access game memory or local APIs due to CORS/security

---

## 📊 Telemetry Data Reference

See **[TELEMETRY_DATA.md](TELEMETRY_DATA.md)** for complete list of all available properties.

### Core Data Points We Use

| Property | Type | Description | Usage |
|----------|------|-------------|-------|
| `truck.speed` | float | Speed in m/s | Speed calculation (× 3.6 for km/h) |
| `truck.engineRpm` | float | Current RPM | Shift light thresholds |
| `truck.engineRpmMax` | float | Maximum RPM | Shift light calculation |
| `truck.displayedGear` | int | Current gear (-1=R, 0=N, 1-12) | Gear display |
| `truck.forwardGears` | int | Total forward gears | Transmission info |
| `truck.gameSteer` | float | Steering input (-1 to 1) | Steering wheel rotation |
| `truck.gameThrottle` | float | Throttle input (0 to 1) | Throttle bar |
| `truck.gameBrake` | float | Brake input (0 to 1) | Brake bar |
| `truck.gameClutch` | float | Clutch input (0 to 1) | Clutch bar |

### Warning Light States

| Property | Type | Description |
|----------|------|-------------|
| `truck.parkBrakeOn` | bool | Parking brake engaged |
| `truck.fuelWarningOn` | bool | Low fuel warning |
| `truck.blinkerLeftOn` | bool | Left turn signal switch |
| `truck.blinkerRightOn` | bool | Right turn signal switch |
| `truck.blinkerLeftActive` | bool | Left blinker flashing state |
| `truck.blinkerRightActive` | bool | Right blinker flashing state |
| `truck.lightsBeaconOn` | bool | Rotating beacon active |
| `truck.differentialLockOn` | bool | Diff lock engaged |
| `truck.motorBrakeOn` | bool | Engine brake active |
| `truck.retarderBrake` | int | Retarder level (0-3) |
| `truck.airPressure` | float | Air pressure (PSI) - for ABS logic |

### Job Information

| Property | Type | Description |
|----------|------|-------------|
| `job.sourceCity` | string | Departure city |
| `job.destinationCity` | string | Destination city |
| `job.cargo` | string | Cargo name |
| `job.mass` | float | Cargo weight (kg) |
| `trailer.name` | string | Trailer/cargo name (fallback) |
| `trailer.mass` | float | Trailer weight (kg) |
| `trailer.attached` | bool | Trailer connection status |

---

## 🎨 Customization Guide

### Changing Colors

Edit the CSS in `index.html` around line 170-240:

```css
/* Warning Light Colors */
.warning-light.parking-brake.active {
    background: linear-gradient(145deg, #0066ff, #0044cc); /* Blue */
    border-color: #0088ff;
    box-shadow: 0 0 12px rgba(0, 102, 255, 0.4); /* Subtle glow */
}

.warning-light.low-fuel.active {
    background: linear-gradient(145deg, #ff3300, #cc0000); /* Red */
}
```

### Adjusting Shift Light Thresholds

Find the gear display logic in `index.html` around line 1125:

```javascript
// Current thresholds for trucks
if (rpmPercentage > 97) {
    // Flashing red (redline) - starts at 97% of max RPM
    gearDisplay.classList.add('redline');
} else if (rpmPercentage > 92) {
    // Solid red (high RPM) - starts at 92% of max RPM
    gearDisplay.classList.add('shift-light');
}

// Example: For a truck with 2500 RPM max:
// - Solid red at: 2500 × 0.92 = 2300 RPM
// - Flashing red at: 2500 × 0.97 = 2425 RPM

// Adjust these percentages to your preference:
// Aggressive: 90% and 95%
// Conservative: 95% and 98%
```

### Modifying ABS/TCS Logic

Find around line 1015-1030:

```javascript
// ABS: Active when hard braking at speed
const truckSpeed = (data.truck?.speed || 0) * 3.6; // m/s to km/h
const absActive = (data.truck?.gameBrake || 0) > 0.5 &&  // Brake > 50%
                 truckSpeed > 30 &&                      // Speed > 30 km/h
                 (data.truck?.airPressure || 0) > 65;    // Air pressure sufficient

// TCS: Active during wheel spin
const rpmPercent = (data.truck?.engineRpm || 0) / (data.truck?.engineRpmMax || 1);
const tcsActive = (data.truck?.gameThrottle || 0) > 0.6 &&  // Throttle > 60%
                 truckSpeed < 50 &&                         // Speed < 50 km/h
                 rpmPercent > 0.7 &&                        // RPM > 70%
                 (data.truck?.gear || 0) > 0;               // In forward gear
```

### Changing Fonts

The dashboard uses Google Fonts. Edit around line 14:

```html
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;600;700;800;900&family=Rajdhani:wght@500;600;700&display=swap" rel="stylesheet">

<!-- Try other automotive fonts: -->
<!-- Electrolize: -->
<!-- https://fonts.googleapis.com/css2?family=Electrolize&display=swap -->
<!-- Audiowide: -->
<!-- https://fonts.googleapis.com/css2?family=Audiowide&display=swap -->
```

### Adding Custom Warning Lights

1. **Add HTML** in the warning grid (around line 850):

```html
<div class="warning-light my-custom" id="my-custom">
    <svg viewBox="0 0 24 24" fill="currentColor">
        <!-- Your SVG icon here -->
        <circle cx="12" cy="12" r="8"/>
    </svg>
    <div class="warning-label">Custom</div>
</div>
```

2. **Add CSS** styling (around line 240):

```css
.warning-light.my-custom svg { 
    color: #ff00ff; /* Icon color when inactive */
}

.warning-light.my-custom.active {
    background: linear-gradient(145deg, #ff00ff, #cc00cc);
    border-color: #ff44ff;
    box-shadow: 0 0 12px rgba(255, 0, 255, 0.4);
}
```

3. **Add JavaScript** logic (around line 1010):

```javascript
// Example: Activate when cruise control is on
updateWarningLight('my-custom', data.truck?.cruiseControlOn || false);
```

---

## 🔧 Troubleshooting

### Dashboard Shows "Disconnected"

**1. Check Funbit Server:**

```bash
# Open browser and visit:
http://localhost:25555
# Should show Funbit dashboard with "Ready" status
```

**2. Check Node.js Server:**

```bash
# Ensure server.js is running
node server.js

# Should show "WebSocket server running on port 8080"
# Should show "Polling Funbit server..."
```

**3. Check Game:**

- Game must be **running** and **driving** (not in menu)
- Telemetry plugin only works when in-game
- Try restarting the game if it was started before Funbit

### No Data Updating / All Zeros

**1. Verify Funbit is reading game:**

- Open `http://localhost:25555` in browser
- Click "Dashboard" tab
- Should show live data updating (speed, RPM, etc.)
- If not, reinstall the plugin via Funbit's "Install" button

**2. Check server.js console:**

- Should show no errors
- Data should be polling every 100ms
- Look for "Connection to Funbit server lost" messages

**3. Check browser console (F12):**

- Open Developer Tools (F12)
- Go to Console tab
- Look for WebSocket connection errors
- Should show "Connected to telemetry server"

**4. Verify game plugin installation:**

- **ETS2**: Check for DLL at:
  ```
  C:\Program Files (x86)\Steam\steamapps\common\Euro Truck Simulator 2\bin\win_x64\plugins\ets2-telemetry-server.dll
  ```

- **ATS**: Check for DLL at:
  ```
  C:\Program Files (x86)\Steam\steamapps\common\American Truck Simulator\bin\win_x64\plugins\ets2-telemetry-server.dll
  ```

### Warning Lights Not Activating

**Check data in console:**

```javascript
// Add this temporarily to updateDashboard function (line 995)
console.log('Received data:', data);

// Check if properties exist:
console.log('Park brake:', data.truck?.parkBrakeOn);
console.log('Fuel warning:', data.truck?.fuelWarningOn);
```

**Common issues:**

- Some properties only exist when certain conditions are met
- ABS/TCS use custom logic (see Customization section)
- Beacon only shows if your truck has one equipped
- Diff lock only shows if your truck has it

### Mobile Access Not Working

**1. Firewall:**

- Allow Node.js through Windows Firewall
- Run `PHONE-CONNECT-HELPER.bat` to automatically add firewall rule

**2. Network:**

- PC and phone MUST be on same WiFi network
- Corporate/hotel WiFi may block device-to-device communication

**3. IP Address:**

- Use PC's **local** IP (192.168.x.x), NOT `localhost`
- Find it with: `ipconfig` in PowerShell

**4. Port:**

- Ensure port 8080 is not blocked by firewall
- Try disabling firewall temporarily to test

**5. Mobile browser:**

- Clear browser cache
- Try private/incognito mode
- iOS: Use Safari for best compatibility
- Android: Chrome works best

### Shift Light Not Working

**Check RPM data:**

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

---

## 📚 Additional Documentation

- **[START_HERE.md](START_HERE.md)** - Beginner's guide with step-by-step setup
- **[TELEMETRY_DATA.md](TELEMETRY_DATA.md)** - Complete API reference with ALL available properties
- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Technical deep dive into system design

---

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
- 🌍 Internationalization/translations (Spanish, German, French)
- 📊 Data logging and replay functionality
- 🎵 Sound effects for warnings (beeps, alerts)
- 🗺️ GPS navigation display using game navigation data
- 📈 Performance metrics (fuel economy, distance traveled)
- 🏆 Achievement tracking

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

You are free to:
- ✅ Use commercially
- ✅ Modify
- ✅ Distribute
- ✅ Private use

---

## 🙏 Acknowledgments

- **[Funbit](https://github.com/Funbit)** for the excellent ETS2 Telemetry Server
- **SCS Software** for Euro Truck Simulator 2 and American Truck Simulator
- **Google Fonts** for Orbitron and Rajdhani typefaces
- The ETS2/ATS modding community for feedback and testing

---

## 🔗 Useful Links

- **Funbit Telemetry Server**: https://github.com/Funbit/ets2-telemetry-server
- **Funbit Documentation**: https://github.com/Funbit/ets2-telemetry-server/blob/master/Telemetry.md
- **SCS Software**: https://www.scssoft.com/
- **ETS2 on Steam**: https://store.steampowered.com/app/227300/
- **ATS on Steam**: https://store.steampowered.com/app/270880/
- **SCS SDK**: https://modding.scssoft.com/

---

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

---

## ⭐ Show Your Support

If you found this project helpful:
- ⭐ **Star** the repository
- 🍴 **Fork** and customize for your needs
- 📢 **Share** with the ETS2/ATS community
- 🐛 **Report bugs** to help improve it
- 💡 **Suggest features** you'd like to see

---

**Made with ❤️ for the trucking simulation community**

**Happy Trucking! 🚛💨**

*Last updated: October 21, 2025*
