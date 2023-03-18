#!/usr/bin/env bash

set -e -x
set -eo pipefail

NVIM_DIR=$HOME/.config/nvim

# bash lsp for coc-sh
sudo npm i -g bash-language-server

mkdir -p $NVIM_DIR
ln -s $PWD/init.vim $NVIM_DIR/init.vim
ln -s $PWD/coc-settings.json $NVIM_DIR/coc-settings.json

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installing plugins..."
nvim -c "PlugInstall" -c "qa"
nvim -c "CocInstall coc-rust-analyzer coc-go coc-json coc-sh coc-clangd" 

