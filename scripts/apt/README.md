echo "Europe/Paris" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

update-manager -d
lsb_release -d

DATE=`date +%Y_%m_%d-%H_%M_%S`

cat <file> | grep <?> | awk -F'=' '{ print $2}'

read -p "Please enter the hostname " host

if grep -q $host /etc/hosts
then
  sed -i "s/$oldHost/$host/g" /etc/sysconfig/network
else 
  echo "$host not found in /etc/hosts"
fi

[ -n "$1" ] && action=$1 || usage

	case $action in
		"install")
                        install
                ;;
		*)
		echo ""
		;;
	esac

echo "Regle à supprimer:"
read -p "[fail2ban-ssh 1] " rule
rule=${rule:-"fail2ban-ssh 1"}

while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
