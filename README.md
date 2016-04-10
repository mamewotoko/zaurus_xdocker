Zaurus cross-compilation in a Docker container [![Build Status](https://travis-ci.org/mamewotoko/zaurus_xdocker.svg?branch=master)](https://travis-ci.org/mamewotoko/zaurus_xdocker)
==============================================

Target Zaurus
-------------
* Zaurus SL-C3100

Build container image
---------------------
```bash
sh build.sh
```
Docker container image named "xbuild" will be created.

Compile and run hello app
-------------------------
1.
```
cd hello_app
sh build.sh
```
An executable file named "hello_arm_built_by_docker" will be created
2. copy hello_arm_built_by_docker file to SD card, then insert it to Zaurus C-3100
3. run hello_arm_built_by_docker using terminal software on Zaurus . "hello world" will be printed on terminal.

TODO
----
* docker HTTP proxy setting to build image?
* run on qemu
* use make
* build CUI app
* build GUI app
* compile and replace linux kernel 

Reference
---------
* http://support.ezaurus.com/developer/source/c3100/build_kernel_101J_c3100.asp
* http://support.ezaurus.com/developer/tool/tools.asp
* [Raspberry Pi cross-compilation in a Docker container.](https://github.com/sdt/docker-raspberry-pi-cross-compiler)

----
Takashi Masuyama < mamewotoko@gmail.com >
http://mammewo.ddo.jp/
