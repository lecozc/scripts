#!/bin/sh

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

update(){
	echo"##############"
	echo "update..."
 	apt-get update
	apt-get upgrade -y
	apt-get dist-upgrade -y
}

clean(){
	echo"##############"
	echo "clean..."
	apt-get clean -y &&  apt-get autoclean -y && apt-get autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}

}

yn=N
read -p "Clean after? [Y/N]: N " yn
update
case $yn in
	[Yy]* ) clean; break;;
        [Nn]* ) exit;;
esac

