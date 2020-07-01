#!/bin/bash

CYAN='\033[1;36m'
NC='\033[0m'

install_vim=0
install_nerdtree=1
install_fzf=$(which fzf > /dev/null; echo $?)
setup_vimrc=1

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
  printf "3. Install fzf?          $(binaryToYesNo ${install_fzf}) \n"
  printf "4. Setup .vimrc?         $(binaryToYesNo ${setup_vimrc}) \n"
  printf "\n"
  printf "0.  Confirm \n"
  printf "99. Exit \n"
  echo "-----------------------------"
}

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
    3) install_fzf=$((${install_fzf} ^ 1))
       ;;
    4) setup_vimrc=$((${setup_vimrc} ^ 1))
       ;;
    0) echo OK
       ;; 
    99) exit 99
        ;;
  esac
done
