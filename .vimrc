call plug#begin('~/.vim/plugged')

" HTML syntax
Plug 'othree/html5.vim'

" CSS and SCSS syntax
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'

" Ruby syntax
Plug 'vim-ruby/vim-ruby'

" Rails plugin
Plug 'https://github.com/tpope/vim-rails.git'

" Python syntax
Plug 'kh3phr3n/python-syntax'

" Javascript syntax
Plug 'https://github.com/pangloss/vim-javascript.git'

" JSX syntax
Plug 'mxw/vim-jsx'

" NERDTree
Plug 'https://github.com/scrooloose/nerdtree.git'

" NERDTree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Use vim-airline for status bar
Plug 'vim-airline/vim-airline'

" Use gitgutter for git information on editor
Plug 'airblade/vim-gitgutter'

" Use ctrl p for fuzzy finder
Plug 'kien/ctrlp.vim'

" Git wrapper
Plug 'tpope/vim-fugitive'

call plug#end()

" Enable jsx syntax on .js files
let g:jsx_ext_required=0

" Load NERDTree on startup
autocmd vimenter * NERDTree %:p:h
autocmd VimEnter * wincmd p

" Show hidden files on NERDTree
let NERDTreeShowHidden=1

" Hide specific files on NERDTree
let NERDTreeIgnore=['\.DS_Store$', '\.swp$', '\.git$']

" Enable all python highlight
let python_highlight_all=1

" Fix autoindentation for using spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable buffer list
let g:airline#extensions#tabline#enabled=1

" Show only the filename and buffer number on buffer list
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#buffer_nr_show=1

" Show end of line character
set listchars=tab:→\ ,trail:·
set list

" Use relative number
set relativenumber
set number

" Display line on current line
set cursorline

" Change terminal's title
set title

" Enable line numbers on NERDTree
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" Hide 'Press ? for help' on NERDTree
let NERDTreeMinimalUI=1

" Change NERDTree size
let NERDTreeWinSize=35

" Disable caching on ctrl-p and use silver searcher
let g:ctrlp_use_caching = 0
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --hidden $1'
endif

" Expand spaces to nothing on ctrl-p
let g:ctrlp_abbrev = {
  \ 'abbrevs': [
    \ {
      \ 'pattern': ' ',
      \ 'expanded': '',
      \ 'mode': 'fprz',
    \ },
  \ ]
\ }
