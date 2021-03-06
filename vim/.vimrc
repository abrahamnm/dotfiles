"                                          .         .
" `8.`888b           ,8'  8 8888          ,8.       ,8.          8 888888888o.       ,o888888o.
"  `8.`888b         ,8'   8 8888         ,888.     ,888.         8 8888    `88.     8888     `88.
"   `8.`888b       ,8'    8 8888        .`8888.   .`8888.        8 8888     `88  ,8 8888       `8.
"    `8.`888b     ,8'     8 8888       ,8.`8888. ,8.`8888.       8 8888     ,88  88 8888
"     `8.`888b   ,8'      8 8888      ,8'8.`8888,8^8.`8888.      8 8888.   ,88'  88 8888
"      `8.`888b ,8'       8 8888     ,8' `8.`8888' `8.`8888.     8 888888888P'   88 8888
"       `8.`888b8'        8 8888    ,8'   `8.`88'   `8.`8888.    8 8888`8b       88 8888
"        `8.`888'         8 8888   ,8'     `8.`'     `8.`8888.   8 8888 `8b.     `8 8888       .8'
"         `8.`8'          8 8888  ,8'       `8        `8.`8888.  8 8888   `8b.      8888     ,88'
"          `8.`           8 8888 ,8'         `         `8.`8888. 8 8888     `88.     `8888888P'
"
" Author: Abraham NM <hola@abrahamnm.com>
"
" Forked from AwkwardKore/dotfiles
"
" This file was created scratching around the web to suit my needs and
" preferences, you may want to change it to match yours.

set nocompatible

" Install Plug and install plugins if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" =========================================================
"                         PLUGINS
" =========================================================

call plug#begin('~/.vim/plugged')

" HTML syntax
Plug 'othree/html5.vim'

" CSS and Stylus syntax
Plug 'JulesWang/css.vim'
Plug 'iloginow/vim-stylus'

" Javascript syntax
Plug 'https://github.com/pangloss/vim-javascript.git'

" NERDTree
Plug 'https://github.com/scrooloose/nerdtree.git'

" NERDTree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Use vim-airline for status bar
Plug 'vim-airline/vim-airline'

" Use vim-airline themes
Plug 'vim-airline/vim-airline-themes'

" Use gitgutter for git information on editor
Plug 'airblade/vim-gitgutter'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Use ctrl p for fuzzy finder
Plug 'kien/ctrlp.vim'

" OneDark Theme
Plug 'joshdick/onedark.vim'

" Change surrounding
Plug 'tpope/vim-surround'

" Comment lines
Plug 'tomtom/tcomment_vim'

" Vue syntax
Plug 'posva/vim-vue'

" IDE
Plug 'easymotion/vim-easymotion'

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" WakaTime
Plug 'wakatime/vim-wakatime'

" Indent lines
Plug 'Yggdroot/indentLine'

" Rainbow Parentheses
Plug 'luochen1990/rainbow'

call plug#end()

" =========================================================
"                     GENERAL SETTINGS
" =========================================================

" Set encoding to utf-8
set encoding=utf-8

set spelllang=en_us,es

" Update sign column every quarter second
set updatetime=100

" Let vim-airline handle showing mode
set noshowmode

" Change auto indentation to use spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Use 4 tab spaces when using .php extension
au FileType php set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

au FileType vue set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Don't Wrap on long lines and add visual marker for long lines
set nowrap

" You shall not pass from this column
set colorcolumn=80

" Add line numbers
set number

" Display line on current line
set cursorline

" Change Titles
set title

" Display relative numbers instead of specific ones
set relativenumber

" Centralize backups, swap files and undo history
call system("mkdir -p $HOME/.vim/backups")
call system("mkdir -p $HOME/.vim/swaps")
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" Setup persistent undo
call system("mkdir -p $HOME/.vim/undo")
set undodir=$HOME/.vim/undo/
set undofile

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Ignore case unless a capital is written
set smartcase

" Highlight dynamically as pattern is typed
set incsearch

" Disable error bells
set noerrorbells
set visualbell

" Display 5 lines after/before cursor
set scrolloff=5

