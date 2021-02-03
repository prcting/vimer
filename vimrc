"  __  ____   __ __     _____ __  __ ____   ____
" |  \/  \ \ / / \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| |\ V /   \ \ / / | || |\/| | |_) | |
" | |  | | | |     \ V /  | || |  | |  _ <| |___
" |_|  |_| |_|      \_/  |___|_|  |_|_| \_\\____|

" Author: @Frank
" Last edit: 02.03 2021


" ===
" === System
" ===
" use mouse
set mouse=a

" colour compatibility
let &t_ut=''

" auto change work dir
set autochdir

" close vi
set nocompatible

" copy in system
set clipboard=unnamedplus

" set Backspace mode
set bs=eol,start,indent

" set vim theme
color slate

" coding colour
syntax on

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

" search result highlight
set hlsearch

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

" set tab width
set tabstop=2

" set shiftwidth
set shiftwidth=2

" expandtab width
set softtabstop=2

" no expandtab
set noexpandtab

" display status
set laststatus=2

" display sidebar
set signcolumn=yes

" display tab bar
set showtabline=2

" display command line
set showcmd

" display or enable mode
set noshowmode

" complete command
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

" ex in preview (neovim)
" set inccommand=split

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

" setting border
set colorcolumn=100
set updatetime=100
set virtualedit=block

" cursor change line
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" error format
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" status style
set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)

" last cursor place
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Basic Mappings
" ===
" set <LEADER> as <SPACE>
let mapleader=" "

" disable the default s key
noremap s <nop>

" save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

" open the vimrc file anytime
noremap <LEADER>rc :e ~/.vim/vimrc<CR>

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
nnoremap = n
nnoremap - N
noremap <LEADER><CR> :nohlsearch<CR>

" folding
noremap <silent> <LEADER>o za


" ===
" === Cursor Movement
" ===
" new cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
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


" ===
" === Insert mode cursor movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Command mode cursor movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>


" ===
" === Window management
" ===
" use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>

" resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" place the two screens up and down
noremap sh <C-w>t<C-w>K
" place the two screens side by side
noremap sv <C-w>t<C-w>H

" rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" create a new tab with tu
noremap tu :tabe<CR>
" move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>


" ===
" === Other useful stuff
" ===
" open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" move the next character to the end of the line with ctrl+9
inoremap <C-u> <ESC>lx$p

" opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" press ` to change case (instead of ~)
noremap ` ~

" redraw the screen
noremap <C-c> zz

" auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" call figlet
noremap tx :r !figlet

" find and replace
noremap \s :%s//g<left><left>

" set wrap
noremap <LEADER>sw :set wrap<CR>

" compile function
noremap <F5> :call CompileRunGcc()<CR>
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
