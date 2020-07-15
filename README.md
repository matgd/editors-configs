# Editors Configs

Easy-to-run addon configuration scripts for editors.

## Neovim
___In future it will be a script.___

### Debian (APT)
Install Neovim
```bash
sudo apt-get update && sudo apt-get -y install neovim
```
Install vim-plug
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
Copy .vimrc
```bash
curl -s https://raw.githubusercontent.com/matgd/editors-configs/master/Neovim/.vimrc > "${HOME}/.vimrc"
```

Add alias to .bashrc (optional)
```bash
echo "alias vim='nvim'" >> "${HOME}/.bashrc"
```

Install plugins
1. Open Neovim
2. Go to NORMAL mode 
3. Type `:PlugInstall`

Done!

### MacOS (brew)
Install Neovim
```bash
brew install neovim
```

Install vim-plug
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Copy .vimrc
```bash
curl -s https://raw.githubusercontent.com/matgd/editors-configs/master/Neovim/.vimrc > "${HOME}/.vimrc"
```

Add alias to .bash_profile (optional)
```bash
echo "alias vim='nvim'" >> "${HOME}/.bash_profile"
```

Install plugins
1. Open Neovim
2. Go to NORMAL mode 
3. Type `:PlugInstall`

Done!

## Vim

Script can install newest Vim with NERDTree and Syntastic plugin (without any plugin manager). Additionally Fuzzy Finder (fzf) can be downloaded and installed.

### Debian (APT)
```bash
bash <(curl -s https://raw.githubusercontent.com/matgd/editors-configs/master/Vim/apt/install.sh)
```
