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
colorscheme molokai

" setup bundles/ for plugins
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" apparently this is required for NERDCommenter
filetype plugin on
