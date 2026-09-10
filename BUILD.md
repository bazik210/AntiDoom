# Build Instructions for AntiDoom Win32 Port

**AntiDoom** is a native Win32 source port based on the original `linuxdoom-1.10` codebase, compiled with MinGW-w64 GCC.

---

## 1. Prerequisites

To build this project on Windows, you need a **GCC (MinGW-w64)** toolchain installed:

- **Strawberry Perl** (includes MinGW-w64 GCC by default in `C:\Strawberry\c\bin` or `E:\Soft\Strawberry\c\bin`)
- **MSYS2** (`pacman -S mingw-w64-x86_64-gcc`)
- **w64devkit** or standalone **MinGW-w64** distribution

Verify compiler availability from a terminal:
```cmd
gcc --version
```

---

## 2. Build Methods

### Method 1: 1-Click Batch Build (Recommended)
Simply double-click:
```text
build_win32.bat
```
This batch script automatically locates the GCC compiler, compiles all source modules, reports status, and leaves the window open for review.

### Method 2: Via PowerShell
From the repository root:
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\build_win32.ps1
```

### Method 3: Direct GCC Compilation (Manual Command Line)
To compile the binary in a single command using GCC directly:
```cmd
gcc -O2 -DNORMALUNIX -D_WIN32 -D_CRT_SECURE_NO_WARNINGS -I src/linuxdoom-1.10 -include src/linuxdoom-1.10/win32_compat.h src/linuxdoom-1.10/*.c -o antidoom.exe -luser32 -lgdi32 -lwinmm -lws2_32 -lm
```
*(Note: `build_win32.ps1` and `build_win32.bat` automatically exclude unused Linux platform files like `i_*_linux.c` / `z_zone.c` and compile the Windows implementation modules `*_win32.c`).*

---

## 3. Build Artifact

Upon successful compilation, the executable is created in the project root:
```text
antidoom.exe
```

---

## 4. Diagnostics & Troubleshooting

Every launch generates an execution log in the same directory as `antidoom.exe`:
```text
antidoom.log
```
The log records subsystem startup sequence, discovered IWADs/PWADs, screen canvas dimensions, audio driver initialization (waveOut, MCI MIDI), and any runtime diagnostics.

For gameplay instructions, command-line arguments, and feature guides, see [README.md](README.md) (or [README-RU.md](README-RU.md) for Russian).
