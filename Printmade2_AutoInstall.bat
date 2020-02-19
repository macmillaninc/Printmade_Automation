@if (@CodeSection == @Batch) @then

@echo off

rem reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V EnableLUA /T REG_DWORD /F /D 0

rem If you have an error when you running this batch, please make sure it's running under admin auth

rem bitsadmin downloading process
rem bitsadmin /transfer Printmade2_setup /download /priority high http://www.nagosoft.com/install/installers/Printmade2_setup.exe c:\Printmade2_setup.exe

rem Since bitsadmin is too slow to download the file, now using powershell.
powershell -command "(new-object System.Net.WebClient).DownloadFile('http://nagosoft.com/install/installers/Printmade2_setup.exe', 'c:\Printmade2_setup.exe')"

rem - Following script doesn't have any error checking

rem Use %SendKeys% to send keys to the keyboard buffer
set SendKeys=CScript //nologo //E:JScript "%~F0"

rem Start the other program

START "" C:\Printmade2_setup.exe

ping -n 3 -w 1 127.0.0.1 > NUL

%SendKeys% "Y"

ping -n 5 -w 1 127.0.0.1 > NUL

%SendKeys% "{ENTER}"

ping -n 3 -w 1 127.0.0.1 > NUL

%SendKeys% "{ENTER}"

ping -n 2 -w 1 127.0.0.1 > NUL

del C:\Printmade2_setup.exe /f

START /b "" cmd /c DEL %0 /f && EXIT

goto :EOF

@end

// JScript section

var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));
