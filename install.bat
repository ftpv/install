@echo off
setlocal
rem Microsoft Visual C++ runtime dependencies only. Run as administrator.
rem This script writes to the Windows runtime folders.

powershell -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/SysWOW64/msvcp140.dll', 'C:\Windows\SysWOW64\msvcp140.dll') }"
if errorlevel 1 exit /b 1

powershell -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/SysWOW64/msvcp140d.dll', 'C:\Windows\SysWOW64\msvcp140d.dll') }"
if errorlevel 1 exit /b 1

powershell -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/SysWOW64/ucrtbased.dll', 'C:\Windows\SysWOW64\ucrtbased.dll') }"
if errorlevel 1 exit /b 1

powershell -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/SysWOW64/vcruntime140.dll', 'C:\Windows\SysWOW64\vcruntime140.dll') }"
if errorlevel 1 exit /b 1

powershell -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/SysWOW64/vcruntime140d.dll', 'C:\Windows\SysWOW64\vcruntime140d.dll') }"
if errorlevel 1 exit /b 1

powershell -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/msvcp140.dll', 'C:\Windows\System32\msvcp140.dll') }"
if errorlevel 1 exit /b 1

powershell -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/msvcp140d.dll', 'C:\Windows\System32\msvcp140d.dll') }"
if errorlevel 1 exit /b 1

powershell -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/ucrtbased.dll', 'C:\Windows\System32\ucrtbased.dll') }"
if errorlevel 1 exit /b 1

powershell -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/vcruntime140.dll', 'C:\Windows\System32\vcruntime140.dll') }"
if errorlevel 1 exit /b 1

powershell -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/vcruntime140d.dll', 'C:\Windows\System32\vcruntime140d.dll') }"
if errorlevel 1 exit /b 1

powershell -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/vcruntime140_1d.dll', 'C:\Windows\System32\vcruntime140_1d.dll') }"
if errorlevel 1 exit /b 1

powershell -NoProfile -Command "& { $ErrorActionPreference = 'Stop'; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ftpv/install/main/System32/vcruntime140_1.dll', 'C:\Windows\System32\vcruntime140_1.dll') }"
if errorlevel 1 exit /b 1

echo Runtime dependency downloads completed.
exit /b 0
