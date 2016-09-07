set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.config/nvim/plugged')

" Language specific
Plug 'Raimondi/delimitMate'

"" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'bentayloruk/vim-react-es6-snippets'
Plug 'moll/vim-node'

"" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', {'rtp': 'vim/'}

" Thrift
Plug 'solarnz/thrift.vim'

" workflow specific
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-sort-motion'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

Plug 'christoomey/vim-tmux-navigator'
  
Plug 'yosiat/oceanic-next-vim'
Plug 'chriskempson/base16-vim'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'djoshea/vim-autoread'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-expand-region'
Plug 'bling/vim-airline'

Plug 'lfilho/cosco.vim'

" All of your Plugs must be added before the following line
call plug#end()
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
let mapleader = "\<Space>"

" Allow JSX in normal JS files
let g:jsx_ext_required = 1

" NerdTree bind
map <C-n> :NERDTreeToggle<CR>



" Automatically open NERDTree when vim starts without files selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif

" Close Vim when it's the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdtree tabs on startup
let g:nerdtree_tabs_open_on_console_startup=1

" nerd commenter add space
let g:NERDSpaceDelims = 1


" Column for max line length
set colorcolumn=120

" Visual Customization
set t_Co=256
colorscheme OceanicNext

" Mapping line splitting w/ delimit
imap <C-c> <CR><Esc>O

set showcmd

" Natural splits
set splitbelow
set splitright

" copy mac
set clipboard=unnamed

" save faster
nnoremap ;w :w<CR>
inoremap jk <Esc>:w<CR>

vmap K <Plug>(expand_region_expand)
vmap J <Plug>(expand_region_shrink)

" indent faster
vnoremap < <gv
vnoremap > >gv

" resize faster
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" linting
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_Map = { 'mode': 'active', 'passive_filetypes': ['go']}

autocmd FileType javascript let b:syntastic_javascript_eslint_args = '-c .eslintrc'
autocmd FileType javascript.jsx let b:syntastic_javascript_eslint_args = '-c .eslintrc-jsx'

" ctrlp ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist\|vendor\|env_docs'

" Go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" GoDef options
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" ultisnips
" Python version
let g:UltiSnipsUsePythonVersion = 2

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<tab>'

let g:UltiSnipsExpandTrigger = "<F6>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
  source $LOCALFILE
endif

" GoImports bind
map <C-i><C-v> :GoCoverage<CR>
map <C-i><C-x> :GoCoverageClear<CR>"
map <C-i><C-t> :GoTest<CR>"

" Ack -> Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev ag Ack                                                                           
cnoreabbrev aG Ack                                                                           
cnoreabbrev Ag Ack                                                                           
cnoreabbrev AG Ack  

" airline
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'


