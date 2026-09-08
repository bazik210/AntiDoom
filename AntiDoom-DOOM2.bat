@echo off
setlocal
cd /d "%~dp0"
set DOOMWADDIR=%~dp0wad
set HOME=%~dp0

echo ===================================================
echo   AntiDoom - DOOM II: Hell on Earth
echo ===================================================
echo.
echo Choose resolution:
echo 1 - 640x480
echo 2 - 800x600
echo 3 - 1280x720
echo 4 - 1920x1080
choice /c 1234 /n /m "Resolution: "
if errorlevel 4 goto r4
if errorlevel 3 goto r3
if errorlevel 2 goto r2
goto r1

:r4
set RES=1920x1080
goto mode
:r3
set RES=1280x720
goto mode
:r2
set RES=800x600
goto mode
:r1
set RES=640x480

:mode
echo.
echo Choose display mode:
echo 1 - Windowed
echo 2 - Fullscreen
choice /c 12 /n /m "Mode: "
if errorlevel 2 (
    set DISP=-fullscreen
) else (
    set DISP=-window
)

"%~dp0antidoom.exe" -iwad "%~dp0wad\DOOM2.WAD" -res %RES% %DISP% %*
