" recommended from https://github.com/joshdick/onedark.vim
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


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
colorscheme onedark

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
