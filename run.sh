#!/bin/bash

rm -f runlog.txt

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

echo "run 19 benchmarks" > runlog.txt
for bench in "${benchmark[@]}"
do
    echo "run ${bench}" >> runlog.txt
    simrv -a -m bd/bin/${bench}.bin -e 1G >> runlog.txt
done
