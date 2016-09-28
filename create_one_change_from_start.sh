#!/bin/bash
git co start
git co .
git branch -D devel
git branch -D feature
git co -b devel
git branch feature
sed -i -e "s/cool.host/pond5.horse/" config.php
git add config.php
git commit -m "Config host change on devel"
git co feature
clear
echo "log from devel:"
git lg -3 devel
echo ""
echo "log from feature:"
git lg -3 feature

# git merge devel

