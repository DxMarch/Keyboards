; Will load with norwegian language, so if English language has also has norwegian qwerty, the id will be different
norwegian_QWERTY_ID :=  "00000414"  ; Norwegian QWERTY layout identifier
norwegian_QWERTY := DllCall("LoadKeyboardLayout", "Str", norwegian_QWERTY_ID, "Int", 1)

norwegian_Colemak_ID := "00001414"  ; Norwegian Colemak layout identifier
norwegian_Colemak := DllCall("LoadKeyboardLayout", "Str", norwegian_Colemak_ID, "Int", 1)

w := DllCall("GetForegroundWindow")
pid := DllCall("GetWindowThreadProcessId", "UInt", w, "Ptr", 0)
currentLayout := DllCall("GetKeyboardLayout", "UInt", pid)

MsgBox % "Current Layout: " currentLayout "`nNorwegian Colemak: " norwegian_Colemak "`nNorwegian QWERTY: " norwegian_QWERTY
