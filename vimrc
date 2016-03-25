set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" custom plugins

" Language specific
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'Raimondi/delimitMate'

" workflow specific
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/ag.vim'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'yosiat/oceanic-next-vim'
Plugin 'djoshea/vim-autoread'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Turn on syntax highlighting
syntax on

" tabs as spaces
set expandtab
set tabstop=2
set shiftwidth=2

" fix backspace
set backspace=2

" line nums
set number
set ruler

" refresh on file change on disk
set autoread

" store swp files and temp files in system tmpdir
set backupdir=$TMPDIR//
set directory=$TMPDIR//

" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" leader
let mapleader = ","

" Allow JSX in normal JS files
let g:jsx_ext_required = 0 

" NerdTree bind
map <C-n> :NERDTreeToggle<CR>

" Automatically open NERDTree
autocmd vimenter * NERDTree

" Automatically open NERDTree when vim starts without files selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Vim when it's the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdtree tabs on startup
let g:nerdtree_tabs_open_on_console_startup=1

" Visual Customization
set t_Co=256
colorscheme OceanicNext

" Mapping line splitting w/ delimit
imap <C-c> <CR><Esc>O

" linting
let g:syntastic_javascript_checkers = ['eslint']

" ctrlp ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
  source $LOCALFILE
endif

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
