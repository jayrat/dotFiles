set nocompatible
syntax on
set nowrap
set encoding=UTF-8

"""""" Start Vundle Config

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmark/Vundle.vim'

Plugin 'NLKNguyen/papercolor-theme'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'dense-analysis/ale'
Plugin 'vim-syntastic/syntastic'
Plugin 'prettier/vim-prettier'

Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'

Plugin 'ryanoasis/vim-devicons'

Plugin 'mattn/emmet-vim'

Plugin 'jiangmiao/auto-pairs'

Plugin 'scrooloose/nerdtree'

call vundle#end()

"""""" End Vundel Config

""" Python Support
let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

set number
set relativenumber
set nohlsearch
set smarttab
set expandtab
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


