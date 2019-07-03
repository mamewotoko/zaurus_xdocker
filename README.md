Zaurus cross-compilation in a Docker container [![Build Status](https://travis-ci.org/mamewotoko/zaurus_xdocker.svg?branch=master)](https://travis-ci.org/mamewotoko/zaurus_xdocker)
==============================================

Target Zaurus
-------------
* [Zaurus SL-C3100](http://ezaurus.com/index_nonfla.html)

Build & prepare
---------------------
1. build docker container

    ```
    sh build.sh
    ```
Docker container image named "zxbuild" will be created.
2. extract build script, set executable permission, put it to executable path

  e.g.
  ```
  docker run zxbuild > zxc
  chmod +x zxc
  mv zxc ~/bin/
  ```

a) Compile and run hello app with gcc
-------------------------------------
1. run script to build docker container

    ```
    cd samples/hello_app
    zxc arm-linux-gcc hello.c -o hello_arm_built_by_docker
    ```
An executable file named "hello_arm_built_by_docker" will be created
2. copy hello_arm_built_by_docker file to SD card, then insert it to Zaurus C-3100
3. run hello_arm_built_by_docker using terminal software on Zaurus . "hello world" will be printed on terminal.

b) Compile and run hello app with make
-------------------------------------
1. run script to build docker container

    ```
    cd samples/hello_make_app/
    zxc make
    ```
An executable file named "hello_make" will be created
2. copy hello_make file to SD card, then insert it to Zaurus C-3100
3. run hello_make using terminal software on Zaurus . "hello world with makefile" will be printed on terminal.

Usage
-----
* build app with gcc (prefixed with arm-linux-)

   ```
   zxc arm-linux-gcc GCCARGS...
   ```
* build app with make

   ```
   zxc make
   ```
* copy kernel image built from kernel source code
  
  ```
  zxc cp /root/linux/arch/arm/boot/zImage .
  ```

TODO
----
* run arm app on qemu and support `zxc run`
  * qemu config
* build as user 
  * chpst alternative 
* build more app
  * use libraries installed in zaurus to link
  * CUI app
    * openssh-server
    * cannot compile lmbench
      * freeze when compiling mhz.c
  * GUI app
    * curses app

Challenge?
----------
* build web browser (supporting html5)
* compile and replace linux kernel
  * replace initrd?

Reference
---------
* http://support.ezaurus.com/developer/source/c3100/build_kernel_101J_c3100.asp
* http://support.ezaurus.com/developer/tool/tools.asp
* [Raspberry Pi cross-compilation in a Docker container.](https://github.com/sdt/docker-raspberry-pi-cross-compiler)

----
Takashi Masuyama < mamewotoko@gmail.com >
http://mammewo.ddo.jp/
