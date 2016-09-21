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

call plug#begin('~/.config/nvim/plugged')
" Navigate tmux splits easily
  Plug 'christoomey/vim-tmux-navigator'
  " fix neovim left navigate
    nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" File Tree
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  " toggle mapping
    map <C-n> :NERDTreeTabsToggle<CR>

  " Automatically open NERDTree when vim starts without files selected
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif

  " Close Vim when it's the only window open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " nerdtree tabs on startup
    let g:nerdtree_tabs_open_on_console_startup=1

" Cool statusline
  Plug 'bling/vim-airline'
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

" comments
    Plug 'scrooloose/nerdcommenter'
    let g:NERDSpaceDelims = 1
" Syntax
  Plug 'ervandew/supertab'
  let g:SuperTabDefaultCompletionType = "<c-n>" " Make the tabing on completion menu go from top to bottom
  let g:SuperTabClosePreviewOnPopupClose = 1 " Close the preview when completion ends

" Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
  " Sleuth - automatically figure out indent
    Plug 'tpope/vim-sleuth'
  " Delimate
    Plug 'Raimondi/delimitMate'

" Neosnippet
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'

" Code Completion
  " Deoplete
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugin' }
    Plug 'Shougo/neoinclude.vim'
      let g:deoplete#enable_at_startup = 1
      " <Tab> completion:
        " 1. If popup menu is visible, select and insert next item
        " 2. Otherwise, if within a snippet, jump to next input
        " 3. Otherwise, if preceding chars are whitespace, insert tab char
        " 4. Otherwise, start manual autocomplete
        imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
          \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
          \ : (<SID>is_whitespace() ? "\<Tab>"
          \ : deoplete#mappings#manual_complete()))

        smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
          \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
          \ : (<SID>is_whitespace() ? "\<Tab>"
          \ : deoplete#mappings#manual_complete()))

        inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:is_whitespace() "{{{
          let col = col('.') - 1
          return ! col || getline('.')[col - 1] =~? '\s'
        endfunction "}}}


" Go
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'nsf/gocode', { 'rtp': 'nvim/' }
  Plug 'zchee/deoplete-go', { 'do': 'make' }
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
  " Test options
    map <C-i><C-v> :GoCoverage<CR>
    map <C-i><C-x> :GoCoverageClear<CR>"
    map <C-i><C-t> :GoTest<CR>"

" search better
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
    fun! s:fzf_root()
      let path = finddir(".git", expand("%:p:h").";")
      return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
    endfun
    let g:fzf_nvim_statusline = 0 " disable statusline overwriting
    nnoremap <C-p> :exe 'Files ' . <SID>fzf_root()<CR>
    nnoremap <silent> <leader>a :Buffers<CR>
    nnoremap <silent> <leader>A :Windows<CR>
    nnoremap <silent> <leader>; :BLines<CR>
    nnoremap <silent> <leader>. :Lines<CR>
    nnoremap <silent> <leader>b :BTags<CR>
    nnoremap <silent> <leader>t :Tags<CR>
    nnoremap <silent> <leader>? :History<CR>
    nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
    nnoremap <silent> K :call SearchWordWithAg()<CR>
    vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
    nnoremap <silent> <leader>gl :Commits<CR>
    nnoremap <silent> <leader>ga :BCommits<CR>
    nnoremap <silent> <leader>ft :Filetypes<CR>

    imap <C-x><C-f> <plug>(fzf-complete-file-ag)
    imap <C-x><C-l> <plug>(fzf-complete-line)

    function! SearchWordWithAck()
      execute 'Ack' expand('<cword>')
    endfunction

" Javascript
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'elzr/vim-json'
  Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] , 'do': 'npm i' }
  Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'moll/vim-node'

" Linting
" Neomake
  Plug 'benekastah/neomake'
    " autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    autocmd InsertChange,TextChanged * update | Neomake
    let g:neomake_javascript_enabled_makers = ['eslint']
    let g:neomake_go_enabled_makers = ['golint', 'govet']
    autocmd! BufWritePost,BufEnter * Neomake
    autocmd! FileType javascript let b:neomake_javascript_eslint_maker = {'args': ['-c .eslintrc']}
    autocmd! FileType javascript.jsx let b:neomake_javascript_eslint_maker = {'args': ['-c .eslintrc-jsx']}

" Thrift better
  Plug 'solarnz/thrift.vim'

" Git
  Plug 'airblade/vim-gitgutter'
  Plug 'jreybert/vimagit'
  Plug 'tpope/vim-fugitive'

" Colorscheme
  Plug 'mhartington/oceanic-next'

" autoread files
  Plug 'djoshea/vim-autoread'

" vim formatting
  Plug 'terryma/vim-expand-region' " highlight
    vmap K <Plug>(expand_region_expand)
    vmap J <Plug>(expand_region_shrink)
  Plug 'tpope/vim-surround' " wrap
  Plug 'christoomey/vim-sort-motion' " sort

" Search through multiple files
  Plug 'mileszs/ack.vim'
  " Ack -> Ag
    if executable('ag')
      let g:ackprg = 'ag --vimgrep'
    endif
    cnoreabbrev ag Ack
    cnoreabbrev aG Ack
    cnoreabbrev Ag Ack
    cnoreabbrev AG Ack

call plug#end()

" Colorscheme
 " Theme
  syntax enable
  set t_Co=256
  colorscheme OceanicNext
  set background=dark
  let g:airline_theme='oceanicnext'
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  if (has("termguicolors"))
    set termguicolors
  endif

" Ultisnips
" default dir
" autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Configuration for custom snips
let g:UltiSnipsSnippetsDir = "~/dotfiles"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]

" Trigger configuration.
let g:UltiSnipsExpandTrigger = "<F6>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Use Python Version
let g:UltiSnipsUsePythonVersion = 3

let g:ultisnips_python_style="google"
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
