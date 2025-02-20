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