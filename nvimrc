set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let mapleader = "\<SPACE>"

" Mappings
nnoremap ;w :w<CR>
inoremap jk <Esc>:w<CR>
" indent faster
vnoremap < <gv
vnoremap > >gv
" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
imap <C-c> <CR><Esc>O

set mouse=
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set expandtab           " Insert spaces when TAB is pressed.
set ruler
set number
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set backspace=2         " fix backspace
set clipboard=unnamed   " mac paste
set splitbelow
set splitright
set noerrorbells        " No beeps.
set gdefault            " always globally replace by default
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set nohlsearch          " Don't highlight the search
set incsearch
set backupdir=$TMPDIR// " store swp files and temp files in system tmpdir
set directory=$TMPDIR//

if &listchars ==# 'eol:$'
  set listchars=trail:-,extends:>,precedes:<,nbsp:+
endif

syntax enable
set t_Co=256

hi Normal guibg=NONE ctermbg=NONE

if (has("termguicolors"))
set termguicolors
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" Customizing fzf appearance (e.g., use a floating window)
let g:fzf_layout = { 'window': 'enew' } " Open fzf in a new window

" Basic Keybindings
nnoremap <C-p> :Files<CR> 
nnoremap <C-f> :Rg<CR>
nnoremap <C-b> :Buffers<CR>
