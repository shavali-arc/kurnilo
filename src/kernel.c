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
