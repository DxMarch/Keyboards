norwegian_QWERTY_ID :=  "00000414"  ; Norwegian QWERTY layout identifier
norwegian_QWERTY := DllCall("LoadKeyboardLayout", "Str", norwegian_QWERTY_ID, "Int", 1)
norwegian_Colemak_ID := "00001414"  ; Norwegian Colemak layout identifier
norwegian_Colemak := DllCall("LoadKeyboardLayout", "Str", norwegian_Colemak_ID, "Int", 1)
isSwitching := false

#IfWinActive ahk_exe Obsidian.exe

~Alt::
~RAlt::
~Ctrl::
    if (!isSwitching) {
        isSwitching := true
        PostMessage, 0x50, 0, norwegianQWERTY,, A
    }
    return

~Alt Up::
~RAlt Up::
~Ctrl Up::
    if (isSwitching) {
        isSwitching := false

        ; Switch back to the default layout for the current thread
        DllCall("ActivateKeyboardLayout", "UInt", norwegian_Colemak, "UInt", 0)

        ; Add a small delay to ensure the layout change has taken effect
        Sleep, 100

        test := DllCall("GetKeyboardLayout", "UInt", 0)
        ToolTip, After Release: %test%
        Sleep, 500  ; Display the tooltip for 0.5 second
        ToolTip  ; Clear the tooltip
    }
    return

; Go back to layout when tabbing out of Obsidian
!Tab:: 
    DllCall("ActivateKeyboardLayout", "UInt", defaultLayout, "UInt", 0)
    Send, {Alt Down}{Tab}
    return

#IfWinActive

!Shift::
w := DllCall("GetForegroundWindow")
pid := DllCall("GetWindowThreadProcessId", "UInt", w, "Ptr", 0)
l := DllCall("GetKeyboardLayout", "UInt", 0)
MsgBox % "Current Layout: " l "`nNorwegian Colemak: " norwegian_Colemak "`nNorwegian QWERTY: " norwegian_QWERTY


if (l = norwegian_Colemak)
{
    PostMessage 0x50, 0, %norwegian_QWERTY%,, A
}
else if (l = norwegian_QWERTY)
{
    PostMessage 0x50, 0, %norwegian_Colemak%,, A
}