$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$src = Join-Path $root 'src\linuxdoom-1.10'
$out = Join-Path $root 'doom2.exe'
$files = Get-ChildItem $src -Filter '*.c' | Where-Object { $_.Name -notin @('i_video.c','i_system.c','i_sound.c','i_net.c','z_zone.c','i_video_win32.c','i_system_win32.c','i_sound_win32.c','i_net_win32.c','z_zone_win32.c') }
$files += Get-Item (Join-Path $src 'i_video_win32.c'), (Join-Path $src 'i_system_win32.c'), (Join-Path $src 'i_sound_win32.c'), (Join-Path $src 'i_net_win32.c'), (Join-Path $src 'z_zone_win32.c')
$args = @('-O2','-DNORMALUNIX','-D_WIN32','-D_CRT_SECURE_NO_WARNINGS','-I', $src, '-include', (Join-Path $src 'win32_compat.h'))
$args += $files.FullName
$args += @('-o',$out,'-luser32','-lgdi32','-lwinmm','-lws2_32','-lm')
& gcc @args
if ($LASTEXITCODE -ne 0) { throw "gcc failed with exit code $LASTEXITCODE" }
Write-Host "Built $out"
