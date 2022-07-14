#!/bin/bash

cd $HOME
# install newest mullvad
wget --content-disposition https://mullvad.net/download/app/deb/latest
sudo chown -Rv _apt:root MullvadVPN*
sudo chmod -Rv 700 MullvadVPN*
sudo apt install -y ./MullvadVPN*

# remove deb
rm -rf MullvadVPN*