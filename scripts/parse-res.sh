#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <suffix>"
    exit 1
fi

suffix=$1

cd /mnt/libfuse/scripts

bs=4
for i in $(seq 0 10); do
    echo -n "$1 bs=${bs}k "
    grep WRITE: ../logs/fio_rand_write_${bs}k_$suffix.log | grep -oP 'bw=\K\d+'
    bs=$((bs*2))
done