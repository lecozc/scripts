# tmux

tmux list-sessions / tmux ls : List session
tmux new -s sessionName : Create a new session with the name sessionName
tmux attach -t 0 : Attach the 0 session

Ctrl+b " - split pane horizontally.
Ctrl+b % - split pane vertically.
Ctrl+b arrow key - switch pane.
Hold Ctrl+b, don't release it and hold one of the arrow keys - resize pane.
Ctrl+b c - (c)reate a new window.
Ctrl+b n - move to the (n)ext window.
Ctrl+b p - move to the (p)revious window.

Ctrl+b d - Detach session

# Ubuntu
echo "Europe/Paris" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

update-manager -d
lsb_release -d


here=$(dirname $(readlink -f $0))
SCRIPTNAME=`basename $0`
extension="${SCRIPTNAME##*.}"
filename="${SCRIPTNAME%.*}"

trim: 
Start sed -e 's/^[[:space:]]*//'
End sed -e 's/[[:space:]]*$//'
Both sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'

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
