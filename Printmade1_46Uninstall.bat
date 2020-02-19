@if (@CodeSection == @Batch) @then

@echo off

set p1ocx="C:\Windows\Downloaded Program Files\PrintmadeActiveX.ocx"
rem Use %SendKeys% to send keys to the keyboard buffer
set SendKeys=CScript //nologo //E:JScript "%~F0"

taskkill /im iexplore.exe /f /t 2>nul

start "" regsvr32 -u "C:\Windows\Downloaded Program Files\PrintmadeActiveX.ocx"

%SendKeys% "{ENTER}"
%SendKeys% "{ENTER}"

START /b "" cmd /c del "C:\Windows\Downloaded Program Files\PrintmadeActiveX.inf" /f

del "C:\Windows\Downloaded Program Files\CONFLICT.1\PrintmadeActiveX.ocx"
del "C:\Windows\Downloaded Program Files\CONFLICT.1\PrintmadeActiveX.inf"

del "C:\Windows\Downloaded Program Files\CONFLICT.2\PrintmadeActiveX.ocx"
del "C:\Windows\Downloaded Program Files\CONFLICT.2\PrintmadeActiveX.inf"

del "C:\Windows\Downloaded Program Files\CONFLICT.3\PrintmadeActiveX.ocx"
del "C:\Windows\Downloaded Program Files\CONFLICT.3\PrintmadeActiveX.inf"

%SendKeys% "{ENTER}"
taskkill /im regsvr32.exe /f /t 2>nul

START /b "" cmd /c del "C:\Windows\Downloaded Program Files\PrintmadeActiveX.ocx" /f

if exist %p1ocx%(
taskkill /im iexplore.exe /f /t 2>nul
start /b "" cmd /c del "C:\Windows\Downloaded Program Files\PrintmadeActiveX.ocx" /f )
else ( START /b "" cmd /c DEL %0 /f
goto :EOF )

echo %ERRORLEVEL%
START /b "" cmd /c DEL %0 /f

goto :EOF

@end

// JScript section

var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));
