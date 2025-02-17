defaultLayout := DllCall("GetKeyboardLayout", "UInt", 0)
en_norwegianQWERTY := 68421641

switchLayout() {
    global en_norwegianQWERTY
    PostMessage, 0x50, 0, en_norwegianQWERTY,, A
}

restoreLayout() {
    global defaultLayout
    PostMessage, 0x50, 0, defaultLayout,, A
}

#IfWinActive ahk_exe Obsidian.exe

~Alt::
~RAlt::
~Ctrl::
    switchLayout()
    return

~Alt Up::
~RAlt Up::
~Ctrl Up::
    restoreLayout()  
    return

!Tab:: 
    restoreLayout()
    Send, {Alt Down}{Tab}
    return

#IfWinActive
