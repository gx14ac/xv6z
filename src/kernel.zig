const uart = @import("uart.zig");
const page = @import("page.zig");

// This the trap/exception entrypoint, this will be invoked any time
// we get an exception (e.g if something in the kernel goes wrong) or
// an interrupt gets delivered.
// from boot.S
export fn trap() align(4) callconv(.C) noreturn {
    while (true) {}
}

// This is the kernel's entrypoint which will be invoked by the booting
// CPU (aka hart) after the boot code has executed.
export fn kmain() callconv(.C) void {
    page.init();
    uart.init();
    uart.println("Zig is running on barebones RISC-V (rv{})!", .{@bitSizeOf(usize)});

    while (true) {
        if (uart.get_char()) |value| {
            switch (value) {
                10, 13 => uart.println("", .{}),
                else => uart.println("not implemented", .{}),
            }
        }
    }
}
