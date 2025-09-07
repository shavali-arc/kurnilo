#![no_std]
#![no_main]

pub mod scheduler;
pub mod security;

#[no_mangle]
pub extern "C" fn rust_init() {
    // Initialize Rust components
    scheduler::init_scheduler();
    security::init_security();
}
