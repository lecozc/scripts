#!/bin/sh

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

USER=<USER>
PASSWORD=<PASSWORD>
NAS=<NAS>

apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

apt-get gcc make git autoconf autogen automake vim mlocate net-tools tcpdump zsh tmux

sh -c "$(wget https://raw.githubusercontent.com/T0FFF/oh-my-zsh/master/tools/install.sh -O -)"
echo "source /home/$USER/.zshrc" > /root/.zshrc


apt-get clean -y &&  apt-get autoclean -y && apt-get autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}
