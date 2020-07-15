set nu rnu
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" fzf
set rtp+=/usr/local/opt/fzf

" NERDTree
map <C-b> :NERDTreeToggle<CR>

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
