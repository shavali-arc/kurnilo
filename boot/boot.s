# Kurnilo Kernel Boot Code
# 
# ARCHITECTURE: x86 (32-bit i386)
# This assembly code uses x86 instruction set:
# - call: x86 instruction to call a procedure
# - hlt: x86 instruction to halt the processor
# 
# Compatible with 32-bit x86 processors (Intel 80386 and later)

.global _start

_start:
    call kernel_main
    hlt
