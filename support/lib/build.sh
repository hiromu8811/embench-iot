#!/bin/bash

## libstart.a
cd start
rm -f start.o libstart.a
riscv32-unknown-elf-gcc -c start.S
ar rcs libstart.a start.o
cp libstart.a ..
