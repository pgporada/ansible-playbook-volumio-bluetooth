#!/bin/bash
cd /tmp/bluez
./bootstrap
./configure --enable-library --enable-experimental --enable-tools
make
make install
