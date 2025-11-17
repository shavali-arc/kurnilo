// Kurnilo Kernel Main Entry Point
//
// ARCHITECTURE SUPPORT: x86 (32-bit i386)
// This kernel is designed specifically for 32-bit x86 architecture.
// It is NOT compatible with:
// - 64-bit x86-64 (AMD64/Intel 64) architecture
// - ARM, RISC-V, or other non-x86 architectures
//
// The kernel targets Intel 80386 and later x86 processors.

#include "kernel.h"
#include "vga.h"

void init_kernel() {
    print("Kurnilo Kernel Initialized\n");
}

void kernel_main() {
    init_kernel();
    while (1) {
        // Main loop
    }
}
