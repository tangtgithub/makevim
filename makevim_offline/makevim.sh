#!/bin/bash

CurrentScriptDir=$(dirname $(realpath $0))

sudo apt-get install ctags
sudo apt-get install cscope

rm -rf ~/.vim
mkdir ~/.vim
cp -r vim_runtime ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

cp $CurrentScriptDir/my_configs.vim  ~/.vim_runtime
cp $CurrentScriptDir/auto-pairs.vim  ~/.vim_runtime/sources_non_forked/auto-pairs/plugin/

sudo cp $CurrentScriptDir/syncSymbol.sh /usr/local/bin/cssync
