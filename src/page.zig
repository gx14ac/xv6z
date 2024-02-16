const uart = @import("uart.zig");
const HEAP_START = @extern([*]u8, .{ .name = "HEAP_START" });
const HEAP_SIZE = @extern([*]u8, .{ .name = "HEAP_SIZE" });

pub fn init() void {
    uart.init();
    uart.println("heap start {*}, heap size {*}\n", .{ HEAP_START, HEAP_SIZE });
}
