#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; following two hotstrings will replace nhx into ñ, in caps too.
; n ñ Ñ
:C?*:nhx::
	Send {U+00F1}
    ToolTip, {U+00F1}
	Return

:C?*:NHX::
	Send {U+00D1}
    ToolTip, {U+00D1}
	Return

; these hotstrings will make vowels with ' spanish accents or "
; a á Á
:C?*:a'x::
	send {U+00E1}
    ToolTip, {U+00E1}
	Return

:C?*:A'X::
	send {U+00C1}
    ToolTip, {U+00C1}
	Return

; e é É
:C?*:e'x::
	send {U+00E9}
    ToolTip, {U+00E9}
	Return

:C?*:E'X::
	send {U+00C9}
    ToolTip, {U+00C9}
	Return

; i í Í
:C?*:i'x::
	send {U+00ED}
    ToolTip, {U+00ED}
	Return

:C?*:I'X::
	send {U+00CD}
    ToolTip, {U+0U+00CD}
	Return

; o ó Ó
:C?*:o'x::
	send {U+00F3}
    ToolTip, {U+00F3}
	Return

:C?*:O'X::
	send {U+00D3}
    ToolTip, {U+00D3}
	Return

; u ú Ú ü Ü
:C?*:u'x::
	Send {U+00FA}
    ToolTip, {U+00FA}
	Return

:C?*:U'X::
	Send {U+00DA}
    ToolTip, {U+00DA}
	Return

:C?*:u"x::
	Send {U+00FC}
    ToolTip, {U+00FC}
	Return

:C?*:U"X::
	Send {U+00DC}
    ToolTip, {U+00DC}
	Return





