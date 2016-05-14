FROM 32bit/ubuntu:14.04
MAINTAINER Takashi Masuyama <mamewotoko@gmail.com>
## C3100

RUN apt-get update -q && \
  apt-get install \
        alien \
	wget \
	ncurses-dev \
	binutils-arm-linux-gnueabi \
        automake \
        bc \
        bison \
        cmake \
        curl \
        flex \
        lib32stdc++6 \
        lib32z1 \
        runit \
	 -y --fix-missing

WORKDIR /root
RUN wget -nv http://support.ezaurus.com/developer/tool/tools/gcc-cross-sa1100-2.95.2-0.i386.rpm
RUN wget -nv http://support.ezaurus.com/developer/tool/tools/glibc-arm-2.2.2-0.i386.rpm
RUN wget -nv http://support.ezaurus.com/developer/tool/tools/linux-headers-arm-sa1100-2.4.6-3.i386.rpm
RUN wget -nv http://support.ezaurus.com/developer/tool/tools/binutils-cross-arm-2.11.2-0.i386.rpm

RUN wget -nv http://support.ezaurus.com/developer/source/c3100/20050602/linux-c3100-20050602-rom1_01.tar.bz2
RUN alien gcc-cross-sa1100-2.95.2-0.i386.rpm
RUN alien glibc-arm-2.2.2-0.i386.rpm
RUN alien linux-headers-arm-sa1100-2.4.6-3.i386.rpm
RUN alien binutils-cross-arm-2.11.2-0.i386.rpm
RUN dpkg -i *.deb
# RUN apt-get install strace -y

ENV PATH=/opt/Embedix/tools/bin:${PATH}

RUN bzcat /root/linux-c3100-20050602-rom1_01.tar.bz2 | tar x

# build kernel (optional)
WORKDIR /root/linux
RUN make borzoi-j_config
RUN yes "" | make oldconfig
RUN make dep; make clean
RUN make zImage

WORKDIR /zxc
WORKDIR /build
VOLUME ["/build"]
ENTRYPOINT ["/zxc/entrypoint.sh"]
COPY imagefiles/entrypoint.sh imagefiles/zxc /zxc/
