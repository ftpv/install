@echo off
setlocal
rem Microsoft Visual C++ x86 runtime DLLs only. Run as administrator.
rem Use --list to inspect the target without downloading files.
set "PS_EXE=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"
set "RUNTIME_DIR=%SystemRoot%\System32"
if defined PROCESSOR_ARCHITEW6432 set "RUNTIME_DIR=%SystemRoot%\SysWOW64"
if /I "%PROCESSOR_ARCHITECTURE%"=="AMD64" set "RUNTIME_DIR=%SystemRoot%\SysWOW64"
if /I "%PROCESSOR_ARCHITECTURE%"=="ARM64" set "RUNTIME_DIR=%SystemRoot%\SysWOW64"
if /I "%~1"=="--list" (
    echo Architecture=x86
    echo Directory=%RUNTIME_DIR%
    exit /b 0
)

"%PS_EXE%" -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/SysWOW64/msvcp140.dll', '%RUNTIME_DIR%\msvcp140.dll') }"
if errorlevel 1 exit /b 1

"%PS_EXE%" -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/SysWOW64/msvcp140d.dll', '%RUNTIME_DIR%\msvcp140d.dll') }"
if errorlevel 1 exit /b 1

"%PS_EXE%" -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/SysWOW64/ucrtbased.dll', '%RUNTIME_DIR%\ucrtbased.dll') }"
if errorlevel 1 exit /b 1

"%PS_EXE%" -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/SysWOW64/vcruntime140.dll', '%RUNTIME_DIR%\vcruntime140.dll') }"
if errorlevel 1 exit /b 1

"%PS_EXE%" -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/SysWOW64/vcruntime140d.dll', '%RUNTIME_DIR%\vcruntime140d.dll') }"
if errorlevel 1 exit /b 1

echo x86 runtime dependency downloads completed.
exit /b 0
