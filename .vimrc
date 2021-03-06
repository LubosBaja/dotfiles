syntax enable

set backspace=indent,eol,start	"make backspace behave like every other editor
"let mapleader=',' 		"The default leader is \, but comma is my choice
set number			"Let's activate line numbers
set expandtab ts=4 sw=4 ai
set path+=**        "Let recursive path file search within vim
set wildmenu        "tab through the filename when doing search
set autoread 
set ttyfast
set diffopt+=vertical "Set vertical split as default for diff 

"------Visuals------" 
set termguicolors       "Use full 24-bit colors"
if $COLORTERM == 'gnome-terminal'
    set t_Co=256        "Use 256 colors. This is for Terminal Vim..
endif
set guifont=Ubuntu\ Mono\ 12
set guioptions-=l,L,r,R

set list " toggle invisible characters
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮    " Display extra whitespace characters 
set showbreak=↪

"------Search------"
set hlsearch
set incsearch

"------Persistent undo------"
let $UNDODIR=$HOME."/.vim/undo"
if !isdirectory($UNDODIR)
    call mkdir($UNDODIR,"p")
endif
set undodir=$UNDODIR
set undofile
 
"------Split Management------" 
set splitbelow
set splitright
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

nmap <Leader>k :NERDTreeToggle<cr>

"------Mappings------"
nmap <Leader>ev :tabedit $MYVIMRC<cr>   " buffer switching
nnoremap <Leader>b :ls<CR>:b<Space>
map <Leader>bd :b#<bar>bd#<CR>
nmap <C-B> :bn<cr>

map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3

" Insert timestamp at the cursor by pressing <F5> or by typing @t in this format: 20200527T113245
nnoremap <F5> "=strftime('%Y%m%dT%H%M%S')<CR>P
inoremap <F5> <C-R>=strftime('%Y%m%dT%H%M%S')<CR>
:iab <expr> @t strftime('%Y%m%dT%H%M%S')

"------Auto-commands------"
"Automatically source the Vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC | echom "Reloaded" $MYVIMRC
augroup END

"------Plugins------"
"Install plugin manager vim-plug if not already installed"
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugins')
Plug 'junegunn/vim-plug'    "register vim-plug as plugin istelf for getting help
"Plug 'tpope/vim-vinegar'    "file manager
"Plug 'scrooloose/nerdtree'  "Project structure in split
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/ctags.vim'              " ctags related stuff
Plug 'majutsushi/tagbar'


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'vim-airline/vim-airline'  "Status bar based on powerline, but no python needed
Plug 'vim-airline/vim-airline-themes'
Plug 'gosukiwi/vim-atom-dark' "Atom dark theme

" Git
Plug 'tpope/vim-fugitive'                 " Git stuff in Vim
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim',                   { 'on': 'GV' }
Plug 'jez/vim-github-hub'

Plug 'sheerun/vim-polyglot' " Vim polyglot 

" Python syntax checking
Plug 'vim-syntastic/syntastic'

" Javascript
"Plug 'jelera/vim-javascript-syntax'
"Plug 'w0rp/ale'                             "Asynchronous lint engine
"Plug 'vim-scripts/npm.vim'                  " Node npm command integration

" Json
"Plug 'XadillaX/json-formatter.vim'

" HTML {{{4
"Plug 'othree/html5.vim',                  { 'for': 'html' }
"Plug 'mustache/vim-mustache-handlebars'
"Plug 'mattn/emmet-vim'

 " CSS {{{4
"Plug 'hail2u/vim-css3-syntax',            { 'for': 'css' }

" Sass {{{4
"Plug 'cakebaker/scss-syntax.vim'

" Markdown {{{4
"Plug 'reedes/vim-pencil'                  " Markdown, Writing
"Plug 'godlygeek/tabular',                 { 'for': 'markdown' } " Needed for vim-markdown
"Plug 'plasticboy/vim-markdown',           { 'for': 'markdown' }

Plug 'vim-scripts/vim-auto-save'          "Auto saving files
Plug 'ryanoasis/vim-devicons'              " using dev icons from nerd fonts

Plug 'jceb/vim-orgmode' 
Plug 'tpope/vim-speeddating'
Plug 'mattn/calendar-vim'

call plug#end()

"------Plugin configuration------"
"setup auto completion
let g:deoplete#enable_at_startup = 1

"ctrlp show hidden files in search"
let g:ctrp_show_hidden = 1

"ALE fixer"
let g:ale_fixers = {
    \ 'javascript': ['eslint']
    \}

let g:javascript_plugin_flow = 1

"Airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

let g:airline#extensions#syntastic#enabled = 1

"Syntastic setup
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"Auto save
let g:auto_save = 1                                 "Enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1                   " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0                  " do not save while in insert mode
"let g:auto_save_silent = 1                         " do not display the auto-save notification
"let g:auto_save_postsave_hook = 'TagsGenerate'     " this will run :TagsGenerate after each save

"vim markdown config
let g:vim_markdown_folding_disabled = 1             " disable folding

colorscheme atom-dark

