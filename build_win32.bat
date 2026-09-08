@echo off
setlocal

echo ===================================================
echo   DOOM II Win32 Port - Build Script
echo ===================================================
echo.

:: Check if gcc is available in PATH
where gcc >nul 2>nul
if %errorlevel% neq 0 (
    if exist "E:\Soft\Strawberry\c\bin\gcc.exe" (
        set "PATH=E:\Soft\Strawberry\c\bin;%PATH%"
    ) else if exist "C:\msys64\mingw64\bin\gcc.exe" (
        set "PATH=C:\msys64\mingw64\bin;%PATH%"
    ) else (
        echo [ERROR] GCC compiler not found in PATH!
        echo Please install MinGW-w64 or add GCC to your system PATH.
        echo See BUILD.md for detailed setup instructions.
        goto :failed
    )
)

echo [1/2] Checking compiler...
gcc --version | findstr /i "gcc"
echo.

echo [2/2] Building doom2.exe...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0build_win32.ps1"
if %errorlevel% neq 0 goto :failed

echo.
echo ===================================================
echo   [SUCCESS] doom2.exe has been built successfully!
echo ===================================================
goto :done

:failed
echo.
echo ===================================================
echo   [ERROR] Build failed! Check messages above.
echo ===================================================
echo.
pause
exit /b 1

:done
echo.
:: If launched by double-clicking from Explorer, pause so the user sees the success message
echo %cmdcmdline% | findstr /i /c:"/c" >nul
if %errorlevel% equ 0 pause
exit /b 0
