const uart = @import("uart.zig");
const HEAP_START = @extern([*]u8, .{ .name = "HEAP_START" });
const HEAP_SIZE = @extern([*]u8, .{ .name = "HEAP_SIZE" });
const PAGE_SIZE: u8 = 1 << 12;

const FreePages = struct {
    next: *FreePages,
};

pub const PageBits = enum(u8) {
    empty = 0,
    token = 1 << 0,
    last = 1 << 1,
};

pub const Page = struct {
    flags: u8,
};

// page granined memory allocationの実装
pub fn init() void {
    uart.init();
    uart.println("heap start {*}, heap size {*}\n", .{ HEAP_START, HEAP_SIZE });
}
