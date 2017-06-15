" --- PLUGINS --- "
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-surround'
"Plugin 'ervandew/supertab'
"Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ap/vim-css-color'

" Colourscheme 
Plugin 'chriskempson/base16-vim'

" --- NERDTree settings --- "
map <C-n> :NERDTreeToggle<CR>

" --- Airline --- "
set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline_theme='base16_flat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2

" --- Ultisnips --- "
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" --- END PLUGINS --- "

set t_Co=256
let base26colorspace=256
set background=dark
colorscheme base16-flat

syntax on

set number
set hls
set nowrap

" Indent settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		   " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		   " Hide buffers when they are abandoned
set mouse=a		   " Enable mouse usage (all modes)

" Key Bindings
nnoremap <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
