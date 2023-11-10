#!/bin/bash

# check the number of parameters, if's not 1, then exit
if [ $# -ne 1 ]; then
    echo "Usage: $0 on|off"
    exit 1
fi

# get the path of dynamic debug control file
debug_control_file=$(sudo find /sys/kernel/debug -name control)

# turn off the dynamic debug fuse anyway
echo 'file fs/fuse/file.c -p' | sudo tee $debug_control_file
echo 'file fs/fuse/inode.c -p' | sudo tee $debug_control_file

# if the parameter is on, then turn on the dynamic debug fuse
if [ $1 = "on" ]; then
    echo 'file fs/fuse/file.c +p' | sudo tee $debug_control_file
    echo 'file fs/fuse/inode.c -p' | sudo tee $debug_control_file
    exit 0
fi