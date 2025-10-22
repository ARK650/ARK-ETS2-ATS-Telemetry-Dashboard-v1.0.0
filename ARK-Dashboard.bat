@echo off
chcp 65001 >nul
:: ARK ETS2/ATS Dashboard Launcher
:: One-click start for PC and phone access

title ARK Dashboard Server
color 0A
mode con: cols=80 lines=35

:MENU
cls
echo.
echo     ================================================================
echo              ARK ETS2/ATS DASHBOARD SERVER
echo     ================================================================
echo.
echo     [1] Start Dashboard (Opens in Browser)
echo     [2] Start Server Only (For Phone Use)
echo     [3] Show Network IP (For Phone Connection)
echo     [4] Phone Connection Helper (QR Code)
echo     [5] Stop Server
echo     [6] Exit
echo.
echo     ================================================================
echo.
set /p choice="     Select option (1-6): "

if "%choice%"=="1" goto START_BROWSER
if "%choice%"=="2" goto START_ONLY
if "%choice%"=="3" goto SHOW_IP
if "%choice%"=="4" goto PHONE_HELPER
if "%choice%"=="5" goto STOP_SERVER
if "%choice%"=="6" goto EXIT
goto MENU

:START_BROWSER
cls
echo.
echo     ================================================================
echo              STARTING DASHBOARD...
echo     ================================================================
echo.

:: Kill any existing node processes first
taskkill /F /IM node.exe >nul 2>&1

:: Start server in background
start /B node server.js

:: Wait for server to initialize
echo     [*] Initializing server...
timeout /t 3 /nobreak >nul

:: Open browser
echo     [*] Opening dashboard in browser...
start http://localhost:8080/index.html

echo.
echo     ================================================================
echo              DASHBOARD STARTED SUCCESSFULLY!
echo     ================================================================
echo.
echo     [PC] Access:
echo        http://localhost:8080/index.html
echo.

:: Get and show network IP
setlocal enabledelayedexpansion
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4 Address"') do (
    set ip=%%a
    set ip=!ip: =!
    if not "!ip!"=="" if not "!ip!"=="127.0.0.1" (
        echo     [Phone/Tablet] Access:
        echo        http://!ip!:8080/index.html
    )
)
endlocal

echo.
echo     ================================================================
echo.
echo     [!] KEEP THIS WINDOW OPEN
echo        Server is running in the background
echo        Close this window or press Ctrl+C to stop
echo.
echo     Press any key to return to menu...
pause >nul
goto MENU

:START_ONLY
cls
echo.
echo     ================================================================
echo              STARTING SERVER...
echo     ================================================================
echo.

:: Kill any existing node processes first
taskkill /F /IM node.exe >nul 2>&1

:: Start server and show output
echo     Server starting...
echo.
node server.js
echo.
echo     Server stopped!
echo.
pause
goto MENU

:SHOW_IP
cls
echo.
echo     ================================================================
echo              NETWORK IP ADDRESS
echo     ================================================================
echo.
echo     Use this URL on your phone/tablet:
echo.

setlocal enabledelayedexpansion
set found=0
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4 Address"') do (
    set ip=%%a
    set ip=!ip: =!
    if not "!ip!"=="" if not "!ip!"=="127.0.0.1" (
        echo        http://!ip!:8080/index.html
        set found=1
    )
)

if !found!==0 (
    echo        [X] No network connection found!
    echo        Make sure you're connected to Wi-Fi
)
endlocal

echo.
echo     ================================================================
echo.
echo     [iPhone Setup]:
echo        1. Connect iPhone to same Wi-Fi as this PC
echo        2. Open Safari and enter the URL above
echo        3. Tap Share -^> Add to Home Screen (optional)
echo.
echo     ================================================================
echo.
pause
goto MENU

:PHONE_HELPER
cls
echo.
echo     ================================================================
echo              PHONE CONNECTION HELPER
echo     ================================================================
echo.
echo     Opening phone connection page with QR code...
echo.

:: Check if server is running
tasklist /FI "IMAGENAME eq node.exe" 2>NUL | find /I /N "node.exe">NUL
if not "%ERRORLEVEL%"=="0" (
    echo     [!] Server is not running!
    echo     Please start the server first (option 1 or 2^)
    echo.
    pause
    goto MENU
)

start http://localhost:8080/connect.html

echo     [OK] Connection page opened in browser
echo.
echo     You can:
echo     - Scan the QR code with your phone
echo     - Copy the URL to send to your phone
echo.
pause
goto MENU

:STOP_SERVER
cls
echo.
echo     ================================================================
echo              STOPPING SERVER...
echo     ================================================================
echo.

taskkill /F /IM node.exe >nul 2>&1

if %errorlevel%==0 (
    echo     [OK] Server stopped successfully!
) else (
    echo     [i] No server was running
)

echo.
pause
goto MENU

:EXIT
cls
echo.
echo     ================================================================
echo              SHUTTING DOWN...
echo     ================================================================
echo.

:: Stop server before exiting
taskkill /F /IM node.exe >nul 2>&1

echo     [OK] Server stopped
echo     Goodbye!
echo.
timeout /t 2 >nul
exit
