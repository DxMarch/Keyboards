;----- Code below seems to make things slower
SendMode Input
;#NoEnv
;Menu, Tray, Icon, main.cpl, 8
;------------------------------
SetCapsLockState, AlwaysOff
;----------- REMAP TO Colemak

e::f
r::p
t::b
y::j
u::l
i::u
o::y
p::ø
å::æ
s::r
d::s
f::t
j::n
k::e
l::i
ø::o
æ::å
<::z
z::x
x::c
c::d
b::<
n::k
Numpaddot::.

;----------- CUSTOM SHORTCUTS
Capslock & d::{
Capslock & f::}
Capslock & e::[
Capslock & r::]
$Capslock::  ; When Caps Lock is pressed
    SetKeyDelay -1
    Send, {Blind}{CapsLock DownTemp}  ; Hold Caps Lock
    KeyWait, CapsLock  ; Wait for Caps Lock to be released
    Send, {Blind}{CapsLock Up}  ; Release Caps Lock
Return

;----------- RELEASE KEYS FROM REMAP WHEN MODIFIER DOWN

*Ctrl::
SetKeyDelay -1
Send {Blind}{Ctrl DownTemp}
Suspend On
return
*Ctrl up::
Suspend Off
SetKeyDelay -1
Send {Blind}{Ctrl Up}
return

*Alt::
SetKeyDelay -1
Send {Blind}{Alt DownTemp}
Suspend On
return
*Alt up::
Suspend Off
SetKeyDelay -1
Send {Blind}{Alt Up}
return

*RAlt::
SetKeyDelay -1
Send {Blind}{RAlt DownTemp}
Suspend On
return
*RAlt up::
Suspend Off
SetKeyDelay -1
Send {Blind}{RAlt Up}
return

*LWin::
SetKeyDelay -1
Send {Blind}{LWin DownTemp}
Suspend On
return
*LWin up::
Suspend Off
SetKeyDelay -1
Send {Blind}{LWin Up}
return

;----------- TOGGLE COLEMAK-QWERTY WITH LEFT CAPS + <

Capslock & <::
Suspend, Permit
Suspend, toggle
Hotkey, *Ctrl, toggle
Hotkey, *Ctrl up, toggle
Hotkey, *Alt, toggle
Hotkey, *Alt up, toggle
Hotkey, *LWin, toggle
Hotkey, *LWin up, toggle
return