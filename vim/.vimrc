" --------------- "
" --- PLUGINS --- "
" --------------- "
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Let Vundle manage Vundle -- required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ap/vim-css-color'
Plugin 'chriskempson/base16-vim'
Plugin 'rakr/vim-one'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'ryanoasis/vim-devicons'

" Airline
set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Unimpaired
nnoremap <C-Up> [e
nnoremap <C-Down> ]e
" Bubble multiple lines
vnoremap <C-Up> [egv
vnoremap <C-Down> ]egv

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on

" -------------- "
" --- COLORS --- "
" -------------- "
syntax on
set t_Co=256
set termguicolors
colorscheme one
set background=dark
set cursorline

" Transparency
hi NonText ctermbg=NONE guibg=NONE
hi Normal ctermbg=none guibg=NONE

" --------------- "
" --- GENERAL --- "
" --------------- "
set number
set hls
set wrap
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set mouse=a
set clipboard=unnamed
set backspace=indent,eol,start

" -------------- "
" --- INDENT --- "
" -------------- "
set tabstop=8
set shiftwidth=8
set softtabstop=8
set noexpandtab

autocmd FileType html,djangohtml,css,javascript,python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent

" ------------------- "
" --- KEYMAPPINGS --- "
" ------------------- "
nnoremap <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
noremap <C-n> :NERDTreeToggle<CR>

" Indent/Dedent the current line or visual selection
nnoremap <tab> >>
nnoremap <S-tab> <<
vnoremap <tab> >gv
vnoremap <S-tab> <gv

" Change between Buffers
nnoremap <silent> <C-^> :bnext<CR>
nnoremap <silent> <C-6> :bprev<CR>


" Jump between buffers with Ngb
let i = 1
while i <= 99
  execute "nnoremap " . i . "gb :" . i . "b\<CR>"
  let i += 1
endwhile

" Tab through filenames and buffers in the command line,
" and use F5 to open console tab menu of buffers
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F5> :b <C-Z>
