@if (@CodeSection == @Batch) @then

@echo off

rem If you have an error when you running this batch, please make sure it's running under admin auth

rem Use %SendKeys% to send keys to the keyboard buffer
rem %AppActivate% to spot focused window 
rem %AppActivate% is not using in this, WIP.
set SendKeys=CScript //nologo //E:JScript "%~F0"
set AppActivate=CScript //nologo //E:JScript "%~F0"

rem - Following script doesn't have any error checking

rem basic uninstaller location
set uninstaller="C:\Program Files (x86)\Printmade3\unins000.exe"
set uninstaller86="C:\Program Files\Printmade3\unins000.exe"

rem Uninstaller start code
rem START "" "C:\Program Files (x86)\Printmade3\unins000.exe"

if exist %uninstaller% (

echo automatically uninstalling printmade3...
echo stand by for relay...

START "" "C:\Program Files (x86)\Printmade3\unins000.exe"

ping -n 3 -w 1 127.0.0.1 > NUL

%SendKeys% "Y"

ping -n 5 -w 1 127.0.0.1 > NUL

%SendKeys% "{ENTER}"

ping -n 3 -w 1 127.0.0.1 > NUL

%SendKeys% "{ENTER}"

goto :last

) else ( 
	echo There is no Printmade3 on this system.
	echo X86 prox checking...
		if exist %uninstaller86% (
			echo X86 Confirmed.
			START "" "C:\Program Files\Printmade3\unins000.exe"
			ping -n 3 -w 1 127.0.0.1 > NUL
			%SendKeys% "Y"
			ping -n 5 -w 1 127.0.0.1 > NUL
			%SendKeys% "{ENTER}"
			ping -n 3 -w 1 127.0.0.1 > NUL
			%SendKeys% "{ENTER}"
			) else ( echo Printmade3 does not exist.
					goto :last) )
				

:last

echo Job done.

START /b "" cmd /c DEL %0 /f && EXIT

goto :EOF

@end	

// JScript section

var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));
WshShell.AppActivate(WScript.Arguments(0));
