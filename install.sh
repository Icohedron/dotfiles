#!/bin/bash

# tmux config
cp .tmux.conf $HOME/.tmux.conf
tmux source-file $HOME/.tmux.conf

# pylintrc
cp .pylintrc $HOME/.pylintrc

# vim/neovim
echo "Are you using vim, neovim, or both? (vim/neovim/both)"
read Vim_Type

using_vim=false
using_neovim=false

if [ $Vim_Type == "vim" ]
then
    using_vim=true
elif [ $Vim_Type == "neovim" ]
then
    using_neovim=true
elif [ $Vim_Type == "both" ]
then
    using_vim=true
    using_neovim=true
fi


if $using_vim
then
    cp .vimrc $HOME/.vimrc
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if $using_neovim
then
    mkdir -p $HOME/.config/nvim/
    cp ./vimrc $HOME/.config/nvim/init.vim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Remember to run :PlugInstall in vim and/or neovim!" # vim -c PlugInstall

