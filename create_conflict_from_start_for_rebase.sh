#!/bin/bash
git co start
git co .
git branch -D devel
git branch -D feature
git co -b devel
git branch feature
sed -i -e "s/production/production_devel/" config.php
git add config.php
git commit -m "Config change on devel"
git co feature
sed -i -e "s/production/production_feature/" config.php
git add config.php
git commit -m "Config change on feature"
sed -i -e "s/production_feature/production_feature2/" config.php
git add config.php
git commit -m "Config change2 on feature"
clear
echo "log from devel:"
git lg -3 devel
echo ""
echo "log from feature:"
git lg -3 feature

# git merge devel

