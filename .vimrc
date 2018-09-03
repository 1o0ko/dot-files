set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" Python plugins
Plugin 'w0rp/ale'

" Dev related
Plugin 'scrooloose/nerdcommenter'

"git interface
Plugin 'tpope/vim-fugitive'

" Colors
Plugin 'crusoexia/vim-monokai'
Plugin 'edkolev/tmuxline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" SPLITS
" default split areas
set splitbelow
set splitright 

" remap keys navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Setup vim to use colorcheme monokai
colorscheme monokai
" vim-monokai now only support 256 colours in terminal.
set t_Co=256  

" Setup syntax highlighting
syntax on

set autoindent
highlight Search ctermbg=yellow ctermfg=black

"UTF-8 support
set encoding=utf-8

"adding python PEP8 formats
au BufNewFile,BufRead *.py:
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

"adding 'full stack' rules
au BufNewFile,BufRead *.js, *.html, *.css:
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"NERDtree key maps
nmap <leader>t :NERDTreeToggle<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

"Ignore pyc files in NREDTree
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__$[[dir]]'] "ignore files in NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enable folding
set foldmethod=indent
set foldlevel=99

"enable system clipboard
set clipboard=unnamed

"enable autoreload
:set autoread

" Enable pasting
:set pastetoggle=<F10>

"Intelligent buffer closing
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>. 

" Syntax
let python_highlight_all=1


" ctrlp config
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*build/*
set wildignore+=*dist/*
set wildignore+=*__pycache__/*
set wildignore+=*.egg-info/*
set wildignore+=*/coverage/*

" -- Display
set title                 " Update the title of your window or your terminal
set number                " Display line numbers
set ruler                 " Display cursor position
set wrap                  " Wrap lines when they are too long

set scrolloff=3           " Display at least 3 lines around you cursor
                          " (for scrolling)

set guioptions=T          " Enable the toolbar

" -- Search
set ignorecase            " Ignore case when searching
set smartcase             " If there is an uppercase in your search term
                          " search case sensitive again
set incsearch             " Highlight search results when typing
set hlsearch              " Highlight search results

" -- Beep
set visualbell            " Prevent Vim from beeping
set noerrorbells          " Prevent Vim from beeping

" Backspace behaves as expected
set backspace=indent,eol,start

" Hide buffer (file) instead of abandoning when switching
" to another buffer
set hidden

" Plugin configuration
let g:cmdline_ipyhton = 1 

" Theme configuration
let g:airline_theme='dark'
