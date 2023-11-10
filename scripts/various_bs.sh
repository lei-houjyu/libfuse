#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <suffix>"
    exit 1
fi

suffix=$1

cd /mnt/libfuse/scripts

bs=4
for i in $(seq 0 10); do
    echo "$1 bs=${bs}k"
    cp fio_rand_write.fio.template fio_rand_write.fio
    sed -i "s/bs=4k/bs=${bs}k/g" fio_rand_write.fio
    fio fio_rand_write.fio > ../logs/fio_rand_write_${bs}k_$suffix.log 2>&1
    bs=$((bs*2))
done