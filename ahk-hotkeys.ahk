#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Constants and locations
mon1 := "C:\Users\Pandalism\AppData\Portable\monitorProfileSwitcher\MonitorSwitcher.exe -load:LeftRight.XML"
mon2 := "C:\Users\Pandalism\AppData\Portable\monitorProfileSwitcher\MonitorSwitcher.exe -load:SmallRight.XML"
mon0 := "C:\Users\Pandalism\AppData\Portable\monitorProfileSwitcher\MonitorSwitcher.exe -load:Main.XML"
monDir := "C:\Users\Pandalism\AppData\Portable\monitorProfileSwitcher\"

; Variables
toggle = 0
monToggle = 0

; ===============================================
; YACReader touch screen page turner
; ===============================================
#IfWinActive ahk_exe YACReader.exe
	;Forces following to code to only work when win is active
	~LButton::
		MouseGetPos, MouseX, MouseY ; Get mouse position
		WinGetPos, , ,Width, , A  ; Get active client window width and heigth
		FQuarter := (Width/4) ; find left hand quarter size
		LQuarter := (Width - FQuarter) ; find right hand quarter size
		if (MouseX < FQuarter) ; if in the left hand side
		{
			send {Left} ; send left key
		} 
		else if (MouseX > LQuarter) ; if in the right hand side
		{
			send {Right} ; send right key
		}
		Return

; ===============================================
; Minecraft win10 beta hotkey help
; ===============================================
#IfWinActive, Minecraft: Windows 10 Edition Beta, 
	#LButton::Send % "{Click " . ( GetKeyState("LButton") ? "Up}" : "Down}" )

    #RButton::
 		Toggle := !Toggle
     	While Toggle{
        	Send Click
        	sleep 200
    		}
    	Return

#IfWinActive ;revert hotkey control to all spaces

; ===============================================
; Hotkeys for Windows Managment
; ===============================================
; Hotkey to flip monitor setup
#g::
	Switch monToggle
	{
	Case 0:
		monToggle := 1
		Run, %mon1%, %monDir%
	Case 1:
		monToggle := 2
		Run, %mon2%, %monDir%
	Case 2:
		monToggle := 0
		Run, %mon0%, %monDir%
	}
	; https://docs.rainmeter.net/manual/bangs/ <- use to change rainmeter skin
    Return


; ===============================================
; Hotkeys for spanishisms
; ===============================================
; following two hotstrings will replace nhx into ñ, in caps too.
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