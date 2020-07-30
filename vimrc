" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @Jake

" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
" color compatibility
let &t_ut=''

" auto change work dir
set autochdir

" close vi
set nocompatible

" copy in system
set clipboard=unnamedplus

" set Backspace mode
set bs=eol,start,indent

" display line number
set number

" display relative line number
set relativenumber

" the current line displays line
set cursorline

" auto indent
set autoindent

" timeout
set ttimeoutlen=0
set notimeout

" searching
set ignorecase

" smart search
set smartcase

" expert search
set incsearch

" matching parentheses
set showmatch

" should make scrolling faster
set ttyfast

" delay to draw（improve performance）
set lazyredraw

" display hidden character
set list

" display space
set listchars=tab:\|\ ,trail:▫

" set shiftwidth
set shiftwidth=2

" set tab width
set tabstop=2

" noexpandtab
set noexpandtab

" expandtab width
set softtabstop=2

" display status
set laststatus=2

" display sidebar
set signcolumn=yes

" display tab bar
set showtabline=2

" display command line
set showcmd

" display or enable mode
" set showmode
set noshowmode

" completion
set wildmenu

" row 5 content
set scrolloff=5

" the new windows open in right
set splitright

" the new windows open in below
set splitbelow

" display visual bell
set visualbell

" view options
set viewoptions=cursor,folds,slash,unix

" word wrap
set wrap

" space display
set tw=0
set indentexpr=

" enable code
set foldmethod=indent
set foldlevel=99
set foldenable

" text formatting
set formatoptions-=tc

" ex in preview
set inccommand=split

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" smart auto complete me
set completeopt=longest,noinsert,menuone,noselect,preview

" file coding
if has('multi_byte')
  " in vim
  set encoding=utf-8

  " file
  set fileencoding=utf-8

  " auto
  set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Basic Mappings
" ===
" set <LEADER> as <SPACE>
let mapleader=" "

" disable the default s key
noremap s <nop>

" undo operations
noremap l u

" insert Key
noremap k i
noremap K I

" make Y to copy till the end of the line
nnoremap Y y$

" copy to system clipboard
vnoremap Y "+y

" indentation
nnoremap < <<
nnoremap > >>

" search
noremap <LEADER><CR> :nohlsearch<CR>
nnoremap = n
nnoremap - N

" folding
noremap <silent> <LEADER>o za

" cursor Movement
noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l
noremap <silent> gu gk
noremap <silent> ge gj

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> E 5j

" N key: go to the start of the line
noremap <silent> N 0
" I key: go to the end of the line
noremap <silent> I $

" faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'
noremap h e

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

" insert mode cursor movement
inoremap <C-a> <ESC>A

" command mode cursor movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device
		CocCommand flutter.dev.openDevLog
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc
