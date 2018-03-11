set nu
syntax on
set ignorecase
set wildmenu

au FileType tex map b :wall <bar> !latexmk<CR><CR>
au FileType tex map t :VimtexTocOpen<CR>
au FileType tex set spell

au FileType python set tabstop=4
au FileType python set smartindent
au FileType python set shiftwidth=4
au FileType python set expandtab

highlight LineNr ctermfg=darkgrey

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" --------- Plugins from here -----------
Plug 'lervag/vimtex'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
" ------------- to here -----------------
call plug#end()
