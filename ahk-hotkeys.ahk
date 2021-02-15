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
	ToolTip, ñ
	SetTimer, RemoveToolTip, -1000
	Return

:C?*:NHX::
	Send {U+00D1}
    ToolTip, Ñ
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
	ToolTip, 
	Return