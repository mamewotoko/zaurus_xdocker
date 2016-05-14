#! /bin/sh

cp -r /opt/Embedix/tools/arm-linux/lib .
cp /usr/bin/qemu-arm-static .
chroot . ./qemu-arm-static $@

