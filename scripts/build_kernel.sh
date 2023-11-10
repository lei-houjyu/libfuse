#!/bin/bash

# check the number of parameters, if's not 1, then exit
if [ $# -ne 1 ]; then
    echo "Usage: $0 /path/to/linux"
    exit 1
fi

suffix=-haoyu

cd $1
rm ../*$suffix*.deb
make -j $(nproc) bindeb-pkg LOCALVERSION=$suffix
sudo dpkg -i ../*$suffix*.deb