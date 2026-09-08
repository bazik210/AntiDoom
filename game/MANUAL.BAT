@ECHO OFF
:MENU
CLS
ECHO.
ECHO                   GT Interactive Software Manual Utility
ECHO                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO.
ECHO    Press 1 to print the DOOM II Manual.
ECHO    Press 2 to read the DOOM II Manual.
ECHO    Press 3 to exit this program.
ECHO.
ECHO    You may press [Ctrl] + [Break] at any time to exit this program.
ECHO.
CHOICE /C:123 /T:3,60 /N "Please Enter your selection: "
IF ERRORLEVEL 3 GOTO EXIT
IF ERRORLEVEL 2 GOTO READ_DOOMII
IF ERRORLEVEL 1 GOTO PRINT_DOOMII
GOTO MENU

:READ_DOOMII
TYPE DOOM2.TXT | MORE
PAUSE
GOTO MENU

:PRINT_DOOMII
CLS
ECHO.
ECHO Spooling DOOM II manual to printer buffer, please wait.....
TYPE DOOM2.TXT > PRN
ECHO Œ > PRN
CLS
ECHO.
ECHO.
ECHO Finished.
ECHO.
GOTO MENU

:EXIT
ECHO.
