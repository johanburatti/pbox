call plug#begin('~/.config/nvim/plugged')
Plug 'jwhitley/vim-colors-solarized'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/ListToggle'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

filetype plugin indent on

" Disable mouse integration
set mouse=

if $THEME_NAME == 'contrast'
  set background=light
else
  let g:solarized_termtrans=0
  set background=dark
  autocmd ColorScheme * highlight LineNr ctermbg=8
  silent! colorscheme solarized
endif

" Statusline
set statusline=[%f]\ %r%=[%l,%c]\ %y\ [%{strlen(&fenc)?&fenc:'none'}]\ [%p%%]

" Config
set cursorline
set expandtab
set hidden
set hlsearch
set ignorecase
set nobackup
set noswapfile
set nowritebackup
set number
set shiftwidth=2
set shortmess=atI
set smartcase
set smartindent
set tabstop=2
set title
set wildignorecase
set wildmode=list:longest,full

" Keymaps
set timeoutlen=400
imap <silent> uu <Esc><Esc>:w<CR>
nnoremap <Space> <Nop>
let mapleader = " "
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>i gg=G<C-O><C-O>
nnoremap <Leader>n :nohlsearch<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>z :qa!<CR>
nnoremap <Leader>a :wqa<CR>

nnoremap <C-n> :GFiles<CR>

nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Plugin-based keymaps
let g:lt_quickfix_list_toggle_map = '<leader>f'

" Autocommands
autocmd FileType python set tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType conf set tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Tag manipulation
autocmd FileType html,xml,javascript.jsx inoremap <buffer> <C-t> <ESC>viw"tyea><ESC>bi<<ESC>lela</<ESC>"tpa><ESC>T>i
autocmd FileType html,xml,javascript.jsx inoremap <buffer> <C-n> <CR><CR><ESC>ka<Tab>

" Neomake
autocmd! BufWritePost,BufRead * Neomake
let g:neomake_verbose = 0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = []

" Markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
autocmd FileType markdown setlocal textwidth=74

" NERDTree
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '.git', '\.o$']

" fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Directory'],
  \ 'hl+':     ['fg', 'Directory'],
  \ 'info':    ['fg', 'Normal'],
  \ 'prompt':  ['fg', 'Normal'],
  \ 'pointer': ['fg', 'Normal'],
  \ 'marker':  ['fg', 'Normal'],
  \ 'spinner': ['fg', 'Normal'],
  \ 'header':  ['fg', 'Normal'] }
autocmd! User FzfStatusLine setlocal statusline=Finding..

" Local rc
if filereadable('~/.vimrc.local')
  source ~/.vimrc.local
endif