" Highlight matching pairs of brackets
set matchpairs+=<:>

" Keep the cursor on the same column
set nostartofline

" Open vertical splits to the right/bottom
set splitright
set splitbelow

" Hide buffers instead of closing them when moving between buffers
set hidden

" Save buffers ?
set confirm

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" Remove trailing spaces on write
autocmd BufWritePre * %s/\s\+$//e

" Move to last known cursor position when opens
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \	exe "normal! g`\"" |
      \ endif

" Add indentation guide lines and make them barely visible
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_gui = '#323740'

" Enable rainbow parentheses
let g:rainbow_active = 1

" =========================================================
"                       AIRLINE
" =========================================================

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_skip_empty_sections = 1
let g:airline_theme = 'bubblegum'
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'c'  : 'C',
    \ 'i'  : 'I',
    \ 'ic' : 'I',
    \ 'ix' : 'I',
    \ 'n'  : 'N',
    \ 'ni' : 'N',
    \ 'no' : 'N',
    \ 'R'  : 'R',
    \ 'Rv' : 'R',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ 't'  : 'T',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ }

" =========================================================
"                       NERDTREE
" =========================================================

" Load NERDTree on startup
" autocmd vimenter * NERDTree %:p:h
" autocmd VimEnter * wincmd p

" Load NERDTree on the right
let g:NERDTreeWinPos = "right"

" Show hidden files on NERDTree
let NERDTreeShowHidden=1

" Hide specific files on NERDTree
let NERDTreeIgnore=['\.DS_Store$', '\.swp$', '\.git$']

" Enable line numbers on NERDTree
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" Hide 'Press ? for help' on NERDTree
let NERDTreeMinimalUI=1

" Change NERDTree size
let NERDTreeWinSize=35

" Map Ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Display 'NERDTree' on NERDTree status line instead of root path
let g:NERDTreeStatusline='NERDTree'

" =========================================================
"                   CTRLP FUZZY FINDER
" =========================================================

" Disable caching
" let g:ctrlp_use_caching = 0

" Use silver searcher
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --hidden $1'
endif

let g:ctrlp_custom_ignore = '\v[\/](vendor|node_modules|src-cordova|target|dist)|(\.(swp|ico|git|svn))$'

" Ignore spaces
let g:ctrlp_abbrev = {
  \ 'abbrevs': [
    \ {
      \ 'pattern': ' ',
      \ 'expanded': '',
      \ 'mode': 'fprz',
    \ },
  \ ]
\ }

"=========================================================
"                         THEME
" =========================================================

" Configure theme to use material-monokai
set termguicolors
syntax on
colorscheme onedark

"=========================================================
"                   CUSTOM SHORTCUTS
" =========================================================

let mapleader = ','

" Write to file
noremap <leader>w :w<cr>

" Delete buffer
noremap <silent> <leader>q :bd<cr>

" Insert new line in normal mode
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

" Get out of Insert Mode
inoremap ii <Esc>l

" Clear highlights made by last search
nnoremap <silent> <leader>c :noh<cr>

" Make scrolling view faster
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" Use space to Page Down/Up
nnoremap <Space> <C-d>

" Remap movement between splits for easier navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Navigate between splits
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" Move lines Up/Down
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv

" Indent/Unindent lines
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv

" Find file in NERDTree
nnoremap <silent> <leader>ff :NERDTreeFind<CR>

" Git related
nnoremap <silent> <leader>g :G<cr>
nnoremap <silent> <leader>gf :diffget //2<cr>
nnoremap <silent> <leader>gj :diffget //3<cr>

"=========================================================
"                  EASYMOTION
" =========================================================

" EasyMotion shortcuts
map <leader>2 <Plug>(easymotion-s2)
map <leader>s <Plug>(easymotion-s)

" EasyMotion SmartCase
let g:EasyMotion_smartcase = 1

"=========================================================
"                CONQUER OF COMPLETION
" =========================================================

let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-json',
        \ 'coc-tsserver',
        \ 'coc-vetur',
        \ 'coc-eslint',
        \ 'coc-pairs',
        \ 'coc-emmet',
        \ 'coc-phpls',
        \ ]


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
