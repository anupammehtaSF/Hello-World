#!/bin/bash
cat /proc/partitions
# identify the disk to mount - find the major and minor numbers
mknod blk b 253 1
mkdir rootfs2
mount blk rootfs2
cd rootfs2
ls -la
