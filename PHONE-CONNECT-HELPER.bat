@echo off
chcp 65001 >nul
title ARK Dashboard - Phone Connection Helper
color 0B
mode con: cols=90 lines=40

cls
echo.
echo     ═══════════════════════════════════════════════════════════════════════════
echo                    ARK DASHBOARD - PHONE CONNECTION HELPER
echo     ═══════════════════════════════════════════════════════════════════════════
echo.
echo     This tool helps you connect your phone/tablet to the dashboard.
echo.
echo     ═══════════════════════════════════════════════════════════════════════════
echo.

:: Get IP Address
echo     [1/4] Finding your PC's IP address...
echo.
setlocal enabledelayedexpansion
set found=0
set ip_address=

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4 Address"') do (
    set ip=%%a
    set ip=!ip: =!
    if not "!ip!"=="" if not "!ip!"=="127.0.0.1" (
        set ip_address=!ip!
        set found=1
        echo     ✅ Found IP Address: !ip!
    )
)

if !found!==0 (
    echo     ❌ ERROR: No network connection found!
    echo.
    echo     Please connect your PC to Wi-Fi or Ethernet first.
    echo.
    pause
    exit
)

echo.
echo     ═══════════════════════════════════════════════════════════════════════════
echo.
echo     [2/4] Checking if server is running...
echo.

:: Check if node is running
tasklist /FI "IMAGENAME eq node.exe" 2>NUL | find /I /N "node.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo     ✅ Server is running
) else (
    echo     ⚠️  Server is NOT running!
    echo.
    echo     Please start the server first:
    echo     - Double-click ARK-Dashboard.bat
    echo     - Select option [1] or [2]
    echo.
    pause
    exit
)

echo.
echo     ═══════════════════════════════════════════════════════════════════════════
echo.
echo     [3/4] Testing firewall...
echo.

:: Test if port 8080 is listening
netstat -an | findstr ":8080" >NUL
if "%ERRORLEVEL%"=="0" (
    echo     ✅ Port 8080 is open and listening
) else (
    echo     ⚠️  Port 8080 might be blocked
)

echo.
echo     Checking Windows Firewall status...
netsh advfirewall show currentprofile state | findstr /C:"State" >NUL
if "%ERRORLEVEL%"=="0" (
    echo     ℹ️  Windows Firewall is active
    echo.
    echo     If your phone can't connect, you may need to:
    echo     1. Allow Node.js through Windows Firewall (see below)
    echo     2. Or temporarily disable Windows Firewall to test
)

echo.
echo     ═══════════════════════════════════════════════════════════════════════════
echo.
echo     [4/4] CONNECTION INSTRUCTIONS FOR YOUR PHONE
echo.
echo     ═══════════════════════════════════════════════════════════════════════════
echo.
echo     📱 ON YOUR PHONE/TABLET:
echo.
echo     1. Connect to the SAME Wi-Fi network as this PC
echo        Your PC Wi-Fi: Check your Wi-Fi name in Windows settings
echo.
echo     2. Open your web browser (Safari, Chrome, etc.)
echo.
echo     3. Type this URL EXACTLY:
echo.
echo        ┌────────────────────────────────────────────────────────────────┐
echo        │                                                                │
echo        │          http://!ip_address!:8080/index.html                  │
echo        │                                                                │
echo        └────────────────────────────────────────────────────────────────┘
echo.
echo     4. Press Enter/Go
echo.
echo     ═══════════════════════════════════════════════════════════════════════════
echo.
echo     🔥 TROUBLESHOOTING - If it doesn't work:
echo.
echo     A. ALLOW THROUGH FIREWALL (Recommended):
echo        1. Open Windows Settings
echo        2. Go to: Update ^& Security → Windows Security → Firewall
echo        3. Click "Allow an app through firewall"
echo        4. Click "Change settings" (requires admin)
echo        5. Find "Node.js" in the list
echo        6. Check BOTH "Private" and "Public" boxes
echo        7. Click OK
echo        8. Try connecting from phone again
echo.
echo     B. QUICK TEST (Temporarily disable firewall):
echo        1. Open Windows Security
echo        2. Go to Firewall ^& network protection
echo        3. Click your active network (Private/Public)
echo        4. Turn OFF Windows Defender Firewall
echo        5. Try connecting from phone
echo        6. If it works, turn firewall back ON and use option A above
echo.
echo     C. CHECK WI-FI NETWORK:
echo        - Make sure phone and PC are on the SAME Wi-Fi network
echo        - Some routers have "client isolation" enabled (blocks devices)
echo        - Try using a mobile hotspot instead
echo.
echo     D. TRY DIFFERENT BROWSER:
echo        - Safari (iPhone)
echo        - Chrome (Android)
echo        - Firefox
echo.
echo     ═══════════════════════════════════════════════════════════════════════════
echo.
echo     💡 TIP: Want to test on this PC first?
echo        Open browser and go to: http://localhost:8080/index.html
echo.
echo     ═══════════════════════════════════════════════════════════════════════════
echo.
echo     Press any key to add firewall rule automatically (requires admin)...
pause >nul

echo.
echo     ═══════════════════════════════════════════════════════════════════════════
echo     [ADMIN] Adding Windows Firewall Rule...
echo     ═══════════════════════════════════════════════════════════════════════════
echo.

:: Try to add firewall rule (requires admin)
netsh advfirewall firewall add rule name="ARK Dashboard - Node.js Port 8080" dir=in action=allow protocol=TCP localport=8080 >NUL 2>&1

if "%ERRORLEVEL%"=="0" (
    echo     ✅ Firewall rule added successfully!
    echo.
    echo     Port 8080 is now allowed through Windows Firewall.
    echo     Try connecting from your phone now.
) else (
    echo     ⚠️  Could not add firewall rule automatically.
    echo.
    echo     Please run this file as Administrator:
    echo     1. Right-click on this file
    echo     2. Select "Run as administrator"
    echo     3. Click Yes on the prompt
    echo.
    echo     Or manually allow Node.js through firewall (see instructions above)
)

echo.
echo     ═══════════════════════════════════════════════════════════════════════════
echo.
echo     Your connection URL again:  http://!ip_address!:8080/index.html
echo.
echo     ═══════════════════════════════════════════════════════════════════════════
echo.
pause
endlocal
