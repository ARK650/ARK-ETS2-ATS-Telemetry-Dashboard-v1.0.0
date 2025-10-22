# 🚀 START HERE - Complete Beginner's Guide

Welcome! This guide will walk you through setting up the ARK Telemetry Dashboard from scratch, even if you've never done anything like this before.

---

## 📋 What You're Building

A **professional truck dashboard** that displays real-time data from Euro Truck Simulator 2 or American Truck Simulator on any device (computer, tablet, or phone) on your network.

**What it looks like:**
- Speedometer, tachometer, gear display
- 10 warning lights (fuel, ABS, TCS, parking brake, etc.)
- Turn signals with sequential animation
- Progressive shift light (changes color as you approach redline)
- Job information panel
- Realistic truck-style design

---

## ⏱️ Time Required

- **First-time setup:** 15-20 minutes
- **Future launches:** 30 seconds (or **3 clicks** with launcher!)

---

## 🎯 Quick Launch (Windows Users)

**Already have everything installed?**

1. **Double-click `ARK-Dashboard.bat`**
2. **Select option [1]**
3. **Done!** Dashboard opens automatically 🎉

The launcher handles:
- Starting the server
- Opening your browser
- Showing your phone/tablet URL
- Everything automatically!

**First time?** Continue below for full setup instructions.

---

## ✅ Step 1: Install Required Software

### 1.1 Install Euro Truck Simulator 2 or American Truck Simulator

