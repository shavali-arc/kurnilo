# Kurnilo Operating System

A custom kernel designed for low resource usage, real-time performance, security, and hardware compatibility.

## Features
- Minimal footprint
- Real-time capabilities
- Enhanced security
- Hardware abstraction

## Documentation
- [Architecture Overview](docs/architecture.md)

## Building
1. Install MSYS2 from https://www.msys2.org/
2. Open MSYS2 MinGW 64-bit shell and run: `pacman -Syu --noconfirm; pacman -S mingw-w64-x86_64-gcc mingw-w64-x86_64-binutils make --noconfirm`
3. In the project directory, run `make` to build the kernel.
4. Use QEMU for testing: `qemu-system-i386 -kernel kernel.bin`

## Requirements
- MSYS2 with GCC and binutils
- Make
- QEMU for emulation

## Project Structure
- `src/`: Kernel source files
- `include/`: Header files
- `arch/`: Architecture-specific code
- `drivers/`: Device drivers
- `boot/`: Bootloader code
- `docs/`: Documentation

## Next Steps
- Add real-time scheduler
- Implement security features
- Port to embedded hardware
