# Kurnilo Kernel Architecture Documentation

## Overview
Kurnilo is a custom operating system kernel designed for low resource consumption, real-time performance, enhanced security, and broad hardware compatibility. It aims to address common issues in existing OSes such as bloat, security vulnerabilities, and poor real-time support. The kernel is built primarily in C with planned Rust integration for safety-critical components.

## Architecture Principles
- **Minimalism**: Keep the footprint small by avoiding unnecessary features and using static allocation where possible.
- **Real-Time**: Support deterministic scheduling for time-sensitive applications.
- **Security**: Implement access controls and safe memory handling to prevent exploits.
- **Hardware Agnostic**: Abstract hardware differences for portability across devices.
- **Modularity**: Organize code into reusable modules for easy extension.

## Core Components

### 1. Kernel Core (`src/kernel.c`)
- **Purpose**: Entry point and main kernel loop.
- **Functions**:
  - `kernel_main()`: Initializes the kernel and enters the main loop.
  - `init_kernel()`: Calls initialization functions for subsystems.
- **Responsibilities**: Coordinate between subsystems, handle basic I/O.

### 2. Bootloader (`boot/`)
- **Files**: `boot.s`, `linker.ld`
- **Purpose**: Loads the kernel into memory and transfers control.
- **Process**:
  - Assembly code sets up the environment.
  - Linker script defines memory layout (text, data, bss sections at 0x100000).

### 3. VGA Output (`src/vga.c`, `include/vga.h`)
- **Purpose**: Basic text output to screen for debugging.
- **Implementation**: Writes to VGA memory buffer (0xB8000) for 80x25 text mode.

### 4. Scheduler (Planned: `src/scheduler.rs`)
- **Purpose**: Manage process/thread scheduling.
- **Features**:
  - Real-time scheduling (e.g., round-robin or priority-based).
  - Preemptive multitasking for determinism.
- **Integration**: Called in the main kernel loop.

### 5. Security Module (Planned: `src/security.rs`)
- **Purpose**: Enforce access controls and prevent unauthorized access.
- **Features**:
  - Basic ACLs (Access Control Lists).
  - Memory protection checks.
- **Benefits**: Reduces vulnerabilities compared to traditional C-based systems.

### 6. Hardware Abstraction (`arch/`, `drivers/`)
- **Purpose**: Handle hardware-specific code and device drivers.
- **Structure**:
  - `arch/`: Architecture-specific code (e.g., x86 GDT/IDT setup).
  - `drivers/`: Device drivers (e.g., keyboard, network).
- **Design**: Modular to support multiple architectures (x86, ARM, RISC-V).

## Real-Time Capabilities
- **Scheduling**: Use a real-time scheduler to ensure tasks meet deadlines.
- **Interrupts**: Handle hardware interrupts efficiently without blocking.
- **Determinism**: Avoid dynamic memory allocation to prevent unpredictable delays.

## Security Features
- **Memory Safety**: Rust components prevent buffer overflows and null dereferences.
- **Access Control**: Check permissions before resource access.
- **Minimal Attack Surface**: Keep the kernel small to reduce exploitable code.

## Hardware Compatibility
- **Abstraction Layer**: Use HAL (Hardware Abstraction Layer) for device independence.
- **Supported Architectures**: Initially x86, extensible to others.
- **Boot Process**: Multiboot-compliant for compatibility with bootloaders like GRUB.

## Build and Development
- **Tools**: GCC for C, Rust for safety modules, Make for builds.
- **Process**:
  1. Compile C sources to object files.
  2. Link with Rust static library (future).
  3. Produce `kernel.bin` for testing.
- **Testing**: Use QEMU for emulation: `qemu-system-i386 -kernel kernel.bin`.

## Future Enhancements
- **Hybrid Integration**: Fully integrate Rust for scheduler and security.
- **File System**: Add a simple FS for persistence.
- **Networking**: Basic TCP/IP stack.
- **User Space**: Support for user processes.
- **Embedded Ports**: Adapt for IoT and real-time systems.

## Conclusion
Kurnilo's architecture emphasizes efficiency, safety, and flexibility. By starting with a minimal C base and adding Rust for critical parts, it balances performance with security. This design positions Kurnilo as a viable alternative for specialized applications, with potential for broader adoption in hardware-integrated environments.

For contributions or questions, refer to the README.md.
