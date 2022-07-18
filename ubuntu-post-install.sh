#!/bin/bash

cd $HOME
# update the system
sudo apt update && sudo apt upgrade -y
sudo snap refresh

# install apt programs
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update
sudo apt install ubuntu-restricted-extras texlive-full libfuse2 jq ffmpeg obs-studio -y

# install obs-ndi
wget https://github.com/Palakis/obs-ndi/releases/download/4.9.1/libndi4_4.5.1-1_amd64.deb
wget https://github.com/Palakis/obs-ndi/releases/download/4.9.1/obs-ndi_4.9.1-1_amd64.deb
sudo apt install -y ./libndi4_4.5.1-1_amd64.deb
sudo apt install -y ./obs-ndi_4.9.1-1_amd64.deb
rm -rf libndi4_4.5.1-1_amd64.deb obs-ndi_4.9.1-1_amd64.deb

# install vscodium
sudo snap install codium --classic

# install onionshare
sudo snap install onionshare

# create .bash_aliases
cd $HOME
touch .bash_aliases
echo "alias upsys='sudo apt update && sudo apt upgrade -y && sudo snap refresh'" >> .bash_aliases
echo "alias uplog='$HOME/post-install/logseq-update.sh'" >> .bash_aliases
echo "alias upnvim='$HOME/post-install/neovim-update.sh'" >> .bash_aliases
echo "alias upvpn='$HOME/post-install/mullvad-update.sh'" >> .bash_aliases
echo "alias upzot='$HOME/post-install/zotero-update.sh'" >> .bash_aliases
echo "alias v='nvim'" >> .bash_aliases

# create ssh key
yes "" | ssh-keygen -t ed25519 -C "nilges.alex@gmx.de"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# create git config
git config --global user.name "Alexander Nilges"
git config --global user.email nilges.alex@gmx.de

chmod +x $HOME/post-install/logseq-update.sh
chmod +x $HOME/post-install/neovim-update.sh
chmod +x $HOME/post-install/mullvad-update.sh
$HOME/post-install/neovim-update.sh
$HOME/post-install/mullvad-update.sh
$HOME/post-install/logseq-update.sh

chmod +x $HOME/post-install/zotero-update.sh
$HOME/post-install/zotero-update.sh


echo "done, now restart and have fun"
