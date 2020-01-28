#!/bin/bash

rm -r bd
mkdir bd
python3 build_all.py --arch riscv32 --chip size-test-gcc --board ri5cyverilator
#python3 build_all.py --arch riscv32 --chip rvcorep --board verilator
