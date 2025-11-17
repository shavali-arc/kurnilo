#include "vga.h"

// VGA Text Mode Driver for x86 Architecture
// 
// ARCHITECTURE: x86 (32-bit i386)
// The VGA text mode memory address 0xB8000 is specific to x86 architecture.
// This is the standard VGA text buffer address in x86 PC architecture.
// Compatible with x86 processors that support VGA text mode (standard on PC hardware).

void print(const char* str) {
    static unsigned short* video_memory = (unsigned short*)0xB8000;  // x86 VGA text buffer
    static int pos = 0;
    while (*str) {
        if (*str == '\n') {
            pos += 80 - (pos % 80);
        } else {
            video_memory[pos++] = (*str) | 0x0F00;
        }
        str++;
    }
}
