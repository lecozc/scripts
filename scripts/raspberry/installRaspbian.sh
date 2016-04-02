#!/bin/sh

USER=<USER>
PASSWORD=<PASSWORD>
NAS=<NAS>

apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
rpi-update

apt-get install zlib1g-dev gcc make git autoconf autogen automake pkg-config tightvncserver rpi-update vim mlocate net-tools tcpdump git zsh vlc motion kodi hdparm sysbench install xfce4 xfce4-goodies iceweasel

update-rc.d tightvnc defaults
echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

echo "$NAS:/volume1/Download/ /mnt/Download nfs nouser,atime,auto,rw,dev,exec,suid 0   0" >> /etc/fstab
echo "//$NAS/6To /mnt/6To cifs username=$USER,password=$PASSWORD,uid=1000,gid=1000,iocharset=utf8 0 0" >> /etc/fstab"
echo "//$NAS/6To /mnt/Download cifs username=$USER,password=$PASSWORD,uid=1000,gid=1000,iocharset=utf8 0 0" >> /etc/fstab"

sh -c "$(wget https://raw.githubusercontent.com/T0FFF/oh-my-zsh/master/tools/install.sh -O -)"
echo "source /home/$USER/.zshrc" > /root/.zshrc



