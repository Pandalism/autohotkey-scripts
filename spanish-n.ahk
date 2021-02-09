#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; hotstring replacement for spanish typing
:C*:nhx::
Send {U+00F1}
Return

:C*:NHX::
Send {U+00D1}
Return
