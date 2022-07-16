#!/bin/bash

cd $HOME
# install curl
sudo apt install curl

# create folder for AppImages if not exists
mkdir -p $HOME/AppImages

# remove current AppImage
rm -rf $HOME/AppImages/Logseq*

# install logseq AppImage
cd $HOME/AppImages/
latest_logseq=$(curl -s https://api.github.com/repos/logseq/logseq/releases/latest | jq -r ".tag_name")
wget https://github.com/logseq/logseq/releases/download/$latest_logseq/Logseq-linux-x64-$latest_logseq.AppImage
chmod +x Logseq-linux-x64-$latest_logseq.AppImage