You need one of these games installed on your computer:
- [Euro Truck Simulator 2](https://store.steampowered.com/app/227300/Euro_Truck_Simulator_2/) (Steam)
- [American Truck Simulator](https://store.steampowered.com/app/270880/American_Truck_Simulator/) (Steam)

**Make sure the game runs at least once before continuing.**

### 1.2 Install Node.js

Node.js is required to run the dashboard server.

1. Go to https://nodejs.org/
2. Download the **LTS version** (recommended for most users)
3. Run the installer and follow the prompts
4. **Use default settings** - just keep clicking "Next"

**Verify installation:**
1. Open PowerShell (search for "PowerShell" in Windows Start menu)
2. Type: `node --version`
3. You should see something like `v20.11.0`

If you see an error, restart your computer and try again.

### 1.3 Install Funbit ETS2 Telemetry Server

This is what reads data from the game.

1. Go to https://github.com/Funbit/ets2-telemetry-server/releases
2. Download the latest **ets2-telemetry-server-vX.X.X.zip**
3. Extract the ZIP file to a folder like `C:\ETS2-Telemetry`
4. **Remember this location** - you'll need it later

---

## ✅ Step 2: Download the ARK Dashboard

### 2.1 Get the Files

**Option A: Download ZIP (Easiest)**
1. Click the green **Code** button on GitHub
2. Select **Download ZIP**
3. Extract to a folder like `C:\ARK-Dashboard`

**Option B: Git Clone (If you know Git)**
```bash
git clone https://github.com/YOUR_USERNAME/Ark-dash.git
cd Ark-dash
```

### 2.2 Install Dashboard Dependencies

1. Open PowerShell
2. Navigate to the dashboard folder:
   ```powershell
   cd "C:\ARK-Dashboard"
   ```
3. Install dependencies:
   ```powershell
   npm install
   ```

You should see a progress bar and it will download required packages.

---

## ✅ Step 3: First Launch

### 3.1 Start Funbit Telemetry Server

1. Go to your Funbit folder (e.g., `C:\ETS2-Telemetry`)
2. Double-click **`Ets2Telemetry.exe`**
3. A window will open showing:
   ```
   Server started on port 25555
   ```
4. **Keep this window open**

### 3.2 Start the Game

1. Launch **Euro Truck Simulator 2** or **American Truck Simulator**
2. Load your save game
3. Funbit window should now show:
   ```
   Connected to game: ETS2
   ```

If it doesn't connect:
- Make sure the game is actually running (not just in the main menu)
- Try loading a job or driving a truck
- Check Funbit troubleshooting section below

### 3.3 Start the ARK Dashboard Server

1. Open a **NEW** PowerShell window (don't close the Funbit one)
2. Navigate to your dashboard folder:
   ```powershell
   cd "C:\ARK-Dashboard"
   ```
3. Start the server:
   ```powershell
   node server.js
   ```
4. You should see:
   ```
   WebSocket server running on port 3000
   Polling telemetry from http://localhost:25555/api/ets2/telemetry
   ```

**Keep both windows open** (Funbit + Dashboard server).

### 3.4 Open the Dashboard

1. Open your web browser (Chrome, Firefox, Edge - anything works)
2. Go to: **http://localhost:3000**
3. You should see the dashboard with live data!

---

## ✅ Step 4: Access from Phone/Tablet (Optional)

### 4.1 Find Your Computer's IP Address

1. Open PowerShell
2. Type: `ipconfig`
3. Look for **IPv4 Address** under your active network adapter
4. Example: `192.168.1.100`

### 4.2 Connect from Mobile Device

1. Make sure your phone/tablet is on the **same Wi-Fi network** as your computer
2. On your mobile browser, go to: **http://YOUR_IP:3000**
   - Example: `http://192.168.1.100:3000`
3. Dashboard should load!

**iPhone/iPad Tip:**
- Use **Add to Home Screen** in Safari for a fullscreen app-like experience
- Dashboard is optimized for iPhone 14 Pro Max but works on all devices

---

## 🎮 Using the Dashboard

### What Each Section Shows

#### Top Row (Warning Lights)
1. **Parking Brake** - Red when engaged
2. **Fuel** - Amber when below 15%
3. **Gear Display** - Shows current gear, turns red when time to shift
4. **ABS** - Blue when active (hard braking)
5. **TCS** - Amber when active (wheel slip prevention)

#### Middle Row (Warning Lights)
6. **Engine Brake** - Cyan when active
7. **Trailer** - Green when connected
8. **Beacon** - Amber when rotating light is on
9. **Diff Lock** - Green when engaged
10. **Hazard** - Red when hazard lights active

#### Sequential Turn Signals
- **Left side:** 6 bars light up in sequence
- **Right side:** 6 bars light up in sequence
- **Hazard mode:** Both sides flash together

#### Gauges
- **Speedometer:** Current speed (km/h)
- **Tachometer:** Engine RPM with progressive shift light:
  - **Cyan glow** - Normal operation
  - **Solid red** - 92-97% RPM (shift soon)
  - **Flashing red** - 97%+ RPM (shift NOW!)

#### Center Bars
- **Steering** - Yellow (left/right position)
- **Throttle** - Green (acceleration)
- **Brake** - Red (brake pressure)
- **Clutch** - Blue (clutch pedal)

#### Bottom (Job Panel)
Shows current delivery information:
- Route (city to city)
- Cargo type and weight
- Truck model
- Trailer status

---

## 🔧 Troubleshooting

### Dashboard Shows "Disconnected"

**Cause:** Dashboard can't reach the server

**Solutions:**
1. Make sure `node server.js` is running in PowerShell
2. Check the PowerShell window for errors
3. Try refreshing the browser (F5)
4. Make sure no other app is using port 3000

### Dashboard Shows "No Data"

**Cause:** Server is running but can't get game data

**Solutions:**
1. Make sure **Funbit Telemetry** is running (`Ets2Telemetry.exe`)
2. Make sure the **game is running** and you're driving a truck
3. Check Funbit window shows "Connected to game"
4. Try restarting Funbit
5. Make sure no firewall is blocking port 25555

### Funbit Won't Connect to Game

**Solutions:**
1. Make sure you're actually in-game (not main menu)
2. Try loading a job or driving
3. Restart the game
4. Reinstall Funbit's plugin:
   - Close game and Funbit
   - Delete `plugins` folder in game directory
   - Start Funbit (it will reinstall)
   - Start game

### Mobile Can't Connect

**Solutions:**
1. Verify computer and phone are on **same Wi-Fi network**
2. Double-check the IP address (use `ipconfig` again)
3. Try turning off Windows Firewall temporarily to test
4. Make sure you're using `http://` not `https://`
5. Try a different port (edit `server.js` line 3: `const PORT = 3001;`)

### Warning Lights Don't Work

**Solutions:**
1. Check if game has those features enabled
2. Some lights only work in specific situations:
   - **ABS:** Requires hard braking above 30 km/h
   - **TCS:** Requires heavy throttle at low speed
   - **Trailer:** Only shows when trailer attached
3. Make sure you're using **gameplay inputs** not assists

### Shift Light Activates Too Early/Late

**Solution:**
Edit `index.html` around line 1130:
```javascript
// Change these percentages to your preference
if (rpmPercentage > 97) {  // Flashing red (default 97%)
if (rpmPercentage > 92) {  // Solid red (default 92%)
```

Lower numbers = earlier warning  
Higher numbers = later warning

---

## 🚀 Quick Launch (After Setup)

### Windows Users (Super Easy!)

Double-click **`ARK-Dashboard.bat`** and choose:
- **[1]** Start with browser (recommended)
- **[2]** Server only (for phone use)
- **[3]** Show phone connection URL

**Total time:** ~3 clicks!

### Manual Launch

Once everything is installed, you only need to:

1. **Start Funbit** (`Ets2Telemetry.exe`)
2. **Start Game** (ETS2/ATS)
3. **Start Dashboard Server** (`node server.js` in PowerShell)
4. **Open Browser** (http://localhost:3000)

**Total time:** ~30 seconds

---

## 💡 Pro Tips

### Tip 1: Create Desktop Shortcuts

**For Funbit:**
1. Right-click `Ets2Telemetry.exe` → Create shortcut
2. Move shortcut to Desktop

**For Dashboard:**
1. Create new `.bat` file on Desktop called `Start-Dashboard.bat`
2. Edit it with Notepad:
   ```batch
   cd "C:\ARK-Dashboard"
   node server.js
   pause
   ```
3. Double-click to start server instantly

### Tip 2: Auto-Start on Boot

Use Windows Task Scheduler to start Funbit and dashboard when PC boots.

### Tip 3: Browser Fullscreen

Press **F11** in browser for immersive fullscreen experience.

### Tip 4: Mobile Home Screen

On iPhone:
1. Open dashboard in Safari
2. Tap **Share** button
3. Select **Add to Home Screen**
4. Icon appears like a native app!

### Tip 5: Monitor Placement

Use a second monitor or tablet next to your wheel for perfect sim racing setup.

---

## 📖 Next Steps

Once you're comfortable:

- **Customize Colors:** See [README.md](README.md#customization) for color changes
- **Adjust Shift Light:** Tune RPM thresholds to your driving style
- **Add Features:** Explore `index.html` to add your own gauges
- **Learn More:** Read [ARCHITECTURE.md](ARCHITECTURE.md) to understand how it works
- **Explore Data:** Check [TELEMETRY_DATA.md](TELEMETRY_DATA.md) for all available properties

---

## ❓ Still Having Issues?

1. **Read the full README:** [README.md](README.md)
2. **Check troubleshooting:** Detailed solutions in README
3. **Funbit Documentation:** https://github.com/Funbit/ets2-telemetry-server
4. **Create GitHub Issue:** Describe your problem with screenshots

---

## 🎉 You're All Set!

Enjoy your professional truck dashboard!

**Happy trucking! 🚛**

---

*Last updated: October 21, 2025*
