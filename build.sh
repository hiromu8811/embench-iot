#!/bin/bash

RISCVDIR="/home/miyazaki/.local/riscv/elf/rv32i/bin"

rm -f logs/*
rm -rf bd
mkdir bd
mkdir bd/dump
mkdir bd/bin
mkdir bd/mem
#python3 build_all.py --arch riscv32 --chip size-test-gcc --board ri5cyverilator
python3 build_all.py --arch riscv32 --chip rvcorep --board verilator

benchmark=(
aha-mont64
crc32
cubic
edn
huffbench
matmult-int
minver
nbody
nettle-aes
nettle-sha256
nsichneu
picojpeg
qrduino
sglib-combined
slre
st
statemate
ud
wikisort
)

for bench in "${benchmark[@]}"
do
    # *.bin
    ${RISCVDIR}/riscv32-unknown-elf-objcopy -O binary bd/src/${bench}/${bench} bd/bin/${bench}.bin
    # *.mem
    hexdump -v -e '1/4 "%08x" "\n"' bd/bin/${bench}.bin > bd/mem/${bench}.mem
    # *.dump
    ${RISCVDIR}/riscv32-unknown-elf-objdump --disassemble-all bd/src/${bench}/${bench} > bd/dump/${bench}.dump
done
