""" Preamble


set encoding=utf-8
scriptencoding utf-8


""" Plugin installation


" Install plugins in ~/.config/nvim/plugged using junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-rooter' " automatic working directory changes
Plug 'tpope/vim-surround' " cs to change a surrounding. cst to change surroundings to something. ds to delete surroundings
Plug 'tpope/vim-commentary' " gcc to comment a line. gc to comment a selection/motion
Plug 'tpope/vim-repeat' " better repeat .
Plug 'tpope/vim-obsession' " automatic session (:mksession) management
Plug 'mhinz/vim-signify' " git diffs
Plug 'ntpeters/vim-better-whitespace' " whitespace highlighting
Plug 'glts/vim-radical' " number base conversions with gA, crd, crx, cro, crb

Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'w0rp/ale' " linting engine

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " fuzzy file finding

Plug 'plasticboy/vim-markdown' " markdown syntax

if has('nvim') " autocompletion engine
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Initialize plugin system
call plug#end()


""" Plugin configurations


"" deoplete

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
call deoplete#custom#option('num_processes', 1) " A workaround for a bug that prevents deoplete from working. https://github.com/Shougo/deoplete.nvim/issues/761

" Close the suggestions window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


"" deoplete-clang

" Adjust the file paths according to your clang setup
" let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm/lib/libclang.so'
" let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm/lib/clang'


"" ale

" Sets pylint3 as the pylint executable
let g:ale_python_pylint_executable = 'pylint3'


"" vim-airline

" Show buffers at top using airline
let g:airline#extensions#tabline#enabled = 1

" Tell airline not to bold some text elements due to a bug causing incorrect font colors in WSL
" call airline#parts#define_accent('mode', 'none')
" call airline#parts#define_accent('linenr', 'none')
" call airline#parts#define_accent('maxlinenr', 'none')


""" Colors, Themes, Background


set termguicolors

colorscheme sublimemonokai
let g:airline_theme='dark'

set background=dark


"" Powerline Symbols

" Set the two values below to 1 or 0 depending on if you would like to use powerline symbols
" I recommend the DejaVu Sans Mono powerline font
let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 1


""" Key Bindings


" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Map fzf file finder to space f f
noremap <leader>ff :<C-u>Files<CR>

" Let <Tab> do deoplete autocompletion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Relative number toggling
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :<C-u>call NumberToggle()<CR>

" Faster buffer/tab operations using the leader key
nnoremap <leader>l :<C-u>bn<CR>
nnoremap <leader>h :<C-u>bp<CR>
nnoremap <leader>d :<C-u>bd<CR>

" Save file using leader key (Spacemacs style)
nnoremap <leader>fs :w<CR>

" Open terminal (Spacemacs style)
nnoremap <leader>'' :terminal<CR>

" Search and Replace
nmap <Leader>s :<C-u>%s//g<Left><Left>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :<C-u>nohlsearch<CR><C-L>
endif


""" Vim Settings


" Line numbers
set number

" Highlight the current line the cursor is on
set cursorline

" Show matching parenthesis
set showmatch

" Highlight search results from '/'
set hlsearch

" Syntax highlighting
syntax enable

" Convert tabs to spaces when editing
set expandtab

" Copy indent of previous line
set autoindent

" Tab sizes
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " number of spaces to add or remove on indent and reindent

" Filetype detection for language-specific indents
filetype plugin indent on

" Visual autocomplete for command menu
set wildmenu

" Redraw the screen only when needed. Allows faster macros
set lazyredraw

" Auto read file when it is changed from the outside
set autoread

" Highlight 80 character line
set colorcolumn=80

" Highlight column of cursor
set cursorline

" Highlight line of cursor
set cursorcolumn

" Use system clipboard
set clipboard^=unnamed,unnamedplus

