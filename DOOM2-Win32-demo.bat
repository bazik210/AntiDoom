@echo off
setlocal
set DOOMWADDIR=%~dp0game
set HOME=%~dp0

echo ===================================================
echo   DOOM II Win32 - AI Bot Demonstration Mode
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

echo.
echo Launch option:
echo 1 - Start from main menu (select difficulty yourself)
echo 2 - Instant action (jump straight into MAP01)
choice /c 12 /n /m "Launch: "
if errorlevel 2 goto instant

"%~dp0doom2.exe" -res %RES% %DISP% -bot %*
goto end

:instant
"%~dp0doom2.exe" -res %RES% %DISP% -bot -warp 1 %*

:end
