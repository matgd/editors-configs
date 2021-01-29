#!/bin/bash


# install neovim
sudo apt-get update && sudo apt-get -y install neovim

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# get .vimrc
mkdir "${HOME}/.config/nvim"
curl -s https://raw.githubusercontent.com/matgd/editors-configs/master/Neovim/.nvimrc > "${HOME}/.config/nvim/init.vim"

# add alias to .bashrc
echo "alias vim='nvim'" >> "${HOME}/.bashrc"
