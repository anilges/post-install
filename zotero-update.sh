#!/bin/bash

# remove old installation
rm -rf /opt/zotero

cd $HOME/Downloads/

# download current tarball
wget "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64" -O zotero64.tar.bz2

tar -xf zotero64.tar.bz2

sudo mv Zotero_linux-x86_64 /opt/zotero

rm -rf zotero64.tar.bz2

cd /opt/zotero

sudo ./set_launcher_icon

sudo ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
