Simple C++ program to remap Norwegian QWERTY to my custom nordic colemak layout.

Adds a capslock layer (CAPS + ):
- D = {
- F = }
- E = [
- R = ]

g++ command for compiling with optimization and as a GUI application
```bash
g++ -o Colemak_windows.exe Colemak_windows.cpp -O2 -mwindows
```

Planning on making something similar for Linux.

There are probably a lot of optimization possible.

Using the program on monkeytype results in: "Error Failed to save result: Result data doesn't make sense". So it might be smart to avoid using this in games.