""" Plugin installation


" Install plugins in ~/.config/nvim/plugged
call plug#begin('~/.config/nvim/plugged')

" vim-surround / surround.vim
Plug 'tpope/vim-surround'

" molokai
Plug 'tomasr/molokai'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim-signify
Plug 'mhinz/vim-signify'

" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" ale
Plug 'w0rp/ale'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" vim-rooter
Plug 'airblade/vim-rooter'

" Initialize plugin system
call plug#end()


""" Plugin configurations


"" deoplete

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" Close the suggestions window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


"" ale

" Sets pylint3 as the pylint executable
let g:ale_python_pylint_executable = 'pylint3'


"" vim-airline

" Show buffers at top using airline
let g:airline#extensions#tabline#enabled = 1

" Tell airline not to bold some text elements due to a bug causing incorrect font colors in WSL
call airline#parts#define_accent('mode', 'none')
call airline#parts#define_accent('linenr', 'none')
call airline#parts#define_accent('maxlinenr', 'none')

""" Colors, Themes, Background


set termguicolors

colorscheme molokai
let g:airline_theme='dark'

set background=dark


"" Powerline Symbols

" Set the two values below to 1 or 0 depending on if you would like to use powerline symbols
" I recommend DejaVuSansMono
let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 1


""" Key Bindings


" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Map fzf file finder to space f f
noremap <leader>ff :<C-u>Files<CR>

" Let <Tab> do deoplete autocompletion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Relative numbering
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

" Use system clipboard
set clipboard^=unnamed,unnamedplus
