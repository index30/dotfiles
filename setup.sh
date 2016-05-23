#!/bin/bash

git clone https://github.com/index30/dotfiles.git ~/.dotfiles/

cd ~/
array=(".emacs.d" ".gitconfig" ".zshrc" ".bashrc")
i=0
for e in ${array[@]}; do
    ln -s ~/.dotfiles/${e}
done
