#!/bin/bash

cd $HOME
# update the system
sudo apt update && sudo apt upgrade -y
sudo snap refresh

# install apt programs
sudo add-apt-repository universe
sudo apt install ubuntu-restricted-extras texlive-full libfuse2 jq -y

# install vscodium
snap install codium --classic

# create .bash_aliases
cd $HOME
touch .bash_aliases
echo "alias upsys='sudo apt update && sudo apt upgrade -y && sudo snap refresh'" >> .bash_aliases
echo "alias uplog='./$HOME/post-install/logseq-update.sh'" >> .bash_aliases
echo "alias upnvim='./$HOME/post-install/neovim-update.sh'" >> .bash_aliases
echo "alias upvpn='./$HOME/post-install/mullvad-update.sh'" >> .bash_aliases

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
$HOME/post-install/logseq-update.sh
$HOME/post-install/neovim-update.sh
$HOME/post-install/mullvad-update.sh