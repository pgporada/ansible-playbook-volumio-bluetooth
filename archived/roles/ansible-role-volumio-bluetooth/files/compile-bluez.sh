#!/bin/bash
cd /tmp/bluez
./bootstrap
./configure --enable-library --enable-experimental --enable-tools
make
make install

find /usr/lib/arm-linux-gnueabihf -name 'libbluetooth.so*' -exec sudo unlink {} \;
sudo ln -s /usr/local/lib/libbluetooth.so.3.19.5 /usr/lib/arm-linux-gnueabihf/libbluetooth.so
sudo ln -s /usr/local/lib/libbluetooth.so.3.19.5 /usr/lib/arm-linux-gnueabihf/libbluetooth.so.3
sudo ln -s /usr/local/lib/libbluetooth.so.3.19.5 /usr/lib/arm-linux-gnueabihf/libbluetooth.so.3.19.5
