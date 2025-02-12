#include <windows.h>
#include <unordered_map>
#include <iostream>

// Key remapping
std::unordered_map<WPARAM, WPARAM> keyMap = {
    {'E', 'F'}, 
    {'R', 'P'}, 
    {'T', 'B'}, 
    {'Y', 'J'}, 
    {'U', 'L'}, 
    {'I', 'U'}, 
    {'O', 'Y'}, 
    {'P', 192}, // 222 = æ
    {221, 222},  // 221 = å -> 192 = ø
    {'S', 'R'}, 
    {'D', 'S'}, 
    {'F', 'T'}, 
    {'J', 'N'}, 
    {'K', 'E'}, 
    {'L', 'I'}, 
    {192, 'O'},
    {222, 221}, 
    {226, 'Z'}, // 226 = '<'
    {'Z', 'X'}, 
    {'X', 'C'}, 
    {'C', 'D'}, 
    {'B', 226}, 
    {'N', 'K'},
};

// Flag to indicate if a key event is being simulated
bool isSimulatingKeyEvent = false;
// Flag to indicate if a modifier key is being held down
bool modifierDown = false;
// Flag for caps lock state
bool capsLock = false;
// Custom key remapping
bool remapKeys = true;

void capsLockShorcuts(WPARAM key) {
    switch (key) {
        case 'D': // Send '{'
            keybd_event(VK_RMENU, 0, 0, 0); // Press AltGr
            keybd_event(55, 0, 0, 0); 
            keybd_event(55, 0, KEYEVENTF_KEYUP, 0);
            keybd_event(VK_RMENU, 0, KEYEVENTF_KEYUP, 0); // Release AltGr
            break;
        case 'F': // Send '}'
            keybd_event(VK_RMENU, 0, 0, 0); // Press AltGr
            keybd_event(48, 0, 0, 0); // Press '0'
            keybd_event(0x30, 0, KEYEVENTF_KEYUP, 0); // Release '0'
            keybd_event(VK_RMENU, 0, KEYEVENTF_KEYUP, 0); // Release AltGr
            break;
        case 'E': // Send '['
            keybd_event(VK_RMENU, 0, 0, 0); // Press AltGr
            keybd_event(56, 0, 0, 0);
            keybd_event(56, 0, KEYEVENTF_KEYUP, 0);
            keybd_event(VK_RMENU, 0, KEYEVENTF_KEYUP, 0); // Release AltGr
            break;
        case 'R': // Send ']'
            keybd_event(VK_RMENU, 0, 0, 0); // Press AltGr
            keybd_event(57, 0, 0, 0); 
            keybd_event(57, 0, KEYEVENTF_KEYUP, 0);
            keybd_event(VK_RMENU, 0, KEYEVENTF_KEYUP, 0); // Release AltGr
            break;
        case 'Q': // Switch to QWERTY
            remapKeys = false;
            break;
        case 'C': // Switch to Colemak
            remapKeys = true;
            break;
        default:
            //TODO: More sofisticated caps lock behavior
            break;
    }
}

// Low-level keyboard hook callback
LRESULT CALLBACK LowLevelKeyboardProc(int nCode, WPARAM wParam, LPARAM lParam) {
    if (nCode == HC_ACTION) {
        KBDLLHOOKSTRUCT* p = (KBDLLHOOKSTRUCT*)lParam;
        // Check if a key is being pressed down 
        // and no modifier active and real key press
        if ((wParam == WM_KEYDOWN || wParam == WM_SYSKEYDOWN) && !modifierDown && !isSimulatingKeyEvent) {
            WPARAM key = p->vkCode;
            std::cout << key << std::endl;
            // Handle caps lock shortcuts
            if (capsLock) {
                isSimulatingKeyEvent = true;
                capsLockShorcuts(key);
                isSimulatingKeyEvent = false;
                return 1; // Block original key
            } 
            // Check if caps lock is being pressed
            if (key == VK_CAPITAL) {
                capsLock = true;
                return 1; // Block original key
            }
            // Check if a modifier key is being pressed down
            if (key == VK_LCONTROL || key == VK_RCONTROL || wParam == WM_SYSKEYDOWN) {
                modifierDown = true;
            }
            // Check if key is a key we want to remap
            else if (keyMap.find(key) != keyMap.end() && remapKeys) {
                isSimulatingKeyEvent = true;
                keybd_event(keyMap[key], 0, 0, 0); 
                isSimulatingKeyEvent = false;
                return 1; // Block original key
            }
            // Always remap numpad , to .
            else if (key == 110) {
                isSimulatingKeyEvent = true;
                keybd_event(190, 0, 0, 0); 
                isSimulatingKeyEvent = false;
                return 1; // Block original key
            }
        }
        // Check if a modifier key is being released
        else if (wParam == WM_KEYUP || wParam == WM_SYSKEYUP) {
            WPARAM key = p->vkCode;
            if (key == VK_LCONTROL || key == VK_RCONTROL || wParam == WM_SYSKEYUP) {
                modifierDown = false;
            } else if (key == VK_CAPITAL) {
                capsLock = false;
            }
        }
    }
    // Pass event to next hook
    return CallNextHookEx(NULL, nCode, wParam, lParam);
}

int main() {
    // Set low-level keyboard hook
    HHOOK hhkLowLevelKybd = SetWindowsHookEx(WH_KEYBOARD_LL, LowLevelKeyboardProc, 0, 0);
    MSG msg;
    while (GetMessage(&msg, NULL, 0, 0)) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }
    UnhookWindowsHookEx(hhkLowLevelKybd);
    return 0;
}

// WPARAM:
// WM_SYSKEYDOWN = 260 (alt)