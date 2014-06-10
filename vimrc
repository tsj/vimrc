"
" tsj.july@gmail.com
"

try
	colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185/
	" skip
endtry

set visualbell

set nocompatible
set backspace=indent,eol,start

set number		" line number
"set numberwidth=6	" line number width, not works
set nowrap
set ruler		" show the cursor position all the time

" colorcolumn
set colorcolumn=80

" status bar
set ls=2		" last status 2 row

set statusline=

set statusline+=%m "modify

set statusline+=%r "readonly

" style : [unix/utf-8(BOM)]
set statusline+=[
set statusline+=%{&ff} "eol
set statusline+=/ "delimiter
set statusline+=%{''.(&fenc!=''?&fenc:&enc).''} "encoding
set statusline+=%{(&bomb?\"(BOM)\":\"\")} "BOM
set statusline+=]

set statusline+=\ "separator

" style : [ruby]
set statusline+=%y "syntax

" style : (master)
set statusline+=%{GitBranch()?\"\":\"\ \(\".GitBranch().\"\)\"}

set statusline+=%=

set statusline+=%l-%L:
set statusline+=%2c

set statusline+=\ "separator

set statusline+=(%2P)

set statusline+=\ "separator
set statusline+=[%f]

" recommand 
set wildmenu		" in Tab auto complete, show list
set showcmd		" display incomplete commands

" search
set incsearch		" do incremental searching
set hlsearch		" highlight search
set ignorecase		" ignore case
set smartcase		" if a pattern contains an uppercase letter,
			" it is casesensivit

" indent
set autoindent		" always set autoindenting on
set cindent
set smartindent

" tab
" can use tab and shift + tab in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" backup
set nobackup
" or backup
" set backupdir=~/backup
" set dir=~/backup/swap
set history=1024

syntax enable
filetype on
filetype plugin indent on

" encoding
set fencs=ubs-bom,utf-8,korea
"set fileencoding=utf-8

" eol
set ffs=unix,dos,mac
"set ff=unix

" GUI
if has("gui_running")
	set guioptions+=b
	set guifont=DejaVu_Sans_Mono:h14
	set clipboard=unnamed "connect clipboard 
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
endif

" Map
map <F3> v]}zf
map <F4> zo

"F5 : NERDTree
map <F5> :NERDTreeToggle <CR>

"F9 : compile
au FileType c map <F9> :!gcc -W -Wall % -o %< -g <CR>
au FileType cpp map <F9> :!g++ -W -Wall % -o %< -g <CR>

" F11 execute
if has("gui_running")
	au FileType dosbatch map <F11> :!% <CR>
	au FileType c,cpp map <F11> :!%< <CR>
elseif has("unix")
	au FileType sh map <F11> :!./% <CR>
	au FileType c,cpp map <F11> :!./%< <CR>
endif
au FileType ruby map <F11> :!ruby % <CR>
au FileType python map <F11> :!python % <CR>
au FileType python setlocal ts=4 sts=4 sw=4

" F12 debug
au FileType c,cpp map <F12> :!gdb -q %< <CR>

" hangle
ca ㅈ w
ca ㅈㅂ wq
ca ㅂ q

" SwapExists 
"au SwapExists * let v:swapchoice = 'o'

