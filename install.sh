#!/bin/bash

mkdir -p ~/.config/nvim
cp ./.config/nvim/init.vim ~/.config/nvim/
cp ./.tmux.conf ~/
cp ./.pylintrc ~/
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

