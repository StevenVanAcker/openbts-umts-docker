#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get install -y build-essential mdm autoconf libtool libuhd003.010.003 git g++-5 gcc-5 \
		libzmq3-dev pkg-config libosip2-dev libortp-dev libusb-1.0-0-dev libtool-bin libsqlite3-dev libreadline-dev uhd-host

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 42
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 42
update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 42
update-alternatives --set cc /usr/bin/gcc
update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 42
update-alternatives --set c++ /usr/bin/g++

mkdir -p /opt
cd /opt
git clone https://github.com/RangeNetworks/OpenBTS-UMTS
cd /opt/OpenBTS-UMTS
git submodule init
git submodule update

tar -xf asn1c-0.9.23.tar.gz
cd /opt/OpenBTS-UMTS/vlm-asn1c-0959ffb
./configure
make -j$(ncpus)
#make -j$(ncpus) check
make install

cd /opt/OpenBTS-UMTS
./autogen.sh
./configure
make -j$(ncpus)
make install

uhd_images_downloader
