## C++ program
Simple program to remap Norwegian QWERTY to my custom nordic colemak layout.

Adds a capslock layer, `CAPS + <key>`:
- D -> {
- F -> }
- E -> [
- R -> ]

g++ command for compiling with optimization and as a GUI application
```bash
g++ -o Colemak_windows.exe Colemak_windows.cpp -O2 -mwindows
```

Planning on making something similar for Linux.

There are probably a lot of optimization possible.

Using the program on monkeytype results in: "Error Failed to save result: Result data doesn't make sense". So it might be smart to avoid using this in games.

## Windows KLC
Using the Keyboard Layout Creator is a first party solution for windows. Unfortunately I had some issues with it. To fix these issues I have made som Autohotkey scripts.

Since I want to have a new layer when holding caps lock, I have made a script that only activates caps lock when holding.

For most programs all shortcus will still be in QWERTY, but Obsidian doesn't seem to be using the scancodes sent by the keyboard, but somhow both the scancode and the remapped key. I have made a script that switches layout when a ctrl, alt or altgr is held down. It uses layout ID's very specific to my layout, which might need to be changed.