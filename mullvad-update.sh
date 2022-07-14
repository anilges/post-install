#!/bin/bash

# install newest mullvad
wget --content-disposition https://mullvad.net/download/app/deb/latest
sudo apt install -y ./MullvadVPN*

# remove deb
rm -rf MullvadVPN*