#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; following two hotstrings will replace nhx into , in caps too.
; n 
:C?*:nhx::
	Send {U+00F1}
	ToolTip, ñ
	Return

:C?*:NHX::
	Send {U+00D1}
    ToolTip, Ñ
	Return

; these hotstrings will make vowels with ' spanish accents or "
; a 
:C?*:a'x::
	send {U+00E1}
    ToolTip, á
	SetTimer, RemoveToolTip, -1000
	Return

:C?*:A'X::
	send {U+00C1}
    ToolTip, Á
	SetTimer, RemoveToolTip, -1000
	Return

; e 
:C?*:e'x::
	send {U+00E9}
    ToolTip, é
	SetTimer, RemoveToolTip, -1000
	Return

:C?*:E'X::
	send {U+00C9}
    ToolTip, É
	SetTimer, RemoveToolTip, -1000
	Return

; i 
:C?*:i'x::
	send {U+00ED}
    ToolTip, í
	SetTimer, RemoveToolTip, -1000
	Return

:C?*:I'X::
	send {U+00CD}
    ToolTip, Í
	SetTimer, RemoveToolTip, -1000
	Return

; o 
:C?*:o'x::
	send {U+00F3}
    ToolTip, ó
	SetTimer, RemoveToolTip, -1000
	Return

:C?*:O'X::
	send {U+00D3}
    ToolTip, Ó
	SetTimer, RemoveToolTip, -1000
	Return

; u 
:C?*:u'x::
	Send {U+00FA}
    ToolTip, ú
	SetTimer, RemoveToolTip, -1000
	Return

:C?*:U'X::
	Send {U+00DA}
    ToolTip, Ú
	SetTimer, RemoveToolTip, -1000
	Return

:C?*:u"x::
	Send {U+00FC}
    ToolTip, ü
	SetTimer, RemoveToolTip, -1000
	Return

:C?*:U"X::
	Send {U+00DC}
    ToolTip, Ü
	SetTimer, RemoveToolTip, -1000
	Return

RemoveToolTip:
ToolTip
Return

