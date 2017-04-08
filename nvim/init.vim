if &compatible
  set nocompatible
endif

let s:dein_repo_dir = '/home/shun/.config/nvim/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state('/home/shun/.config/nvim')
  call dein#begin('/home/shun/.config/nvim')

  call dein#load_toml('/home/shun/.config/dein/plugins.toml', {'lazy': 0})
  call dein#load_toml('/home/shun/.config/dein/lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

set backspace=indent,start,eol

set encoding=utf-8
set fileencodings=utf-8,cp932,iso-2022-jp
set completeopt=preview

set history=100
set incsearch
set laststatus=2
set matchtime=1

set nrformats=octal,hex,alpha
set pastetoggle=<F10>
set ruler
set scrolloff=3
set shiftround
set showcmd
set showmatch

set t_RV=

set expandtab
set tabstop=4
set softtabstop=2
set shiftwidth=2

set updatecount=50

set number
set noequalalways
set nobackup
set smartindent
set autoindent

set t_Co=256

set ambiwidth=double
set formatoptions=mMql
set textwidth=0

set visualbell
set visualbell t_vb=

set hlsearch

set foldmethod=manual
set foldlevel=10000
set foldnestmax=1

let loaded_matchparen = 1
let g:netrw_browse_split = 1

map ,s :w<CR>
map ,q :q<CR>
map ,w :x<CR>
map ,u :call dein#install()<CR>

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

map + <C-W>+
map - <C-W>-

nmap <silent> <F6> :set number!<CR>

nnoremap j gj
nnoremap k gk
