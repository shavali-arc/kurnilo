# Architecture Support

## Supported Architectures

### x86 (32-bit i386) - **SUPPORTED** ✓

Kurnilo kernel is **fully designed and optimized for 32-bit x86 architecture (i386)**.

#### Technical Details

- **Architecture**: Intel IA-32 (x86)
- **Minimum CPU**: Intel 80386 or compatible
- **Bit Width**: 32-bit
- **Instruction Set**: x86 (i386)
- **Memory Model**: 32-bit flat memory model

#### Evidence of x86 Support

1. **Compilation Flags**
   - `-m32` flag in Makefile explicitly targets 32-bit x86
   - GCC and binutils configured for i686/x86 target

2. **Bootloader**
   - Uses x86 assembly instructions (`call`, `hlt`)
   - Implements standard x86 boot sequence
   - Memory layout at 0x100000 (standard for x86 protected mode)

3. **Hardware Access**
   - VGA text mode at 0xB8000 (x86-specific memory address)
   - Standard 80x25 text mode (x86 PC standard)

4. **Testing & Emulation**
   - Uses `qemu-system-i386` emulator
   - Designed for x86 PC hardware

5. **Linker Configuration**
   - Entry point at `_start` (x86 convention)
   - Sections organized for x86 protected mode

## Unsupported Architectures

### x86-64 (64-bit AMD64/Intel 64) - **NOT SUPPORTED** ✗

The kernel is compiled with `-m32` flag and does not support 64-bit x86-64 architecture.

**To add x86-64 support, you would need:**
- Change `-m32` to `-m64` in Makefile
- Update assembly code for 64-bit mode
- Modify linker script for 64-bit addressing
- Update VGA and hardware access code
- Test with `qemu-system-x86_64`

### ARM - **NOT SUPPORTED** ✗

ARM architecture is not currently supported. The codebase uses x86-specific:
- Assembly instructions
- Memory addresses (VGA at 0xB8000)
- Boot sequence

### RISC-V - **NOT SUPPORTED** ✗

RISC-V architecture is not currently supported.

### Other Architectures - **NOT SUPPORTED** ✗

- MIPS
- PowerPC
- SPARC
- etc.

## Future Architecture Support

The documentation mentions potential future support for other architectures:
- Architecture abstraction layer planned
- Modular design to support multiple architectures
- See `docs/architecture.md` for more details

## How to Verify Architecture Support

To verify the architecture support in the compiled binary:

```bash
# Check object file architecture
file kernel.bin

# Check with objdump
objdump -f kernel.bin

# Expected output should indicate:
# - ELF 32-bit LSB executable
# - Intel 80386
```

## Testing on x86

The kernel is tested using QEMU:

```bash
qemu-system-i386 -kernel kernel.bin
```

This confirms that the kernel is designed for 32-bit x86 (i386) architecture.

## Summary

**Yes, this code supports x86 architecture** - specifically 32-bit x86 (i386).

The kernel is:
- ✓ Designed for x86
- ✓ Compiled for x86
- ✓ Uses x86-specific hardware addresses
- ✓ Tested on x86 emulator
- ✗ Not compatible with x86-64 without modifications
- ✗ Not compatible with ARM, RISC-V, or other architectures
