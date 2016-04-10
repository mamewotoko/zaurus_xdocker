FROM 32bit/ubuntu:14.04
MAINTAINER Takashi Masuyama <mamewotoko@gmail.com>
## C3100

RUN apt-get update -q && apt-get install alien wget ncurses-dev binutils-arm-linux-gnueabi -y --fix-missing

WORKDIR /
RUN wget http://support.ezaurus.com/developer/tool/tools/gcc-cross-sa1100-2.95.2-0.i386.rpm
RUN wget http://support.ezaurus.com/developer/tool/tools/glibc-arm-2.2.2-0.i386.rpm
RUN wget http://support.ezaurus.com/developer/tool/tools/linux-headers-arm-sa1100-2.4.6-3.i386.rpm
RUN wget http://support.ezaurus.com/developer/tool/tools/binutils-cross-arm-2.11.2-0.i386.rpm

RUN wget http://support.ezaurus.com/developer/source/c3100/20050602/linux-c3100-20050602-rom1_01.tar.bz2
RUN bzcat linux-c3100-20050602-rom1_01.tar.bz2 | tar x
RUN alien gcc-cross-sa1100-2.95.2-0.i386.rpm
RUN alien glibc-arm-2.2.2-0.i386.rpm
RUN alien linux-headers-arm-sa1100-2.4.6-3.i386.rpm
RUN alien binutils-cross-arm-2.11.2-0.i386.rpm
RUN apt-get install strace -y
ENV PATH=/opt/Embedix/tools/bin:${PATH}
RUN dpkg -i *.deb

WORKDIR linux
#ADD arch_arm_makefile.patch .
#RUN apt-get install patch -y
# RUN patch -p1 < arch_arm_makefile.patch
RUN make borzoi-j_config
RUN yes "" | make oldconfig
RUN make dep; make clean
RUN make zImage

VOLUME ["/build"]
RUN mkdir /build
WORKDIR /build
