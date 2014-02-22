" Load Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Colorscheme
colorscheme wombat256mod

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
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" semicolon / colon
noremap ,c :cd ~/code<cr>
noremap ; :
noremap : ;

" jj to escape
inoremap jj <Esc>

" kk to escape
inoremap kk <Esc>

" Super speed
" Simply hold shift in command mode
" And ctrl in insert mode
noremap H 50h
noremap J 50j
noremap K 50k
noremap L 50l
inoremap <C-h> <Esc>50hi
inoremap <C-j> <Esc>50ji
inoremap <C-k> <Esc>50ki
inoremap <C-l> <Esc>50li

" space goes to insert mode
:nmap <Space> i

" ctrl-c actually copies text
map <C-c> "+y<CR>

" - & _ move lines around
noremap - ddp
noremap _ ddkkp

" Search Hightlight Toggle
set nohlsearch
nnoremap <silent> <C-N> :se invhlsearch<CR>

" Ctrl-T to toggle NerdTree
noremap <C-t> :NERDTreeTabsToggle<CR>
inoremap <C-t> <Esc>:NERDTreeTabsToggle<CR>

" Switch between windows, maximizing the current window
nnoremap <C-J> <C-W>j<C-W>_ 
nnoremap <C-K> <C-W>k<C-W>_

" Allow windows to get fully squashed
set winminheight=0

" Line Numbers
set number

" Current marker postion
set ruler

" Ignore Files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Set Statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

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
