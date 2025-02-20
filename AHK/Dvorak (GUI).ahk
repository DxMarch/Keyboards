SendMode Input
#NoEnv

;----------- CREATE INFORMATION WINDOW
Menu, Tray, Icon, main.cpl, 8
Gui, Add, GroupBox, x2 y2 w326 h130 , Information
Gui, Add, Text, x10 y20 w300, Your keyboard layout has been temporarily changed. Close this window to restore your prior layout.
Gui, Add, Text, x10 y60 w300, If your keys aren't working right, or you are confused, press toggle or close this window.
Gui, Add, Text, x10 y100 w300, Current Layout: Dvorak
Gui, Add, Button, x20 y138 w90 h30  , Toggle 
Gui, Add, Button, x120 y138 w90 h30 , Minimize
Gui, Add, Button, x220 y138 w90 h30 , Close
Gui, Show, x552 y209 h175 w330, Dvorak Keyboard Layout Changer
Return

ButtonToggle:
Toggle()
Return

ButtonMinimize:
Gui, Show, Minimize
Return

GuiClose:
ButtonClose:
ExitApp

;----------- REMAP TO DVORAK

-::[
=::]

q::'
w::,
e::.
r::p
t::y
y::f
u::g
i::c
o::r
p::l
[::/
]::=
;\::\ ; no change

;a::a ; no change
s::o
d::e
f::u
g::i
h::d
j::h
k::t
l::n
SC027::s
SC028::-

z::SC027
x::q
c::j
v::k
b::x
n::b
;m::m ; no change
,::w
.::v
/::z


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

;----------- TOGGLE DVORAK-QWERTY WITH RIGHT WINDOWS KEY

*RWin::
Suspend, Permit
Toggle()
return

Toggle() {
Suspend, toggle
Hotkey, *Ctrl, toggle
Hotkey, *Ctrl up, toggle
Hotkey, *Alt, toggle
Hotkey, *Alt up, toggle
Hotkey, *LWin, toggle
Hotkey, *LWin up, toggle
if (A_IsSuspended = 1) {
GuiControl, Text, Static3, Current Layout: QWERTY (normal)
} else {
GuiControl, Text, Static3, Current Layout: Dvorak
}
return
}