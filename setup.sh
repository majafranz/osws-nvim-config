#!/bin/bash

# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Expose nvim globally.
mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim

# Install Packer
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Link configuration to ~/.config
ln -s $PWD/config ~/.config/nvim
