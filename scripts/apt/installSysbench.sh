#!/bin/sh

apt-get update
apt-get install -y sysbench

sysbench --test=cpu --cpu-max-prime=2000 run
sysbench --test=fileio --file-total-size=1G prepare


rm -f sysbench test_file.*
