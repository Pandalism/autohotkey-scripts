#SingleInstance, Force
#NoTrayIcon
SendMode Input
SetWorkingDir, %A_ScriptDir%



; constants:
ethminer := "C:\Users\Pandalism\AppData\Portable\trex-miner\ETH-ethermine.bat"
ethdir := "C:\Users\Pandalism\AppData\Portable\trex-miner\"
msibefore := "C:\Program Files (x86)\Tools\MSI Afterburner\MSIAfterburner.exe -Profile5"
msiafter := "C:\Program Files (x86)\Tools\MSI Afterburner\MSIAfterburner.exe -Profile1"

; ensure have admin rights
full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}

; set nvidia profile to 5, the one with the heavy underclock
Run, %msibefore%
WinWait, ahk_exe MSIAfterburner.exe
Sleep, 500
WinClose, ahk_exe MSIAfterburner.exe

Sleep, 100
RunWait, %ethminer%, %ethdir%
Sleep, 100

Run, %msiafter%
WinWait, ahk_exe MSIAfterburner.exe
Sleep, 500
WinClose, ahk_exe MSIAfterburner.exe