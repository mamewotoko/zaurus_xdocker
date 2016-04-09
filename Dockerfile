FROM 32bit/ubuntu:14.04
MAINTAINER Takashi Masuyama <mamewotoko@gmail.com>
## C3100

RUN apt-get update -q && apt-get install alien wget ncurses-dev binutils-arm-linux-gnueabi -y --fix-missing
RUN wget http://support.ezaurus.com/developer/tool/tools/gcc-cross-sa1100-2.95.2-0.i386.rpm
RUN wget http://support.ezaurus.com/developer/tool/tools/glibc-arm-2.2.2-0.i386.rpm
RUN wget http://support.ezaurus.com/developer/tool/tools/linux-headers-arm-sa1100-2.4.6-3.i386.rpm

RUN wget http://support.ezaurus.com/developer/source/c3100/20050602/linux-c3100-20050602-rom1_01.tar.bz2
RUN bzcat linux-c3100-20050602-rom1_01.tar.bz2 | tar x
RUN alien gcc-cross-sa1100-2.95.2-0.i386.rpm
RUN alien glibc-arm-2.2.2-0.i386.rpm
RUN alien linux-headers-arm-sa1100-2.4.6-3.i386.rpm
RUN apt-get install strace -y
ENV PATH=/usr/arm-linux-gnueabi/bin/:/opt/Embedix/tools/bin:${PATH}
RUN dpkg -i *.deb
WORKDIR linux
RUN make borzoi-j_config
RUN yes "" | make oldconfig
RUN make dep
RUN make clean
#RUN make zImage
