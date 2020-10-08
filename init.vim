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

"" Python PEP8 Syntax
Plug 'nvie/vim-flake8'

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
  let g:python3_host_prog = 'c:\Python39\python'
  """ Set NetRW SCP Command on Windows
  let g:netrw_scp_cmd = "C:\\windows\\System32\\OpenSSH\\scp.exe"
  let g:netrw_list_cmd = "C:\\windows\\System32\\OpenSSH\\ssh.exe USEPORT HOSTNAME ls -Fa"
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
let g:syntastic_python_checker = ['pyflakes']
let g:syntastic_quiet_messages = { "type": "style" }


let g:ale_fixers = { 'javascript': ['eslint'] }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1

""" Mapping for Split Navigation
nnoremap <C-k>  <C-w><C-k>
nnoremap <C-j>  <C-w><C-j>
nnoremap <C-l>  <C-w><C-l>
nnoremap <C-h>  <C-w><C-h>

""" Elite Mode
if get(g:, 'elite_mode')
  nnoremap <Up>         :resize +2<CR>
  nnoremap <Down>       :resize -2<CR>
  nnoremap <Left>       :vertical resize +2<CR>
  nnoremap <Right>      :vertical resize -2<CR>
endif

""" Python Syntax Setup
au BufNewFile,Bufread *.py
  \ set tabstop=4
  \ set softtabstop=4
  \ set shiftwidth=4
  \ set expandtab
  \ set wildignore=*.pyc


""" COC Setup

" TextEdit might fail if hidden is not set.
set hidden
"
" " Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
"
"" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300
"
" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c"

" Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" :  "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
"
"" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
" Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

"" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language
" server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
"
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins
" that
" provide custom statusline: lightline.vim, vim-airline.
 set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}"

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

