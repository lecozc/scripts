#!/bin/sh

apt-get install zlib1g-dev gcc make git autoconf autogen automake pkg-config
cd /tmp
git clone https://github.com/firehol/netdata.git --depth=1
cd /tmp/netdata 
./netdata-installer.sh

#/usr/sbin/netdata

#http://127.0.0.1:19999/

