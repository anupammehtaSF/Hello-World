#!/bin/bash
cat /proc/partitions
# identify the disk to mount - find the major and minor numbers
mknod blk b 253 1
mkdir rootfs
mount blk rootfs
cd rootfs
ls -la
