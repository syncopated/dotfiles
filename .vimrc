
" Make Vim more useful
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow backspace in insert mode
"set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
" set binary
" set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Highlight current line
"set cursorline

" Make tabs as wide as two spaces
set tabstop=2 softtabstop=2 shiftwidth=2
set shiftround

" auto-indent
set autoindent smartindent

" Set listchars to see invisible indents, etc
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Highlight searches
set hlsearch

" Smart case for searches
set smartcase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Disable error bells
set noerrorbells

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
" set showmode

" Plugins
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'} )
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-git')
call minpac#add('tpope/vim-fugitive')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('mileszs/ack.vim')
call minpac#add('dracula/vim', {'name': 'dracula' })
packadd! dracula
call minpac#add('itchyny/lightline.vim')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-unimpaired')
"call minpac#add('pangloss/vim-javascript')
call minpac#add('othree/yajs.vim')
call minpac#add('dense-analysis/ale')
call minpac#add('scrooloose/nerdtree')
call minpac#add('junegunn/fzf.vim')
"call minpac#add('evanleck/vim-svelte')
call minpac#add('plasticboy/vim-markdown')
call minpac#add('jelera/vim-javascript-syntax')
call minpac#add('mhinz/vim-grepper')

let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']

nnoremap <Leader>* :Grepper -cword -noprompt<CR>


" configure ripgrep for use with Grepper
if executable("rg")
    set grepprg=rg\ -H\ --no-heading\ --vimgrep
    set grepformat=$f:$l:%c:%m
endif

function! SetupCommandAlias(input, output)
  exec 'cabbrev <expr> '.a:input
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
        \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias("grep", "GrepperRg")

" Use the Dracula colorscheme
colorscheme dracula
"set termguicolors
highlight Comment cterm=italic
set noshowmode

" lightline
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

" Mappings
let mapleader = ","
map <leader>n :NERDTreeToggle<CR>
set pastetoggle=<leader>t
" nmap ; :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>s :w<CR>
imap <leader>s <Esc>:w<CR>i
map <leader>a :ALEToggle<CR>
map <leader>r :redraw!<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" ALE related config
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'perl': ['perl', 'perlcritic'],
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
"let g:ale_fix_on_save_ignore = 1

set rtp+=/usr/local/opt/fzf
set path+=**

set background=dark

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
