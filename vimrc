" syntax highlighting!
syntax on

" we like line numbers
set number ruler

" utf8 everything
set encoding=utf8
set fileencoding=utf8

" sensible tabbing
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4

" remove the menubar
if has("gui_running")
   set guioptions-=T
endif

" show invisible characters
set list
set listchars=tab:▸\ ,eol:¬

" sensible leader key
let mapleader=","

" nice colour scheme
"set background=dark
colorscheme molokai

" copied from https://github.com/gmarik/vundle#about
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" all the extra bundle/plugins I want
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-perl/vim-perl'
Bundle 'Valloric/YouCompleteMe'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'

" apparently this is required for NERDCommenter
filetype plugin on

" toggle long line highlight
map <leader>h :match ErrorMsg '\%>80v.\+'

" fix template toolkit highlighting
filetype on
au BufNewFile,BufRead *.ttk set filetype=tt2html
au BufNewFile,BufRead *.tt set filetype=tt2html
