# Kurnilo Kernel Makefile
# 
# ARCHITECTURE SUPPORT: This kernel is designed for 32-bit x86 (i386) architecture
# - The -m32 flag targets 32-bit x86 architecture (IA-32/i386)
# - Compatible with Intel 80386 and later x86 processors
# - NOT compatible with 64-bit x86-64 architecture
# - Tested with qemu-system-i386 emulator

CC = C:/msys64/mingw64/bin/gcc
AS = C:/msys64/mingw64/bin/as
CFLAGS = -ffreestanding -O2 -Wall -Wextra -m32  # -m32 targets 32-bit x86
LDFLAGS = -T boot/linker.ld -nostdlib -m32      # -m32 links for 32-bit x86
AFLAGS =

SRC_DIR = src
INC_DIR = include
BOOT_DIR = boot
OBJ_DIR = obj

SRCS = $(wildcard $(SRC_DIR)/*.c)
BOOT_SRCS = $(wildcard $(BOOT_DIR)/*.s)
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))
BOOT_OBJS = $(patsubst $(BOOT_DIR)/%.s, $(OBJ_DIR)/%.o, $(BOOT_SRCS))

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -I$(INC_DIR) -c $< -o $@

$(OBJ_DIR)/%.o: $(BOOT_DIR)/%.s
	$(AS) $(AFLAGS) $< -o $@

kernel.bin: $(OBJS) $(BOOT_OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	rm -f $(OBJ_DIR)/*.o kernel.bin

.PHONY: clean
