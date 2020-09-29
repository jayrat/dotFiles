"    ___                                  __      __          _        __  
"   / __|    ___      _ _   __ _    __ __ \ \    / / ___     | |      / _| 
"  | (__    / _ \    | '_| / _` |   \ \ /  \ \/\/ / / _ \    | |     |  _| 
"   \___|   \___/   _|_|_  \__,_|   /_\_\   \_/\_/  \___/   _|_|_   _|_|_  
" _|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| 
" "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' 
"
" Filename: init.vim
" Author: Jeremy Hawkins
" 2020

set nocompatible
syntax on
set nowrap
set encoding=UTF-8

"""""" Start Vundle Config

filetype off

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'

Plug 'NLKNguyen/papercolor-theme'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dense-analysis/ale'
Plug 'vim-syntastic/syntastic'
Plug 'prettier/vim-prettier'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
"""" Multi-Language Syntax Plug
Plug 'sheerun/vim-polyglot'

Plug 'maxmellon/vim-jsx-pretty'

Plug 'ryanoasis/vim-devicons'

Plug 'mattn/emmet-vim'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdtree'

call plug#end()


"""""" End Vundel Config

filetype plugin on
syntax on

""" Python Support
if (has('win32'))
  let g:python_host_prog = 'c:\Python27\python'
  let g:python3_host_prog = 'c:\Python38\python'
else
  let g:python_host_prog = "/usr/bin/python2"
  let g:python3_host_prog = "/usr/bin/python3"
endif

set number
set relativenumber
set nohlsearch
set smarttab
set expandtab
set shiftwidth=2
set laststatus=2

let g:elite_mode=1
set t_Co=256
set colorcolumn=101
set guifont=Hack
colorscheme PaperColor

""" Set jk and kj to Escape in Insert Mode
imap jk <Esc>
imap kj <Esc>
" Try ii to exit Insert Mode
imap ii <Esc>

map <C-n> :NERDTreeToggle<CR>

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline_theme='papercolor'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

let g:ale_fixers = { 'javascript': ['eslint'] }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1


"""" Mapping for Split Navigation
nnoremap <C-k>  <C-w><C-k>
nnoremap <C-j>  <C-w><C-j>
nnoremap <C-l>  <C-w><C-l>
nnoremap <C-h>  <C-w><C-h>

""" Elite Mode
if get(g:, 'elite_mode')
  nnoremap <Up>		:resize +2<CR>
  nnoremap <Down>		:resize -2<CR>
  nnoremap <Left>		:vertical resize +2<CR>
  nnoremap <Right>	:vertical resize -2<CR>
endif


