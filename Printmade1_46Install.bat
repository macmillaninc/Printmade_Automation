@if (@CodeSection == @Batch) @then

@echo off

rem reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V EnableLUA /T REG_DWORD /F /D 0

rem If you have an error when you running this batch, please make sure it's running under admin auth

rem Following script doesn't have any error checkings
rem An selectable menu which refers to KBSTAR, KEB, KIUP, Citi, KYCI, Dongbu-I, is... perhaps..? required?
rem This script only works on Windows 7, Internet Explorer 11 Env
rem Test has not made in Windows XP, Windows Vista, Windows 8, Windows 8,1 Windows 10
rem Not tested on Internet Explorer 7, 8, 9, 10, 11(only Windows 10's Explorer 11)

rem This script does not support automatic registry configurations on these platforms : Windows 10(IE11), Windows 8,8.1(10~11), Windows 7 (IE 7~10)
rem This script does support automatic registry configurations on Windows 7 IE 11 only

rem Windows PowerShell 1.0
rem https://technet.microsoft.com/en-us/library/hh848793.aspx

rem Windows Powershell 2.0

rem Windows Powershell 3.0 & 4.0

rem Windows Powershell 5.0 (Win10)
rem https://technet.microsoft.com/en-us/library/hh847741.aspx

rem ignore error message by 2>nul
taskkill /im iexplore.exe /f /t 2>nul

rem set win10installcheck=wmic os get version | findstr /i "10"

rem windows 10 version checker 
rem if exist %win10installcheck% (
rem if not exist wmic os get version | findstr /i "10" ( goto :win10install )
rem else ( goto :xpto7install )

rem Use %SendKeys% to send keys to the keyboard buffer
set SendKeys=CScript //nologo //E:JScript "%~F0"

rem setlocal
rem for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
rem if "%version%" == "6.3" goto :xpto7install
rem if "%version%" == "6.2" goto :xpto7install
rem if "%version%" == "6.1" goto :xpto7install
rem if "%version%" == "6.0" goto :xpto7install
rem if "%version%" == "10.0" goto :win10install
rem endlocal

for /f "tokens=2 delims=," %%i in ('wmic os get caption^,version /format:csv') do set os=%%i
echo %os%|find " 10 ">nul && goto :win10install || goto :xpto7install

:win10install
rem Using powershell wget cmdlet for download the .cab file on C:\
call powershell wget http://nagosoft.com/test/PrintmadeActiveX.cab -Outfile C:\PrintmadeActiveX.cab
ping -n 2 127.0.0.1 > nul
rem extrac32 can extract it's cab file 
start /b "" extrac32 C:\PrintmadeActiveX.cab /L "C:\Windows\Downloaded Program Files\" /E /Y
ping -n 2 127.0.0.1 > nul
START "" regsvr32 "C:\Windows\Downloaded Program Files\PrintmadeActiveX.ocx"
rem Powershell V5 unzip-extract command

goto :lastqueue

:xpto7install
rem XP to 7
set downloadurl=http://www.nagosoft.com/test/PrintmadeActiveX.cab
set downloadpath=C:\Windows\Downloaded Program Files\PrintmadeActiveX.cab
set directory=C:\Windows\Downloaded Program Files\
%WINDIR%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "& {Import-Module BitsTransfer;Start-BitsTransfer '%downloadurl%' '%downloadpath%';$shell = new-object -com shell.application;$zip = $shell.NameSpace('%downloadpath%');foreach($item in $zip.items()){$shell.Namespace('%directory%').copyhere($item);};remove-item '%downloadpath%';}"

echo Download complete and extracted to proper directory.
ping -n 2 127.0.0.1 > nul
echo Configuring Internet Explorer Advanced Options tabs.
ping -n 2 127.0.0.1 > nul

rem Windows 7, Internet Explorer 11 Registry
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Zoom" /V ZoomFactor /T REG_DWORD /F /D 100000
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /V UseSWRender /T REG_SZ /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /V Print_Background /T REG_SZ /F /D yes
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /V NoProtectedModeBanner /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{95A57FEB-0909-4FEA-B819-63DA7C4D9E1E}\iexplore\AllowedDomains\*" /F

echo Configuring Internet Explorer Security Levels.
ping -n 2 127.0.0.1 > nul

rem Windows 7, Internet Explorer 11 Registry
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1001 /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1004 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1200 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1201 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1206 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1207 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1208 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1209 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 120A /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 120B /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1400 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1402 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1405 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1406 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1407 /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1408 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1409 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 140A /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1601 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1604 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1605 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1606 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1607 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1608 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1609 /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 160A /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 160B /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1800 /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1802 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1803 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1804 /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1805 /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1806 /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1807 /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1808 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1809 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 180A /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 180B /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 180C /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 180D /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1810 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1812 /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1A00 /T REG_DWORD /F /D 131072
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1A02 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1A03 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1A04 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1A05 /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1A06 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1A10 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 1C00 /T REG_DWORD /F /D 65536
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2000 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2001 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2004 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2005 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2007 /T REG_DWORD /F /D 65536
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2100 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2101 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2102 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2103 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2104 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2105 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2106 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2107 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2108 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2200 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2201 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2300 /T REG_DWORD /F /D 1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2301 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2302 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2302 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2400 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2401 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2402 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2500 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2600 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2700 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2701 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2702 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2703 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2704 /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2707 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2708 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 2709 /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 270B /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 270C /T REG_DWORD /F /D 0
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V 270D /T REG_DWORD /F /D 3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V CurrentLevel /T REG_DWORD /F /D 70912
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /V Flags /T REG_DWORD /F /D 1

:lastqueue
echo Registring the PrintmadeActiveX.ocx on Internet Explorer Addons.
ping -n 1 127.0.0.1 > nul

START "" regsvr32 "C:\Windows\Downloaded Program Files\PrintmadeActiveX.ocx"
rem %AppActivate% 
%SendKeys% "{ENTER}"
%SendKeys% "{ENTER}"

rem ignore error message by 2>nul
taskkill /im regsvr32.exe /f /t 2>nul

echo Work is done.
echo Entering test page...
ping -n 3 127.0.0.1 > nul

if not exist "C:\Program Files (x86)\" ( 
start "" "C:\Program Files\Internet Explorer\iexplore.exe" http://www.nagosoft.com/test/ ) else ( 
start "" "C:\Program Files (x86)\Internet Explorer\iexplore.exe" http://www.nagosoft.com/test/ )

START /b "" cmd /c DEL "c:\PrintmadeActiveX.cab" /f
START /b "" cmd /c DEL %0 /f && EXIT

goto :EOF

@end

// JScript section

var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));
