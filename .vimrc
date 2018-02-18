syntax enable

set backspace=indent,eol,start	"make backspace behave like every other editor
let mapleader=',' 		"The default leader is \, but comma is my choice
set number			"Let's activate line numbers
set expandtab ts=4 sw=4 ai

"------Visuals------"

colorscheme atom-dark
set termguicolors       "Use full 24-bit colors"
if $COLORTERM == 'gnome-terminal'
    set t_Co=256        "Use 256 colors. This is for Terminal Vim..
endif
set guifont=Fira_Code:h16
set guioptions-=l,L,r,R


"------Search------"
set hlsearch
set incsearch


"------Split Management------"
set splitbelow
set splitright
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

nmap <A-1> NERDTreeToggle<cr>

"------Mappings------"
nmap <Leader>ev :tabedit $MYVIMRC<cr>


"------Auto-commands------"
"Automatically source the Vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"------Plugins------"
"Install plugin managere vim-plug if not already installed"
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugins')
Plug 'junegunn/vim-plug'    "register vim-plug as plugin istelf for getting help
Plug 'tpope/vim-vinegar'    "file manager
Plug 'scrooloose/nerdtree'  "Project structure in split
Plug 'jelera/vim-javascript-syntax'
call plug#end()

