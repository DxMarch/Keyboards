en_norwegian_QWERTY := 68421641
no_norwegian_Colemak := -255851500
isSwitching := false

#IfWinActive ahk_exe Obsidian.exe

~Alt::
~RAlt::
~Ctrl::
    if (!isSwitching) {
        isSwitching := true
        PostMessage, 0x50, 0, en_norwegianQWERTY,, A
    }
    return

~Alt Up::
~RAlt Up::
~Ctrl Up::
    if (isSwitching) {
        isSwitching := false
        PostMessage, 0x50, 0, no_norwegian_Colemak,, A
    }
    return

; Go back to layout when tabbing out of Obsidian
!Tab:: 
    PostMessage, 0x50, 0, no_norwegian_Colemak,, A
    Send, {Alt Down}{Tab}
    return

#IfWinActive