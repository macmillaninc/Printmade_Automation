@if (@CodeSection == @Batch) @then

@echo off

rem If you have an error when you running this batch, please make sure it's running under admin auth

rem bitsadmin downloading process
rem bitsadmin /transfer Printmade3_setup /download /priority high http://www.nagosoft.com/install/installers/Printmade3_setup.exe c:\Printmade3_setup.exe

rem Since bitsadmin is too slow to download the file, now using powershell.
powershell -command "(new-object System.Net.WebClient).DownloadFile('http://nagosoft.com/install/installers/Printmade3_setup.exe', 'c:\Printmade3_setup.exe')"

rem $url = "http://nagosoft.com/install/installers/Printmade3_setup.exe"
rem $output = "C:\Printmade3_setupl.exe"

rem Start-BitsTransfer -Source $url -Destination $output

rem Use %SendKeys% to send keys to the keyboard buffer
set SendKeys=CScript //nologo //E:JScript "%~F0"

rem Start the other program

rem - Following script doesn't have any error checking

START "" C:\Printmade3_setup.exe

ping -n 3 -w 1 127.0.0.1 > NUL

%SendKeys% "Y"

ping -n 5 -w 1 127.0.0.1 > NUL

%SendKeys% "{ENTER}"

ping -n 4 -w 1 127.0.0.1 > NUL

%SendKeys% "{ENTER}"

ping -n 5 -w 1 127.0.0.1 > NUL

%SendKeys% "{ENTER}"
START /b "" cmd /c DEL "c:\Printmade3_AutoInstall.bat" /f
%SendKeys% "{ENTER}"
ping -n 2 -w 1 127.0.0.1 > NUL
%SendKeys% "{ENTER}"
START /b "" cmd /c del %0 /f && EXIT

goto :EOF

@end

// JScript section

var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));
