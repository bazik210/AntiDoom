# AntiDoom - Native Win32 Port

**AntiDoom** is a high-performance, modernized native Windows port of the classic `linuxdoom-1.10` codebase, compiled with MinGW-w64 GCC. It brings true widescreen rendering, smooth uncapped framerates, 3D vertical mouselook, high resolution software rendering, jumping, an autonomous AI bot, and modern display ergonomics while preserving the genuine feel and retro aesthetic of the original id Software software renderer.

---

## Key Features

- **True Widescreen (16:9 / 21:9)**:
  - Native 16:9 widescreen software rendering (856x400 canvas) with expanded horizontal FOV.
  - Zero distortion or stretching; eliminates pillarboxing on modern displays and laptops.
  - Perfectly centered menus, intermission stats, story text crawls, and cast screen.
  - Status bar centered with clean seamless stone wings.
  - Optional toggle between True Widescreen (`-widescreen`) and Classic 4:3 (`-nowidescreen`).
- **Smooth Uncapped Framerate**:
  - Optional frame interpolation beyond the classic 35 FPS tickrate for silky-smooth motion.
  - Toggle in real time with `\` key or configure in launcher.
  - Real-time FPS counter overlay toggled with `Backspace`.
- **Full 3D Vertical Mouselook (Freelook)**:
  - Up/down pitch aiming without perspective warp artifacts.
  - Invert mouse and sensitivity settings preserved in `.doomrc`.
- **Jumping**:
  - Dedicated jumping mechanics via `Space` (`-jump`), enabling air control and strafe-jumping.
  - Automatic key remapping: `E` for doors/switches when jump is enabled.
- **Autonomous AI Bot (`-bot`)**:
  - Built-in navigation graph with Dijkstra pathfinding to explore levels, pick up keys, activate doors and switches, and reach the level exit.
  - Target tracking with vertical pitch aiming and weapon selection.
  - Press `F10` at any time to toggle autopilot on/off.
- **Modern Input & Audio**:
  - Mouse wheel menu navigation, left click to select, right click to back out.
  - Native Windows `waveOut` 11025 Hz 8-bit sound effects.
  - Native Windows MCI MIDI music sequencer.
- **Crash Reporting & Diagnostics**:
  - Integrated minidump (`doom2_crash.dmp`) and callstack unwinding via `dbghelp.dll`.
  - Detailed diagnostic logging to `antidoom.log`.

---

## Quick Start

### 1. Graphical Launcher (`launcher.exe` / `AntiDoom-Launcher.bat`)
Launch `launcher.exe` for an interactive setup experience:
- **Bilingual Interface (EN / RU)**: One-click toggle between English and Russian via `[ EN ]` / `[ RU ]` button in the header.
- **Smart IWAD Detection**: Automatically identifies The Ultimate DOOM (4 episodes), DOOM Registered (3 episodes), DOOM Shareware, and DOOM II.
- **Display & Resolution**: Supports Full HD (1080p), 2K, 4K, 16:10, and custom windowed or fullscreen modes.
- **Aspect Ratio**: Toggle between True Widescreen (16:9) and Classic (4:3).
- **Gameplay Options**: Jump, Mouselook, Uncapped FPS, AI Bot, Fast Monsters, Difficulty (1..5), and Warp level selection.
- **Mod Support (PWADs)**: Easily load custom WAD files with the file browser dialog.
- Settings automatically persist in `launcher.ini`.

### 2. Ready-to-Run Batch Scripts
- **`AntiDoom-Launcher.bat`** — Opens the graphical configuration launcher.
- **`AntiDoom-DOOM2.bat`** — Launches DOOM II: Hell on Earth (`wad\DOOM2.WAD`) with resolution and aspect ratio prompts.
- **`AntiDoom-Ultimate.bat`** — Launches The Ultimate DOOM with 4 episodes (`wad\DOOM1.WAD`).
- **`AntiDoom-DOOM1.bat`** — Launches Classic DOOM with 3 episodes (`wad\DOOM.WAD`).
- **`AntiDoom-Demo.bat`** — Launches demonstration mode with the autonomous AI bot active.

### 3. Command Line Usage
```text
antidoom.exe -iwad wad/DOOM2.WAD -res 1920x1080 -fullscreen -widescreen -jump -mlook
antidoom.exe -iwad wad/DOOM1.WAD -res 1280x720 -window -nowidescreen
antidoom.exe -iwad wad/DOOM2.WAD -bot -window
```

---

## In-Game Controls

| Action | Controls |
| :--- | :--- |
| **Movement** | `W`, `A`, `S`, `D` or Arrow keys |
| **Jump** | `Space` (when launched with `-jump` or enabled in launcher) |
| **Use / Open Door** | `E` (when jump is active) or `Space` / `E` (classic mode) |
| **Fire** | `Mouse1` (Left Click) or `Ctrl` |
| **Mouselook (Pitch & Yaw)** | Move mouse (toggle with `-mlook` or `-nomlook`) |
| **Toggle AI Bot** | `F10` (switches between manual control and AI autopilot) |
| **Toggle Smooth FPS** | `\` (toggles 35 FPS cap vs uncapped interpolation) |
| **Toggle FPS Counter** | `Backspace` (displays live render framerate) |
| **Pause Game** | `Pause` key (centers pause banner in widescreen) |
| **Menu Navigation** | `Escape` to toggle; Mouse wheel or `W`/`S` to navigate; `Mouse1` to select; `Mouse2` to return |
| **Intermission Skip** | `Space` or `Mouse1` accelerates stats count |

---

## Command Line Arguments Reference

| Parameter | Description |
| :--- | :--- |
| `-widescreen` | Enables 16:9 widescreen FOV rendering (856x400 internal canvas) |
| `-nowidescreen` | Disables widescreen; forces classic 4:3 FOV (640x400 canvas) with pillarboxing |
| `-res <WIDTH>x<HEIGHT>` | Specifies window/display resolution (e.g. `-res 1920x1080`) |
| `-fullscreen` | Launches in exclusive fullscreen display mode |
| `-window` | Launches in standard windowed mode |
| `-maximized` | Launches in borderless maximized window mode |
| `-jump` | Enables jumping with `Space` and binds Use to `E` |
| `-mlook` / `-nomlook` | Enables or disables vertical mouselook pitch |
| `-bot` | Activates autonomous AI bot autopilot |
| `-smooth` | Enables uncapped framerate interpolation |
| `-fastparm` | Accelerates startup initialization sequence |
| `-iwad <file>` | Path to main IWAD file (`DOOM2.WAD`, `DOOM1.WAD`, `DOOM.WAD`) |
| `-file <pwad>` | Loads custom PWAD modifications |
| `-warp <level>` | Warps directly to level (e.g. `-warp 1` for MAP01, or `-warp 1 1` for E1M1) |

---

## Building from Source

Detailed compilation instructions for MinGW-w64 GCC and MSYS2 are documented in [BUILD.md](BUILD.md).

Quick build command:
```cmd
build_win32.bat
```

---

## Troubleshooting & Diagnostics

- **Log file**: `antidoom.log` is generated on every run, capturing WAD loading, resolution initialization, waveOut audio, and MIDI status.
- **Crash dump**: If an unhandled exception occurs, a minidump `doom2_crash.dmp` is generated alongside a detailed callstack in `antidoom.log`.
- **Russian Documentation**: See [README-RU.md](README-RU.md) and [BUILD-RU.md](BUILD-RU.md).
