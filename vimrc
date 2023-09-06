set nu
set encoding=utf-8
syntax on
set ignorecase
set wildmenu
map f :!/usr/bin/fish<CR> <CR>

nnoremap <C-a> <C-w>

set guioptions-=T

set mouse=

au FileType tex map b :wall <bar> !latexmk -pv<CR><CR>
au FileType tex map t :VimtexTocOpen<CR>
au FileType tex set spell

au FileType python set tabstop=4
au FileType python set smartindent
au FileType python set shiftwidth=4
au FileType python set expandtab

au FileType scala set softtabstop=2
au FileType sbt set softtabstop=2

filetype plugin on

highlight LineNr ctermfg=darkgrey

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:switch_mapping = "-"

call plug#begin('~/.vim/plugged')
" --------- Plugins from here -----------
Plug 'lervag/vimtex'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/cocopon/iceberg.vim.git'
Plug 'https://github.com/gregjurman/vim-nc.git'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'https://github.com/sirtaj/vim-openscad'
Plug 'https://github.com/AndrewRadev/switch.vim'
Plug 'tpope/vim-surround'
" ------------- to here -----------------
call plug#end()

colorscheme iceberg

augroup latexSurround
  autocmd!
  autocmd FileType tex call s:latexSurround()
augroup END 

function! s:latexSurround()
  let b:surround_{char2nr("e")}
    \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
  let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction
