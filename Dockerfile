FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y build-essential mdm autoconf libtool libuhd003.010.003 git g++-5 gcc-5 \
		libzmq3-dev pkg-config libosip2-dev libortp-dev libusb-1.0-0-dev libtool-bin libsqlite3-dev libreadline-dev uhd-host

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 42
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 42
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 42
RUN update-alternatives --set cc /usr/bin/gcc
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 42
RUN update-alternatives --set c++ /usr/bin/g++

RUN mkdir -p /opt
WORKDIR /opt
RUN git clone https://github.com/RangeNetworks/OpenBTS-UMTS
WORKDIR /opt/OpenBTS-UMTS
RUN git submodule init
RUN git submodule update

RUN tar -xf asn1c-0.9.23.tar.gz
WORKDIR /opt/OpenBTS-UMTS/vlm-asn1c-0959ffb
RUN ./configure
RUN make -j$(ncpus)
#RUN make -j$(ncpus) check
RUN make install

WORKDIR /opt/OpenBTS-UMTS
RUN ./autogen.sh
RUN ./configure
RUN make -j$(ncpus)
RUN make install

RUN uhd_images_downloader
