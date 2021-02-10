#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%


; 10 seconds after login
Sleep, 10000
Gosub, delayedStart10

; 30 seconds after login
Sleep, 20000
Gosub, delayedStart30


; 1 minute after startup
Sleep, 30000
Gosub, delayedStart60
Gosub, idle_determine

; 5 minute after startup
Sleep, 240000
Gosub, delayedStart5m
Exit

; add programs below for 10, 30, 60, and 300 second delayed launches
delayedStart10:
ToolTip, 10 seconds after login
Return

delayedStart30:
ToolTip, 30 seconds after login
Return

delayedStart60:
ToolTip, 60 seconds after login
Return

delayedStart5m:
ToolTip, 5mins after login
Return

idle_determine:
;check if windows is idle for the first minute seconds
if A_TimeIdlePhysical > 60000 
{
    ToolTip, System is idle
}
Else
{
    sleep 1000
    ToolTip, System is not idle
}
Return


ToolTip, Startup box





idle: