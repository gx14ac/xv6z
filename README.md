## xv6z
xv6 operation system running on [VisonFive](https://www.starfivetech.com/en/site/boards)

## run
`zig build run`

## elf dump
riscv64-unknown-elf-objdump -d -x -S  ./zig-out/bin/kernel 

## requirements
- zig 0.11.0
- riscv-gnu-toolchain
- qemu

## arch
- risc-v
- visonfive
