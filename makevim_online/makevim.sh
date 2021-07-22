#!/bin/bash

CurrentScriptDir=$(dirname $(realpath $0))

sudo apt-get install ctags
sudo apt-get install cscope

rm -rf ~/.vim
mkdir ~/.vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

cd ~/.vim_runtime/sources_non_forked
git clone https://github.com/vim-scripts/taglist.vim.git
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/mbbill/echofunc.git

cp $CurrentScriptDir/my_configs.vim  ~/.vim_runtime
cp $CurrentScriptDir/auto-pairs.vim  ~/.vim_runtime/sources_non_forked/auto-pairs/plugin/

sudo cp $CurrentScriptDir/syncSymbol.sh /usr/local/bin/cssync
