#!/bin/bash

CYAN='\033[1;36m'
YELLOW='\033[1;93m'
NC='\033[0m'

VIMRC_LOCATION="${HOME}/.vimrc"

install_vim=0
install_nerdtree=$([[ -d ${HOME}/.vim/pack/vendor/start/nerdtree/ ]] && echo 0 || echo 1)
install_syntastic=$([[ -d ${HOME}/.vim/pack/vendor/start/syntastic/ ]] && echo 0 || echo 1)
install_fzf=$(which -s fzf; echo $?)
setup_vimrc=$([[ -f ${VIMRC_LOCATION} ]] && echo 0 || echo 1) 

function installVim {
  sudo apt-get update 
  sudo apt-get -y install vim
}

function installNERDTree {
  git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
  vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
}

function installSyntastic {
  git clone https://github.com/vim-syntastic/syntastic ~/.vim/pack/vendor/start/syntastic
  vim -u NONE -c "helptags ~/.vim/pack/vendor/start/syntastic/doc" -c q
}

function installFuzzyFinder {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

function setupVimrc {
  curl -s https://raw.githubusercontent.com/matgd/editors-configs/master/Vim/.vimrc > "${VIMRC_LOCATION}"
}

function binaryToYesNo {
  BLUE='\033[1;34m'
  RED='\033[0;31m'

  if [[ ${1} -eq 1 ]]; then
    printf "${BLUE}YES${NC}"
  else 
    printf "${RED}NO${NC}"
  fi
}

function printMainPrompt {
  echo "============================="
  printf "${CYAN}   Vim addons installation   ${NC}\n"
  echo "============================="
  echo "Choose: "
  echo "-----------------------------"
  printf "1. Install newest Vim?   $(binaryToYesNo ${install_vim}) \n" 
  printf "2. Install NERDTree?     $(binaryToYesNo ${install_nerdtree}) \n"
  printf "3. Install Syntastic?    $(binaryToYesNo ${install_syntastic}) \n"
  printf "4. Install fzf?          $(binaryToYesNo ${install_fzf}) \n"
  printf "5. Setup .vimrc?         $(binaryToYesNo ${setup_vimrc}) \n"
  printf "\n"
  printf "0.  Confirm \n"
  printf "99. Exit \n"
  echo "-----------------------------"
}

if ! which -s git; then 
  printf "${YELLOW}Couldn't find git, please install it first.${NC}\n"
  exit 1;
fi   

answer=''
while [[ ! ${answer} == 0 ]]; do
  clear
  printMainPrompt
  read -p "> " answer
  case ${answer} in
    1) install_vim=$((${install_vim} ^ 1))  # using XOR
       ;;
    2) install_nerdtree=$((${install_nerdtree} ^ 1))
       ;;
    3) install_syntastic=$((${install_syntastic} ^ 1))
       ;;
    4) install_fzf=$((${install_fzf} ^ 1))
       ;;
    5) setup_vimrc=$((${setup_vimrc} ^ 1))
       ;;
    0) [[ ${install_vim} -eq 1 ]] && installVim
       [[ ${install_nerdtree} -eq 1 ]] && installNERDTree
       [[ ${install_syntastic} -eq 1 ]] && installSyntastic
       [[ ${install_fzf} -eq 1 ]] && installFuzzyFinder
       [[ ${setup_vimrc} -eq 1 ]] && setupVimrc
       exit 0;
       ;;
    99) exit 99
        ;;
  esac
done
