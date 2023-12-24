#!/bin/bash

set -e

function link() {
  echo "ln -sn $1 $2"
  ln -sn $1 $2
}

function setup_nvim() {
  git clone https://github.com/NvChad/NvChad.git ~/.config/nvim
  git clone https://github.com/nightn/custom-NvChad.git ~/.config/nvim/lua/custom
}

DIR=`pwd`

link $DIR/bashrc ~/.bashrc
link $DIR/gitconfig ~/.gitconfig
# use nvim instead
# link $DIR/vimrc ~/.vimrc
link $DIR/npmrc ~/.npmrc

mkdir -p ~/.config/pip
link $DIR/pip.conf ~/.config/pip/pip.conf

