set nu rnu
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

let mapleader = " "

" fzf
set rtp+=/usr/local/opt/fzf
map <leader>f :FZF<CR>

" NERDTree
map <C-b> :NERDTreeToggle<CR>
map <leader>b :NERDTreeToggle<CR>

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
call plug#end()
