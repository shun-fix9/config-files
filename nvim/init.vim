if &compatible
  set nocompatible
endif

let s:dein_repo_dir = '/home/shun/.config/nvim/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state('/home/shun/.cache/dein')
  call dein#begin('/home/shun/.cache/dein')

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

set directory=$HOME/.vim/swapfiles//

let loaded_matchparen = 1
let g:netrw_browse_split = 1

nnoremap <silent> <SPACE>s :w<CR>
nnoremap <silent> <SPACE>h :noh<CR>
nnoremap <silent> <SPACE>w :bd!<CR>

nnoremap <silent> <SPACE>v :terminal git status-verbose<CR>
nnoremap <silent> <SPACE>d :terminal git diff<CR>
nnoremap <silent> <SPACE>D :terminal git diff --cached<CR>
nnoremap <silent> <SPACE>a :!git add %<CR><CR>:terminal git status-verbose<CR>
nnoremap <silent> <SPACE>A :!git add -A<CR><CR>:terminal git status-verbose<CR>
nnoremap <silent> <SPACE>c q:a!git fetch --all && git create-work-branch ""<LEFT>
nnoremap <SPACE>p :!git pub
nnoremap <SPACE>u :!git up
nnoremap <SPACE>x :!git fetch --all --prune && git purge && git wipe-widow-branch
nnoremap <SPACE>g :!git grep ""<LEFT>
nnoremap <SPACE>G :!git grep "" \| sed "s/:.*//" \| uniq \| xargs /bin/echo<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>

nnoremap <SPACE><BACKSPACE> :!rm -f ~/.vim/swapfiles/*

noremap <F6> :set invnumber<CR>

nnoremap j gj
nnoremap k gk

imap <C-L> <Esc>
