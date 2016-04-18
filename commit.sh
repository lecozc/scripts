#!/bin/sh -x

usage(){
	echo "Usage: `basename $0` <message> <name> <email>"	
	exit 1
}

[ "$#" -eq 3 ] && echo "Starting `basename $0`"|| usage

git add *
git commit -m "$1"
git config user.name $2
git config --global user.email $3

git push origin master

