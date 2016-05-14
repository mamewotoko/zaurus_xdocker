#! /bin/sh
## script to run on linux host

zxc cp -r /opt/Embedix/tools/arm-linux/lib .
# copy qemu-arm-static on linux host 
## apt-get install -y qemu-user-static
cp /usr/bin/qemu-arm-static .
sudo chroot . ./qemu-arm-static $@
