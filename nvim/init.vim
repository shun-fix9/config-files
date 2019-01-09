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

set hidden

let loaded_matchparen = 1
let g:netrw_browse_split = 1

map <SPACE>s :w<CR>
map <SPACE>q :bd!<CR>
map <SPACE>z :!find tmp -type f -a -name build.txt \| xargs touch<CR><CR>
map <SPACE>v :terminal git status-verbose<CR>
map <SPACE>a :!git add -A<CR><CR>
map <SPACE>c :!git create-work-branch "
map <SPACE>x :!git purge

nnoremap j gj
nnoremap k gk
