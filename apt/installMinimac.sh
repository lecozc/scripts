#!/bin/sh

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Activate WIFI"
apt-get remove bcwl-kernel-source
apt-get install firmware-b43-installer b43-fwcutter


