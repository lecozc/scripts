#!/bin/sh

# Delete all docker containers
#docker rm $(docker ps -a -q)
# Delete all docker images
#docker rmi $(docker images -q)

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

apt-get update
apt-get install -y apt-transport-https ca-certificates


apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

if [ -f "/etc/lsb-release" ]; then
	OS=`cat /etc/lsb-release | grep DISTRIB_ID | awk -F"=" '{print $2}'`
fi

if [ "$OS" == "Ubuntu" ]
then
	echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" >> /etc/apt/sources.list.d/docker.list
else
	echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list.d/docker.list
fi

apt-get purge lxc-docker
apt-get update
apt-get install -y docker-engine
service docker start
