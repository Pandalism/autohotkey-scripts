#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input
SetWorkingDir, %A_ScriptDir%

toggle = 0
winToggle = 0

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


; ===============================================
; Hotkeys for spanishisms
; ===============================================
; following two hotstrings will replace nhx into ñ, in caps too.
:C?*:nhx::
	send ñ
    ToolTip, ñ
	Return

:C?*:NHX::
	send Ñ
    ToolTip, Ñ
	Return

; these hotstrings will make vowels with ' spanish accents
:C?*:u'x::
	send ú
    ToolTip, ú
	Return

:C?*:e'x::
	send é
    ToolTip, é
	Return

:C?*:i'x::
	send í
    ToolTip, í
	Return

:C?*:a'x::
	send á
    ToolTip, á
	Return

:C?*:o'x::
	send ó
    ToolTip, ó
	Return