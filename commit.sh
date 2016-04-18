#!/bin/sh -x

git add *
git commit -m "$1"
git config --global user.email $2

git push origin master

