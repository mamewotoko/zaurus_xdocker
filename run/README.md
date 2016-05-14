How to run on qemu-arm (Linux host)
===================================

Run
---
1. copy libs

    ```
    cp -r /opt/Embedix/tools/arm-linux/lib .
    ```
2. copy qemu-system-arm binary

    ```
    cp /usr/bin/qemu-arm-static .
    ```
3. run using chroot

    ```
    chroot . ./qemu-arm-static hello_arm_built_by_docker
    ```

TODO
----
* use bind mount instead of copying lib and qemu?

----
Takashi Masuyama < mamewotoko@gmail.com >
http://mamewo.ddo.jp/
