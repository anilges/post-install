#!/bin/bash

cd $HOME
# remove old version
rm -rf $HOME/neovim

# build and install neovim from source
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen -y
cd $HOME
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install