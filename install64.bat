@echo off
setlocal
rem Microsoft Visual C++ x64 runtime DLLs only. Run as administrator.
rem Use --list to inspect the target without downloading files.
set "PS_EXE=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"
set "IS_64BIT="
if defined PROCESSOR_ARCHITEW6432 set "IS_64BIT=1"
if /I "%PROCESSOR_ARCHITECTURE%"=="AMD64" set "IS_64BIT=1"
if not defined IS_64BIT (
    echo This file requires 64-bit Windows. Use install32.bat on 32-bit Windows.
    exit /b 1
)
set "RUNTIME_DIR=%SystemRoot%\System32"
if exist "%SystemRoot%\Sysnative\WindowsPowerShell\v1.0\powershell.exe" set "PS_EXE=%SystemRoot%\Sysnative\WindowsPowerShell\v1.0\powershell.exe"
if /I "%~1"=="--list" (
    echo Architecture=x64
    echo Directory=%RUNTIME_DIR%
    exit /b 0
)

"%PS_EXE%" -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/msvcp140.dll', '%RUNTIME_DIR%\msvcp140.dll') }"
if errorlevel 1 exit /b 1

"%PS_EXE%" -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/msvcp140d.dll', '%RUNTIME_DIR%\msvcp140d.dll') }"
if errorlevel 1 exit /b 1

"%PS_EXE%" -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/ucrtbased.dll', '%RUNTIME_DIR%\ucrtbased.dll') }"
if errorlevel 1 exit /b 1

"%PS_EXE%" -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/vcruntime140.dll', '%RUNTIME_DIR%\vcruntime140.dll') }"
if errorlevel 1 exit /b 1

"%PS_EXE%" -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/vcruntime140d.dll', '%RUNTIME_DIR%\vcruntime140d.dll') }"
if errorlevel 1 exit /b 1

"%PS_EXE%" -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/vcruntime140_1d.dll', '%RUNTIME_DIR%\vcruntime140_1d.dll') }"
if errorlevel 1 exit /b 1

"%PS_EXE%" -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/vcruntime140_1.dll', '%RUNTIME_DIR%\vcruntime140_1.dll') }"
if errorlevel 1 exit /b 1

echo x64 runtime dependency downloads completed.
exit /b 0
