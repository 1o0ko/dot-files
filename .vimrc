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
if has('nvim')
  Plugin 'Shougo/deoplete.nvim'
else
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'zchee/deoplete-jedi'
"
" Python plugins
Plugin 'w0rp/ale'
Plugin 'vim-scripts/indentpython.vim'

" Dev related
Plugin 'scrooloose/nerdcommenter'
Plugin 'jalvesaq/vimcmdline'

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

" Ignore pyc files in NREDTree
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__$[[dir]]'] "ignore files in NERDTree

" Refresh pane

nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
" Close NERDTree if there are no buffers
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" See docstring for folded code
let g:SimpylFold_docstring_preview=1

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
set ruler                 " Display cursor position
set wrap                  " Wrap lines when they are too long

set scrolloff=3           " Display at least 3 lines around you cursor
                          " (for scrolling)

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

" Theme configuration
let g:airline_theme='dark'
let g:airline#extensions#ale#enabled = 1

" Plugin configuration
let cmdline_app           = {}
let cmdline_app["python"] = "python3"
let cmdline_outhl         = 1
let cmdline_follow_colorscheme = 1

" Autocomple 
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#sources#ternjs#docs = 1
"

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

set mouse=a

" whitespace toggling
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬\,space:·

" turn off highlighting
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" line formating
set formatoptions=qrn1
set colorcolumn=85

" linr numering
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
