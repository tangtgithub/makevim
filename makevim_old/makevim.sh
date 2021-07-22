#!/bin/sh

WORK_PATH=$(dirname $(readlink -f $0))

cd ~/
HOME_PATH=$(dirname $(readlink -f $0))

DIR_PLUGIN="${HOME_PATH}/.vim/plugin"
DIR_DOC="${HOME_PATH}/.vim/doc"
FILE_VIMRC="${HOME_PATH}/.vimrc"


if [ ! -d ${DIR_PLUGIN} ];then
    mkdir -p ${DIR_PLUGIN}
fi

if [ ! -d ${DIR_DOC} ];then
    mkdir -p ${DIR_DOC}
fi
if [ ! -d ${DIR_PLUGIN} ];then
    mkdir -p ${DIR_PLUGIN}
fi

if [ ! -d ${DIR_DOC} ];then
    mkdir -p ${DIR_DOC}
fi

cd ${WORK_PATH}

sudo apt-get install ctags
sudo apt-get install cscope

sudo cp -f ./nerdtree/doc/* ${DIR_DOC}
sudo cp -f ./taglist/doc/* ${DIR_DOC}
sudo cp -f ./nerdtree/plugin/* ${DIR_PLUGIN}
sudo cp -f ./taglist/plugin/* ${DIR_PLUGIN}
sudo cp -f ./cppSyntaxCheck/plugin/* ${DIR_PLUGIN}
sudo cp -f ./vimrc ${FILE_VIMRC}
echo make success

