let mapleader = ","
let maplocalleader = "\\"
set nocompatible
filetype off
set noesckeys
" for problem with ncurses from 10.6
inoremap OA <esc><right><up>i
inoremap OB <esc><right><down>i
inoremap OD <esc>i
inoremap OC <esc><right>a

" Load Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-rails.git'
Bundle 'corntrace/bufexplorer'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'emnh/taglist.vim'
Bundle 'godlygeek/csapprox'
Bundle 'vim-scripts/Colour-Sampler-Pack'
Bundle 'vim-scripts/ScrollColors'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mhinz/vim-startify'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'sjl/gundo.vim'
Bundle 'mileszs/ack.vim'
Bundle 'jamessan/vim-gnupg'

" Colorscheme
colorscheme wombat256mod

" Sets title
set title titlestring=

" Syntax Hilighting
syntax on

" Indentation Settings
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on

" copy and paste
set pastetoggle=<C-o>
vnoremap <C-c> "+yi
vnoremap <C-x> "+c
vnoremap <C-v> c<ESC>"+p
inoremap <C-v> <ESC>"+pa

" Allow saving of files as sudo when I forgot to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" ctrl-f to recursively search files
nnoremap <C-f> :Ack

" Ultimate Undo aka GUNDO
nnoremap <C-z> :GundoToggle<CR>
let g:gundo_preview_height = 22

" semicolon / colon
noremap ,c :cd ~/code<cr>
noremap ; :
noremap : ;

" Disable regular escape
inoremap <Esc> <nop>

" jj to escape
inoremap jj <Esc>

" kk to escape
inoremap kk <Esc>

" Super speed
" Simply hold shift in command mode
" And ctrl in insert mode
" noremap H 15h
" noremap J 15j
" noremap K 15k
" noremap L 15l
inoremap <C-h> <Esc>i
inoremap <C-j> <Esc>jli
inoremap <C-k> <Esc>kli
inoremap <C-l> <Esc>2li

" space goes to insert mode
nnoremap <Space> i

" - & _ move lines around
noremap - ddp
noremap _ ddkkp

" > and < indent and unindent
nnoremap > >>
nnoremap < <<

" <leader> ev to edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" <leader> sv to source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Search Hightlight Toggle
set nohlsearch
nnoremap <silent> <C-N> :se invhlsearch<CR>

" Search as you type
set incsearch

" Ctrl-T to toggle NerdTree
noremap <C-t> :NERDTreeTabsToggle<CR>
inoremap <C-t> <Esc>:NERDTreeTabsToggle<CR>

" Switch between windows, maximizing the current window
nnoremap <C-J> <C-W>j<C-W>_ 
nnoremap <C-K> <C-W>k<C-W>_

" Make the 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Allow windows to get fully squashed
set winminheight=0

" Line Numbers
set number

" Funny Business
set relativenumber

" Current marker postion
set ruler

" Ignore Files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Set Statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
