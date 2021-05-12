set nu rnu
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set scrolloff=5

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
" Plug 'scrooloose/syntastic'

Plug 'preservim/nerdcommenter'
" Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sickill/vim-monokai'
" Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
call plug#end()
highlight Pmenu ctermfg=4 ctermbg=0 guifg=#ffffff guibg=#000000
highlight PmenuSel ctermfg=10 ctermbg=0 guifg=#ffffff guibg=#000000


set ttimeoutlen=100

" golang
filetype plugin indent on

set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" autocompletion after dot
let g:syntastic_python_python_exec = 'python3.9'

let g:syntastic_disabled_filetypes=['python']


" Moving lines
nnoremap <silent> <M-Up>    :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<CR>``
nnoremap <silent> <M-Down>  :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<CR>``

inoremap <silent> <M-Up>    <C-O>m`<C-O>:move -2<CR><C-O>``
inoremap <silent> <M-Down>  <C-O>m`<C-O>:move +1<CR><C-O>``

vnoremap <silent> <M-Up>    :<C-U>exec "'<,'>move '<-" . (1+v:count1)<CR>gv
vnoremap <silent> <M-Down>  :<C-U>exec "'<,'>move '>+" . (0+v:count1)<CR>gv
