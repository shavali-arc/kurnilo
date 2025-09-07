#include "vga.h"

void print(const char* str) {
    static unsigned short* video_memory = (unsigned short*)0xB8000;
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
