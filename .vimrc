"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" This vimrc is based on the vimrc by Easwy Yang:
""       http://easwy.com/
"" You can find the latest version on:
""       http://github.com/fd5788/dotfiles/.vimrc/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Linux Distribution
"function! LinuxDis()
"    let linuxDistribution = system('cat /etc/issue | grep Debian')
"    if linuxDistribution =~ "Debian"
"        return "Debian"
"    else
"        return "Archlinux"
"    endif
"endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vunble setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/vundle/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
let g:vundle_default_git_proto = 'git'

" let Vundle manage Vundle, required
Plugin 'szw/vim-ctrlspace'
Plugin 'gmarik/Vundle.vim',{'name': 'vundle'}
Plugin 'kien/ctrlp.vim',{'name': 'ctrlp'}
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'mileszs/ack.vim',{'name': 'ack'}
Plugin 'fholgado/minibufexpl.vim',{'name': 'minibufexpl'}
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
""python completer
"Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi'
""golang compelter
Plugin 'nsf/gocode'
Plugin 'fatih/vim-go'
"Plugin 'Blackrush/vim-gocode'
""csharp completer
"Plugin 'OmniSharp/omnisharp-server'
"Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
""compelter engine
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/neocomplete.vim',{'name': 'neocomplete'}
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
"Plugin 'bling/vim-bufferline'
"Plugin 'edkolev/tmuxline.vim',{'name': 'tmuxline'}
""undo timemachine
"Plugin 'sjl/gundo.vim',{'name': 'gundo'}
Plugin 'mbbill/undotree'
Plugin 'mbbill/fencview'
"Plugin 'wesleyche/SrcExpl'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
"Plugin 'marchtea/mdtogh'
""statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'powerline/powerline'
Plugin 'powerline/fonts'
"Plugin 'jlanzarotta/bufexplorer'
"Plugin 'lilydjwg/fcitx.vim',{'name': 'fcitx'}
Plugin 'rizzatti/dash.vim',{'name': 'dash'}

""colorscheme
Plugin 'tomasr/molokai'
"Plugin 'flazz/vim-colorschemes'
""Plugin 'altercation/vim-colors-solarized'

""vim-scripts repo
"Plugin 'Align'
"Plugin 'AutoAlign'
"Plugin 'vim-scripts/taglist.vim', {'name': 'taglist'}
Plugin 'AutoClose'
Plugin 'vim-scripts/TaskList.vim', {'name': 'TaskList'}
"Plugin 'Sessionman'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype pl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
"set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Platform
function! Platform()
  if has("win32")
    return "windows"
  else
    return "linux"
  endif
endfunction

"Sets how many lines of history VIM har to remember
set history=600

" Always use English messages & menu
"language zh_CN.UTF-8
"language messages en_US.ISO_8859-1
"set langmenu=en_US.ISO_8859-1

" Chinese
" multi-encoding setting
if has("multi_byte")
  "set bomb
  set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,sjis,euc-kr,ucs-2le,latin1
  " CJK environment detection and corresponding setting
  if v:lang =~ "^zh_CN"
    " Use cp936 to support GBK, euc-cn == gb2312
    set encoding=chinese
    set termencoding=chinese
    set fileencoding=chinese
  elseif v:lang =~ "^zh_TW"
    " cp950, big5 or euc-tw
    " Are they equal to each other?
    set encoding=taiwan
    set termencoding=taiwan
    set fileencoding=taiwan
  "elseif v:lang =~ "^ko"
  "  " Copied from someone's dotfile, untested
  "  set encoding=euc-kr
  "  set termencoding=euc-kr
  "  set fileencoding=euc-kr
  "elseif v:lang =~ "^ja_JP"
  "  " Copied from someone's dotfile, untested
  "  set encoding=euc-jp
  "  set termencoding=euc-jp
  "  set fileencoding=euc-jp
  endif
  " Detect UTF-8 locale, and replace CJK setting if needed
  if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set encoding=utf-8
    set termencoding=utf-8
    set fileencodings=utf-8,chinese,gb18030,cp936,big5
    set fileencodings=utf-8
  endif
endif
"if Platform() == "windows"
   "set encoding=utf-8
   "set langmenu=zh_CN.UTF-8
   "language message zh_CN.UTF-8
   "set fileencodings=ucs-bom,utf-8,gb18030,cp936,big5,euc-jp,euc-kr,latin1
"endif

"Enable filetype plugin
filetype plugin indent on

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=a
set mousemodel=popup

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast saving
nmap <silent> <leader>ww :w<CR>
nmap <silent> <leader>wf :w!<CR>

"Fast quiting
nmap <silent> <leader>qw :wq<CR>
nmap <silent> <leader>qf :q!<CR>
nmap <silent> <leader>qq :q<CR>
nmap <silent> <leader>qa :qa<CR>

"Fast remove highlight search
nmap <silent> <leader><CR> :noh<CR>

"Fast redraw
nmap <silent> <leader>rr :redraw!<CR>

" For Thinkpad
imap <F1> <ESC>
nmap <F1> <ESC>
cmap <F1> <ESC>
vmap <F1> <ESC>

" Switch to buffer according to file name
function! SwitchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
        exec bufwinnr . "wincmd w"
        return
    else
        " find in each tab
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal " . tab . "gt"
                exec bufwinnr . "wincmd w"
                return
            endif
            tabnext
            let tab = tab + 1
        endwhile
        " not exist, new tab
        exec "tabnew " . a:filename
    endif
endfunction

"Fast edit vimrc
if Platform() == 'linux'
    "Fast reloading of the .vimrc
    map <silent> <leader>ss :source ~/.vimrc<CR>
    "Fast editing of .vimrc
    map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<CR>
    "When .vimrc is edited, reload it
    "autocmd! bufwritepost .vimrc source ~/.vimrc
elseif Platform() == 'windows'
    " Set helplang
    set helplang=cn
    "Fast reloading of the _vimrc
    map <silent> <leader>ss :source ~/_vimrc<CR>
    "Fast editing of _vimrc
    map <silent> <leader>ee :call SwitchToBuf("~/_vimrc")<CR>
    "When _vimrc is edited, reload it
    autocmd! bufwritepost _vimrc source ~/_vimrc
endif

" For windows version
"if Platform() == 'windows'
"    source $VIMRUNTIME/mswin.vim
"    behave mswin
"
"    set diffexpr=MyDiff()
"    function! MyDiff()
"        let opt = '-a --binary '
"        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"        let arg1 = v:fname_in
"        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"        let arg2 = v:fname_new
"        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"        let arg3 = v:fname_out
"        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"        let eq = ''
"        if $VIMRUNTIME =~ ' '
"            if &sh =~ '\<cmd'
"                let cmd = '""' . $VIMRUNTIME . '\diff"'
"                let eq = '"'
"            else
"                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"            endif
"        else
"            let cmd = $VIMRUNTIME . '\diff'
"        endif
"        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"    endfunction
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set font
if Platform() == "linux"
  if has("gui_gtk2")
    set gfn=Courier\ New\ 11,Courier\ 11,Luxi\ Mono\ 11,
          \DejaVu\ Sans\ Mono\ 11,Bitstream\ Vera\ Sans\ Mono\ 11,
          \SimSun\ 11,WenQuanYi\ Micro\ Hei\ Mono\ 11
  elseif has("x11")
    set gfn=*-*-medium-r-normal--10-*-*-*-*-m-*-*
  endif
endif

" Avoid clearing hilight definition in plugins
if !exists("g:vimrc_loaded")
    "Enable syntax hl
    syntax enable

    " color scheme
    if has("gui_running")
        set guioptions-=T
        set guioptions-=m
        set guioptions-=L
        set guioptions-=r

        map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
        \set guioptions-=L <Bar>
        \set guioptions-=r <bar>
        \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=L <Bar>
        \set guioptions+=r <Bar>
        \endif<CR>

        colorscheme molokai
        "hi normal guibg=#294d4a
        set cursorline
        "set cursorcolumn
    else
        "colorscheme default
        colorscheme molokai
    endif " has
endif " exists(...)

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>cc :set syntax=c<CR>
map <leader>xhtml :set syntax=xhtml<CR>
map <leader>py :set syntax=python<CR>
map <leader>js :set ft=javascript<CR>
map <leader>$ :syntax sync fromstart<CR>

autocmd BufEnter * :syntax sync fromstart

" CTRL-C
vnoremap <C-C> "+y

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

"Fast copy and paste
nmap <leader>p "+p
vnoremap <leader>y "+y

" CTRL-V
imap <C-V>		"+gP
cmap <C-V>		<C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

"Highlight current
if has("gui_running")
  set cursorline
  "set cursorcolumn
  hi cursorline guibg=#333333
  hi CursorColumn guibg=#333333
endif

"" reference k-vim
" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

""swith buffer (using ctrlspace plugin recommended)
"nnoremap [b :bprevious<cr>
"nnoremap ]b :bnext<cr>

" swith buffer by direcition keys
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" tab operation
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim

"swithc tab
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

"switch tab in normal
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

"newtab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
set ffs=unix,dos

nmap <leader>fd :se ff=dos<CR>
nmap <leader>fu :se ff=unix<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"" Maximum window when GUI running
"if has("gui_running")
"  set lines=9999
"  set columns=9999
"endif

"Turn on WiLd menu
set wildmenu
"set wildchar=<Tab> wildmenu wildmode=full

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=2

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
"set hid

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
"set whichwrap+=<,>,h,l
set whichwrap+=<,>

"Ignore case when searching
"set ignorecase

"Include search
set incsearch

"Highlight search things
set hlsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novb t_vb=

"show matching bracets
"set showmatch

"How many tenths of a second to blink
"set mat=2

set showcmd

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
  "Always display the statusline in all window
  set laststatus=2
  "Hide the defualt mode text
  set noshowmode

"  """"""""""""""""""""""""""""""
"  " powerline
"  """"""""""""""""""""""""""""""
"  set t_Co=256
"  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"  let g:Powerline_symbols = 'fancy'
"
"  "Escape insert mode immediately if Powerline is used in vim
"  if ! has('gui_running')
"      set ttimeoutlen=10
"      augroup FastEscape
"         autocmd!
"         au InsertEnter * set timeoutlen=0
"         au InsertLeave * set timeoutlen=1000
"      augroup END
"   endif

  "function! CurDir()
  "   let curdir = substitute(getcwd(), '/home/fd5788/', "~/", "g")
  "   return curdir
  "endfunction

"  Format the statusline
"  set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
"  set statusline+=%{EchoFuncGetStatusLine()}
"
"  set statusline=
"  set statusline +=%1*\ %n\ %*            "buffer number
"  set statusline +=%2*\ %<%F%*            "full path
"  set statusline +=%3*%m%*                "modified flag
"  set statusline +=%4*%{&ff}%*            "file format
"  set statusline +=%5*%y%*                "file type
"  set statusline +=%6*=(%03p%%)            "Rownumber/total (%)
"  set statusline +=%7*\ col:%03c\          "Colnr
"  set statusline +=%8*0x%04B\ %*          "character under cursor

"  hi User1 guifg=#eea040 guibg=#222222
"  hi User2 guifg=#dd3333 guibg=#222222
"  hi User3 guifg=#ff66ff guibg=#222222
"  hi User4 guifg=#a0ee40 guibg=#222222
"  hi User5 guifg=#eeee40 guibg=#222222

  """""""""""""""""""""""""""""
  " vim-airline setting
  """"""""""""""""""""""""""""""
  let g:airline_theme = 'powerlineish'
  let g:airline_powerline_fonts = 1

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1

  nnoremap <C-N> :bn<CR>
  nnoremap <C-P> :bp<CR>

"  let g:airline#extensions#tabline#formatter = 'unique_tail'
"  let g:airline#extensions#tabline#left_sep = ' '
"  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#show_buffers = 1
  "let g:airline#extensions#bufferline#enabled = 1
  set t_Co=256
  set lazyredraw
  set notimeout ttimeout ttimeoutlen=50

""""""""""""""""""""""""""""""
" Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
"map <space> /
"map <c-space> ?

" redefine C-J(which is denfined in vim-latex) to C-G
vmap <C-G> <Plug>IMAP_JumpForward
nmap <C-G> <Plug>IMAP_JumpForward

"Smart way to move btw. windows
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

"Actually, the tab does not switch buffers, but my arrows
"Bclose function can be found in "Buffer related" section
map <leader>bd :Bclose<CR>
"map <down> <leader>bd

"Use the arrows to something usefull
map <C-Right> :bn<CR>
map <C-Left> :bp<CR>

"Tab configuration
set hidden
map <leader>tn :tabnew
map <leader>te :tabedit
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
try
  set switchbuf=useopen
  set stal=1
catch
endtry

"Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i

"Switch to current dir
map <silent> <leader>cd :cd %:p:h<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vnoremap @1 <esc>`>a)<esc>`<i(<esc>
"")
"vnoremap @2 <esc>`>a]<esc>`<i[<esc>
"vnoremap @3 <esc>`>a}<esc>`<i{<esc>
"vnoremap @$ <esc>`>a"<esc>`<i"<esc>
"vnoremap @q <esc>`>a'<esc>`<i'<esc>
"vnoremap @w <esc>`>a"<esc>`<i"<esc>

"Map auto complete of (, ", ', [
"inoremap @1 ()<esc>:let leavechar=")"<CR>i
"inoremap @2 []<esc>:let leavechar="]"<CR>i
"inoremap @3 {}<esc>:let leavechar="}"<CR>i
"inoremap @4 {<esc>o}<esc>:let leavechar="}"<CR>O
"inoremap @q ''<esc>:let leavechar="'"<CR>i
"inoremap @w ""<esc>:let leavechar='"'<CR>i
"au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<CR>i
"au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<CR>i

"imap <m-l> <esc>:exec "normal f" . leavechar<CR>a
"imap <d-l> <esc>:exec "normal f" . leavechar<CR>a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My information
"iab xdates <c-r>=strftime("%b %d, %Y")<CR>
"iab xdate <c-r>=strftime("%a %b %d %H:%M:%S %Z %Y")<CR>
"iab xname Easwy Yang


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  nohl
  exe "normal `z"
endfunc

" do not automaticlly remove trailing whitespace
"autocmd BufWrite *.[ch] :call DeleteTrailingWS()
"autocmd BufWrite *.cc :call DeleteTrailingWS()
"autocmd BufWrite *.txt :call DeleteTrailingWS()
nmap <silent> <leader>ws :call DeleteTrailingWS()<CR>:w<CR>
"nmap <silent> <leader>ws! :call DeleteTrailingWS()<CR>:w!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Open a dummy buffer for paste
map <leader>es :tabnew<CR>:setl buftype=nofile<CR>
if Platform() == "linux"
  map <leader>ec :tabnew ~/tmp/scratch.txt<CR>
else
  map <leader>ec :tabnew $TEMP/scratch.txt<CR>
endif

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set sessionoptions-=curdir
set sessionoptions+=sesdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
"set nobackup
"set nowb
"set noswapfile

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
"else
"  set backup            " keep a backup file
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set fen
set fdl=0
set foldmethod=indent
set foldlevelstart=99
"set nofoldenable
nmap <silent> <leader>zo zO
vmap <silent> <leader>zo zO
"enable folding with space
nnoremap <space> za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

map <leader>t2 :set shiftwidth=2<CR>
map <leader>t4 :set shiftwidth=4<CR>
au FileType html,python,vim,javascript,xml setl shiftwidth=4
au FileType html,python,vim,javascript setl tabstop=4
au FileType java,c,cpp setl shiftwidth=4
au FileType java setl tabstop=4
au FileType txt setl lbr
au FileType txt setl tw=79

set smarttab
"set lbr
set tw=79

""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai
"Smart indet
set si
"C-style indeting
set cindent
"Wrap lines
set wrap

"PEP8 python indent style
au BufNewFile, BufRead *,py
      \ tabstop=4
      \ softtabstop=4
      \ shiftwidth=4
      \ textwidth=4
      \ set expandtab
      \ set autoindent
      \ set fileformat=unix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype configuration by dictionary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
"au FileType css setlocal dict+=~/.vim/dict/css.dict
"au FileType c setlocal dict+=~/.vim/dict/c.dict
"au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
"au FileType scale setlocal dict+=~/.vim/dict/scale.dict
"au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
"au FileType html setlocal dict+=~/.vim/dict/javascript.dict
"au FileType html setlocal dict+=~/.vim/dict/css.dict

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file header configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
"
"func SetTitle()
"    if &filetype == 'sh'
"        call setline(1,"\#!/bin/bash")
"        call append(line("."), "")
"    elseif &filetype == 'python'
"        call setline(1,"#!/usr/bin/env python")
"        call append(line("."),"# coding=utf-8")
"        call append(line(".")+1, "")
"    elseif &filetype == 'markdown'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
"    else
"        call setline(1, "/*************************************************************************")
"        call append(line("."), " > File Name: ".expand("%"))
"        call append(line(".")+1, " > Author: fd5788")
"        call append(line(".")+2, " > Mail: dengzxf@gmail.com")
"        call append(line(".")+3, " > Created Time: ".strftime("%c"))
"        call append(line(".")+4, " ************************************************************************/")
"        call append(line(".")+5, "")
"    endif
"    if &filetype == 'cpp'
"        call append(line(".")+6, "#include<iostream>")
"        call append(line(".")+7, "using namespace std;")
"        call append(line(".")+8, "")
"    endif
"    if &filetype == 'c'
"        call append(line(".")+6, "#include<stdio.h>")
"        call append(line(".")+7, "")
"      endif
"    if &filetype == 'java'
"        call append(line(".")+6,"public class ".strpart(expand("%d"),0,strlen(expand("%"))-5))
"        call append(line(".")+7,"")
"    endif
"endfunc
"autocmd BufNewFile * normal G

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" compile configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-F9> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        " exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
  endif
endfunc

"C/C++ debuge
map <C-F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

"code style optimization
map <F6> :call FormartSrc()<CR><CR>
func! FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Completion
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " complete options
   set completeopt=menu,longest,preview
   set complete-=u
   set complete-=i

   " mapping
   inoremap <expr> <CR>       pumvisible() ? "\<C-Y>" : "\<C-g>u\<CR>"
   inoremap <expr> <C-J>      pumvisible() ? "\<PageDown>\<C-N>\<C-P>" : "\<C-X><C-O>"
   inoremap <expr> <C-K>      pumvisible() ? "\<PageUp>\<C-P>\<C-N>" : "\<C-K>"
   inoremap <expr> <C-U>      pumvisible() ? "\<C-E>" : "\<C-U>"
   inoremap <C-]>             <C-X><C-]>
   inoremap <C-F>             <C-X><C-F>
   inoremap <C-D>             <C-X><C-D>
   inoremap <C-L>             <C-X><C-L>

   " Enable syntax
   if has("autocmd") && exists("+omnifunc")
     autocmd Filetype *
           \if &omnifunc == "" |
           \  setlocal omnifunc=syntaxcomplete#Complete |
             \endif
   endif

   " Enable omni completion.
   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
   autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " cscope setting
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   if has("cscope")
     if Platform() == "linux"
       set csprg=/usr/bin/cscope
     else
       set csprg=cscope
     endif
     set csto=1
     set cst
     set nocsverb
     " add any database in current directory
     if filereadable("cscope.out")
         cs add cscope.out
     endif
     set csverb
   endif

   nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
   nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
   nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

   """"""""""""""""""""""""""""""
   " OmniCppComplete setting
   """"""""""""""""""""""""""""""
   " essential tags
   "set tags+=~/.vim/tags/cpp/glibc
   "set tags+=~/.vim/tags/cpp/stdcpp
   " build tags of your own project with Ctrl-F12
   map <C-F12> :!ctags -R --sort=yes --c++-kinds=+plx --fields=+liaS --extra=+q .<CR>:set tags+=./tags<CR>
   " OmniCppComplete
   let OmniCpp_NamespaceSearch = 1
   let OmniCpp_GlobalScopeSearch = 1
   let OmniCpp_ShowAccess = 1
   let OmniCpp_ShowPrototypeInAbbr = 1
   let OmniCpp_MayCompleteDot = 1
   let OmniCpp_MayCompleteArrow = 1
   let OmniCpp_MayCompleteScope = 1
   let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
   " automatically open and close the popup menu / preview window
   "au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
   "set completeopt=menuone,menu,longest,preview

   """"""""""""""""""""""""""""""
   " vim-ctrlspace setting
   """"""""""""""""""""""""""""""
   if has("gui_running")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
   endif

   if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
   endif

    """"""""""""""""""""""""""""""
    " vim-go setting
    """"""""""""""""""""""""""""""
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_fail_silently = 1
    let g:go_fmt_autosave = 0
    let g:go_play_open_browser = 0
    let g:go_fmt_command = "goimports"
    "let g:go_bin_path = expand("~/.vim/bundle")

    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>c <Plug>(go-coverage)

    au FileType go nmap <Leader>ds <Plug>(go-def-split)
    au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
    au FileType go nmap <Leader>dt <Plug>(go-def-tab)

    au FileType go nmap <Leader>gd <Plug>(go-doc)
    au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
    au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

    au FileType go nmap <Leader>s <Plug>(go-implements)

    au FileType go nmap <Leader>i <Plug>(go-info)

    au FileType go nmap <Leader>e <Plug>(go-rename)
   """"""""""""""""""""""""""""""
   " tabular setting
   """"""""""""""""""""""""""""""
   nmap <Leader>a& :Tabularize /&<CR>
   vmap <Leader>a& :Tabularize /&<CR>
   nmap <Leader>a= :Tabularize /=<CR>
   vmap <Leader>a= :Tabularize /=<CR>
   nmap <Leader>a: :Tabularize /:<CR>
   vmap <Leader>a: :Tabularize /:<CR>
   nmap <Leader>a:: :Tabularize /:\zs<CR>
   vmap <Leader>a:: :Tabularize /:\zs<CR>
   nmap <Leader>a, :Tabularize /,<CR>
   vmap <Leader>a, :Tabularize /,<CR>
   nmap <Leader>a,, :Tabularize /,\zs<CR>
   vmap <Leader>a,, :Tabularize /,\zs<CR>
   nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
   vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

   """"""""""""""""""""""""""""""
   " gundo setting
   """"""""""""""""""""""""""""""
   nnoremap <Leader>u :GundoToggle<CR>

   """"""""""""""""""""""""""""""
   " omnisharp-vim setting
   """"""""""""""""""""""""""""""
   let g:OmniSharp_selector_ui = 'ctrlp'

   " OmniSharp won't work without this setting
   "filetype plugin on

   "This is the default value, setting it isn't actually necessary
   let g:OmniSharp_host = "http://localhost:2000"

   "Set the type lookup function to use the preview window instead of the status line
   "let g:OmniSharp_typeLookupInPreview = 1

   "Timeout in seconds to wait for a response from the server
   let g:OmniSharp_timeout = 1

   "Showmatch significantly slows down omnicomplete
   "when the first match contains parentheses.
   set noshowmatch

   "Super tab settings - uncomment the next 4 lines
   "let g:SuperTabDefaultCompletionType = 'context'
   "let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
   "let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
   "let g:SuperTabClosePreviewOnPopupClose = 1

   "don't autoselect first item in omnicomplete, show if only one item (for preview)
   "remove preview if you don't want to see any documentation whatsoever.
   set completeopt=longest,menuone,preview
   " Fetch full documentation during omnicomplete requests.
   " There is a performance penalty with this (especially on Mono)
   " By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
   " you need it with the :OmniSharpDocumentation command.
   " let g:omnicomplete_fetch_documentation=1

   "Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
   "You might also want to look at the echodoc plugin
   set splitbelow

   " Get Code Issues and syntax errors
   let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
   " If you are using the omnisharp-roslyn backend, use the following
   " let g:syntastic_cs_checkers = ['code_checker']
   augroup omnisharp_commands
       autocmd!

       "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
       autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

       " Synchronous build (blocks Vim)
       "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
       " Builds can also run asynchronously with vim-dispatch installed
       autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
       " automatic syntax check on events (TextChanged requires Vim 7.4)
       autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

       " Automatically add new cs files to the nearest project on save
       autocmd BufWritePost *.cs call OmniSharp#AddToProject()

       "show type information automatically when the cursor stops moving
       autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

       "The following commands are contextual, based on the current cursor position.

       autocmd FileType cs nnoremap <leader>gd :OmniSharpGotoDefinition<cr>
       autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
       autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
       autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
       autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
       "finds members in the current buffer
       autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
       " cursor can be anywhere on the line containing an issue
       autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
       autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
       autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
       autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
       "navigate up by method/property/field
       autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
       "navigate down by method/property/field
       autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

   augroup END

   " this setting controls how long to wait (in ms) before fetching type / symbol information.
   set updatetime=500
   " Remove 'Press Enter to continue' message when type information is longer than one line.
   set cmdheight=2

   " Contextual code actions (requires CtrlP or unite.vim)
   nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
   " Run code actions with text selected in visual mode to extract method
   vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

   " rename with dialog
   nnoremap <leader>nm :OmniSharpRename<cr>
   nnoremap <F2> :OmniSharpRename<cr>
   " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
   command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

   " Force OmniSharp to reload the solution. Useful when switching branches etc.
   nnoremap <leader>rl :OmniSharpReloadSolution<cr>
   nnoremap <leader>cf :OmniSharpCodeFormat<cr>
   " Load the current .cs file to the nearest project
   nnoremap <leader>tp :OmniSharpAddToProject<cr>

   " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
   nnoremap <leader>ss :OmniSharpStartServer<cr>
   nnoremap <leader>sp :OmniSharpStopServer<cr>

   " Add syntax highlighting for types and interfaces
   nnoremap <leader>th :OmniSharpHighlightTypes<cr>
   "Don't ask to save when changing buffers (i.e. when jumping to a type definition)
   set hidden

   """"""""""""""""""""""""""""""
   " sessionman setting
   """"""""""""""""""""""""""""""
   set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
   nmap <leader>sl :SessionList<CR>
   nmap <leader>ss :SessionSave<CR>
   nmap <leader>sc :SessionClose<CR>

   """"""""""""""""""""""""""""""
   " ultisnips setting
   """"""""""""""""""""""""""""""
   " Trigger configuration. Do not use <Tab> if you use
   " https://github.com/Valloric/YouCompleteMe.
   let g:UltiSnipsExpandTrigger="<leader><Tab>"
   let g:UltiSnipsJumpForwardTrigger="<leader><Tab>"
   let g:UltiSnipsJumpBackwardTrigger="<leader><S-Tab>"
   "let g:UltiSnipsEditSplit="vertical"

"   """"""""""""""""""""""""""""""
"   " supertab setting
"   """"""""""""""""""""""""""""""
"   let g:SuperTabRetainCompletionType=2
"   let g:SuperTabPluginLoaded=1 " Avoid load SuperTab Plugin
"   let g:SuperTabDefaultCompletionType='context'
"   let g:SuperTabContextDefaultCompletionType='<C-p>'
"   let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"   let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"   let g:SuperTabContextDiscoverDiscovery =
"         \ ["&completefunc:<C-x><C-u>", "&omnifunc:<C-x><C-o>"]

   """"""""""""""""""""""""""""""
   " syntastic setting
   """"""""""""""""""""""""""""""
   let g:syntastic_check_on_open = 1
   let g:syntastic_cpp_include_dirs = ['/usr/include/']
   let g:syntastic_cpp_remove_include_errors = 1
   let g:syntastic_cpp_check_header = 1
   let g:syntastic_cpp_compiler = 'clang++'
   let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
   let g:syntastic_error_symbol = '✗'
   let g:syntastic_warning_symbol = '⚠'
   let g:syntastic_enable_balloons = 1

   """"""""""""""""""""""""""""""
   " youcomplete setting
   """"""""""""""""""""""""""""""
   let g:ycm_global_ycm_extra_conf = ".vim/.ycm_extra_conf.py"
   let g:ycm_key_list_select_completion=[]
   let g:ycm_key_list_previous_completion=[]
   let g:ycm_error_symbol = '>>'
   let g:ycm_warning_symbol = '>*'
   nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
   nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
   nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
   nmap <F4> :YcmDiags<CR>

"   """"""""""""""""""""""""""""""
"   " neocomplete setting
"   """"""""""""""""""""""""""""""
"   "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"   " Disable AutoComplPop.
"   let g:acp_enableAtStartup = 0
"   " Use neocomplete.
"   let g:neocomplete#enable_at_startup = 1
"   " Use smartcase.
"   let g:neocomplete#enable_smart_case = 1
"   " Set minimum syntax keyword length.
"   let g:neocomplete#sources#syntax#min_keyword_length = 3
"   let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"   " Define dictionary.
"   let g:neocomplete#sources#dictionary#dictionaries = {
"       \ 'default' : '',
"       \ 'vimshell' : $HOME.'/.vimshell_hist',
"       \ 'scheme' : $HOME.'/.gosh_completions'
"           \ }
"
"   " Define keyword.
"   if !exists('g:neocomplete#keyword_patterns')
"       let g:neocomplete#keyword_patterns = {}
"   endif
"   let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"   " Plugin key-mappings.
"   inoremap <expr><C-g>     neocomplete#undo_completion()
"   inoremap <expr><C-l>     neocomplete#complete_common_string()
"   " Recommended key-mappings.
"   " <CR>: close popup and save indent.
"   inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"   function! s:my_cr_function()
"     return neocomplete#close_popup() . "\<CR>"
"     " For no inserting <CR> key.
"     "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"   endfunction
"   " <Tab>: completion.
"   inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
"   " <C-h>, <BS>: close popup and delete backword char.
"   inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"   inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"   inoremap <expr><C-y>  neocomplete#close_popup()
"   inoremap <expr><C-e>  neocomplete#cancel_popup()
"   " Close popup by <Space>.
"   "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
"
"   " For cursor moving in insert mode(Not recommended)
"   "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"   "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"   "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"   "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
"   " Or set this.
"   "let g:neocomplete#enable_cursor_hold_i = 1
"   " Or set this.
"   "let g:neocomplete#enable_insert_char_pre = 1
"
"   " AutoComplPop like behavior.
"   "let g:neocomplete#enable_auto_select = 1
"
"   " Shell like behavior(not recommended).
"   "set completeopt+=longest
"   "let g:neocomplete#enable_auto_select = 1
"   "let g:neocomplete#disable_auto_complete = 1
"   "inoremap <expr><Tab>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

   "" Enable omni completion.
   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
   autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

   " Enable heavy omni completion.
   if !exists('g:neocomplete#sources#omni#input_patterns')
     let g:neocomplete#sources#omni#input_patterns = {}
   endif
   "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
   let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
   let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

   "let g:neocomplete#auto_completion_start_length = 4

   " For perlomni.vim setting.
   " https://github.com/c9s/perlomni.vim
   " let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

   """"""""""""""""""""""""""""""
   " yankring setting
   """"""""""""""""""""""""""""""
   let g:yankring_enabled=1
   let g:yankring_history_file='.yankring_history_file'
   map <leader>yr :YRShow<CR>

   """"""""""""""""""""""""""""""
   " file explorer setting
   """"""""""""""""""""""""""""""
   " Split vertically
   let g:explVertical=1
   " Window size
   let g:explWinSize=35
   let g:explSplitLeft=1
   let g:explSplitBelow=1
   " Hide some files
   let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'
   " Hide the help thing..
   let g:explDetailedHelp=0

   """"""""""""""""""""""""""""""
   " bufexplorer setting
   """"""""""""""""""""""""""""""
   let g:bufExplorerDefaultHelp=1       " Do not show default help.
   let g:bufExplorerShowRelativePath=1  " Show relative paths.
   let g:bufExplorerSortBy='mru'        " Sort by most recently used.
   let g:bufExplorerSplitRight=0        " Split left.
   let g:bufExplorerSplitVertical=1     " Split vertically.
   let g:bufExplorerSplitVertSize = 35  " Split width
   let g:bufExplorerUseCurrentWindow=1  " Open in new window.
   let g:bufExplorerMaxHeight=25        " Max height

   """"""""""""""""""""""""""""""
   " MiniBufExpl setting
   """"""""""""""""""""""""""""""
   let g:miniBufExplAutoStart = 0
   let g:miniBufExplBuffersNeeded = 1
   map <leader>mbe :MBEOpenAll<CR>
   map <leader>mbc :MBECloseAll<CR>
   map <leader>mbt :MBEToggleAll<CR>
   map <leader>bn :MBEbn<CR>
   map <leader>bp :MBEbp<CR>
   "hi MBENoraml guibg=black ctermbg=black
   "hi MBEVisualNormal guibg=green ctermbg=green

   """""""""""""""""""""""""""""""
   "" taglist setting
   """""""""""""""""""""""""""""""
   "if Platform() == "windows"
   "  let Tlist_Ctags_Cmd = 'ctags'
   "elseif Platform() == "linux"
   "  let Tlist_Ctags_Cmd = '/usr/bin/ctags'
   "endif
   "let Tlist_Show_One_File = 1
   "let Tlist_Exit_OnlyWindow = 1
   "let Tlist_Use_Right_Window = 1
   "nmap <silent> <leader>tl :Tlist<CR>

   """"""""""""""""""""""""""""""
   " indexer setting
   """"""""""""""""""""""""""""""
   " indexer parameters for ctags
   "let g:indexer_ctagsCommandLineOptions="--c++-kinds=+plx --fields=+liaS --extra=+q --language-force=c++"

   """"""""""""""""""""""""""""""
   " vim-indent-guides setting
   """"""""""""""""""""""""""""""
   " indent with vim started
   "let g:indent_guides_enable_on_vim_startup=1
   let g:indent_guides_start_level=2
   let g:indent_guides_guide_size=1
   nmap <silent> <leader>ig <Plug>IndentGuidesToggle

   """"""""""""""""""""""""""""""
   " autoclose setting
   """"""""""""""""""""""""""""""
   let g:AutoCloseProtectedRegions = ["Comment", "String", "Character"]
   imap <silent> <leader>ac :AutoCloseToggle<CR>

   """"""""""""""""""""""""""""""
   " vim-markdown setting
   """"""""""""""""""""""""""""""
   autocmd BufNewFile,BufReadPost *.md set filetype=markdown
   let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

   """"""""""""""""""""""""""""""
   " echofunc setting
   """"""""""""""""""""""""""""""
   let g:EchoFuncShowOnStatus = 1

   """"""""""""""""""""""""""""""
   " quickfix setting
   """"""""""""""""""""""""""""""
   "nmap <leader>cn :cn<CR>
   nmap <leader>cp :cp<CR>
   nmap <leader>cw :cw 10<CR>
   nmap <leader>cc :botright lw 10<CR>
   "map <c-u> <c-l><c-j>:q<CR>:botright cw 10<CR>

   "Automatically open the quickfix window on :make
   " Automatically open, but do not go to (if there are errors) the quickfix /
   " " location list window, or close it when is has become empty.
   " "
   " " Note: Must allow nesting of autocmds to enable any customizations for
   " quickfix
   " " buffers.
   " " Note: Normally, :cwindow jumps to the quickfix window if the command
   " opens it
   " " (but not if it's already open). However, as part of the autocmd, this
   " doesn't
   " " seem to happen.
   autocmd QuickFixCmdPost [^l]* nested cwindow
   autocmd QuickFixCmdPost    l* nested lwindow

   "Automatically fitting a quickfix window height
   au FileType qf call AdjustWindowHeight(3, 10)
   function! AdjustWindowHeight(minheight, maxheight)
       exe max([min([line("$")+1, a:maxheight]), a:minheight]) . "wincmd _"
   endfunction

   """"""""""""""""""""""""""""""
   " winmanager setting
   """"""""""""""""""""""""""""""
   "let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
   let g:winManagerWidth = 30
   let g:defaultExplorer = 0
   nmap <C-W><C-F> :FirstExplorerWindow<CR>
   nmap <C-W><C-B> :BottomExplorerWindow<CR>
   nmap <silent> <leader>wm :WMToggle<CR>
   autocmd BufWinEnter \[Buf\ List\] setl nonumber

"   """""""""""""""""""""""""""""""""""
"   " winmanager setting for NERDTree
"   """""""""""""""""""""""""""""""""""
"   " NERD_Tree for WinManager
"   let g:NERDTree_title="[NERDTree]"
"   function! NERDTree_Start()
"       exec 'NERDTree'
"   endfunction
"
"   function! NERDTree_IsValid()
"       return 1
"   endfunction
"
   """"""""""""""""""""""""""""""
   " ctrlp setting
   """"""""""""""""""""""""""""""
   "let g:ctrlp_map = '<c-p>'
   "let g:ctrlp_cmd = 'CtrlP'
   "let g:ctrlp_working_path_mode = 'ra'
   set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
   let g:ctrlp_custom_ignore = {
     \ 'dir':  '\v[\/]\.(git|hg|svn)$',
     \ 'file': '\v\.(exe|so|dll)$',
     \ 'link': 'some_bad_symbolic_links',
     \ }
   let g:ctrlp_user_command = {
     \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
     \ 'fallback': 'find %s -type f'
     \ }

   """"""""""""""""""""""""""""""
   " ctrlp funky setting
   """"""""""""""""""""""""""""""
   let g:ctrlp_extensions = ['funky']
   nnoremap <leader>fu :CtrlPFunky<Cr>
   " narrow the list down with a word under cursor
   nnoremap <leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
   "SYNTAX HIGHLIGHTING (experimental)
   let g:ctrlp_funky_syntax_highlight = 1

   """"""""""""""""""""""""""""""
   " NERDTree setting
   """"""""""""""""""""""""""""""
   nmap <silent> <leader>nt :NERDTreeToggle<CR>
   let NERDTreeWinSize = 23

   """"""""""""""""""""""""""""""
   " vim-latex-suite setting
   """"""""""""""""""""""""""""""
   " IMPORTANT: grep will sometimes skip displaying the file name if you
   " " search in a singe file. This will confuse Latex-Suite. Set your grep
   " " program to always generate a file-name.
   "set grepprg=grep\ -nH\ $*
   " Starting with Vim 7, the filetype of empty .tex files defaults
   " to 'plaintex' instead of 'tex', which results in vim-latex not being
   " loaded. The following changes the default filetype back to 'tex'
   "let g:tex_flavor='latex'
   "set iskeyword+=:

"   """"""""""""""""""""""""""""""
"   " SrcExpl setting
"   """"""""""""""""""""""""""""""
"   nmap <F8> :SrcExplToggle<CR>
"   map <leader>se :SrcExplToggle<CR>
"   " // Set the height of Source Explorer window
"   let g:SrcExpl_winHeight = 8
"   " // Set 100 ms for refreshing the Source Explorer
"   let g:SrcExpl_refreshTime = 5000
"   " // Set "Enter" key to jump into the exact definition context
"   let g:SrcExpl_jumpKey = "<ENTER>"
"   " // Set "Space" key for back from the definition context
"   let g:SrcExpl_gobackKey = "<SPACE>"
"   " // In order to avoid conflicts, the Source Explorer should know what plugins
"   " // except itself are using buffers. And you need add their buffer names into
"   " // below listaccording to the command ":buffers!"
"   let g:SrcExpl_pluginList = [
"           \ "__Tag_List__",
"           \ "_NERD_tree_"
"       \ ]
"   " // Enable/Disable the local definition searching, and note that this is not
"   " // guaranteed to work, the Source Explorer doesn't check the syntax for now.
"   " // It only searches for a match with the keyword according to command 'gd'
"   let g:SrcExpl_searchLocalDef = 1
"   " // Do not let the Source Explorer update the tags file when opening
"   let g:SrcExpl_isUpdateTags = 0
"   " // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
"   " // create/update the tags file
"   let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
"   " // Set "<F12>" key for updating the tags file artificially
"   let g:SrcExpl_updateTagsKey = "<F12>"
"   " // Set "<F3>" key for displaying the previous definition in the jump list
"   let g:SrcExpl_prevDefKey = "<F3>"
"   " // Set "<F4>" key for displaying the next definition in the jump list
"   let g:SrcExpl_nextDefKey = "<F4>"

"   """"""""""""""""""""""""""""""
"   " lookupfile setting
"   """"""""""""""""""""""""""""""
"   let g:LookupFile_MinPatLength = 2
"   let g:LookupFile_PreserveLastPattern = 0
"   let g:LookupFile_PreservePatternHistory = 0
"   let g:LookupFile_AlwaysAcceptFirst = 1
"   let g:LookupFile_AllowNewFiles = 0
"   let g:LookupFile_UsingSpecializedTags = 1
"   let g:LookupFile_Bufs_LikeBufCmd = 0
"   let g:LookupFile_ignorecase = 1
"   let g:LookupFile_smartcase = 1
"   if filereadable("./filenametags")
"       let g:LookupFile_TagExpr = '"./filenametags"'
"   endif
"   nmap <silent> <leader>lk :LUTags<CR>
"   nmap <silent> <leader>ll :LUBufs<CR>
"   nmap <silent> <leader>lw :LUWalk<CR>
"
"   " lookup file with ignore case
"   function! LookupFile_IgnoreCaseFunc(pattern)
"       let _tags = &tags
"       try
"           let &tags = eval(g:LookupFile_TagExpr)
"           let newpattern = '\c' . a:pattern
"           let tags = taglist(newpattern)
"       catch
"           echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
"           return ""
"       finally
"           let &tags = _tags
"       endtry
"
"       " Show the matches for what is typed so far.
"       let files = map(tags, 'v:val["filename"]')
"       return files
"   endfunction
"   let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

   """"""""""""""""""""""""""""""
   " markbrowser setting
   """"""""""""""""""""""""""""""
   nmap <silent> <leader>mk :MarksBrowser<CR>

   """"""""""""""""""""""""""""""
   " showmarks setting
   """"""""""""""""""""""""""""""
   let showmarks_enable = 1
   let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
   let showmarks_ignore_type = "hqm"
   let showmarks_hlline_lower = 1
   let showmarks_hlline_upper = 1

   """"""""""""""""""""""""""""""
   " mark setting
   """"""""""""""""""""""""""""""
   nmap <silent> <leader>hl <Plug>MarkSet
   vmap <silent> <leader>hl <Plug>MarkSet
   nmap <silent> <leader>hh <Plug>MarkClear
   vmap <silent> <leader>hh <Plug>MarkClear
   nmap <silent> <leader>hr <Plug>MarkRegex
   vmap <silent> <leader>hr <Plug>MarkRegex

   """"""""""""""""""""""""""""""
   " FeralToggleCommentify setting
   """"""""""""""""""""""""""""""
   ""let loaded_feraltogglecommentify = 1
   "map <silent> <leader>tc :call ToggleCommentify()<CR>j
   "imap <M-c> <ESC>:call ToggleCommentify()<CR>j

   """"""""""""""""""""""""""""""
   " vimgdb setting
   """"""""""""""""""""""""""""""
   "let g:vimgdb_debug_file = ""
   "run macros/gdb_mappings.vim

"   """"""""""""""""""""""""""""""
"   " eclim setting
"   """"""""""""""""""""""""""""""
"   let g:EclimTaglistEnabled=0

   """"""""""""""""""""""""""""""
   " FSwitch setting
   """"""""""""""""""""""""""""""
   au! BufEnter *.cc,*.cpp let b:fswitchdst = 'h' | let b:fswitchlocs = '.'
   au! BufEnter *.h let b:fswitchdst = 'cc,cpp' | let b:fswitchlocs = '.'
   let g:fsnonewfiles = "on"
   nmap <silent> <leader>of :FSHere<CR>

   """"""""""""""""""""""""""""""
   " tagbar setting
   """"""""""""""""""""""""""""""
   let g:tagbar_width = 20
   let g:tagbar_expand = 1
   "let g:tagbar_left = 1
   nmap <silent> <leader>tb :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Todo
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   "au BufNewFile,BufRead *.todo so ~/vim_local/syntax/amido.vim

   """"""""""""""""""""""""""""""
   " HTML related
   """"""""""""""""""""""""""""""
   " HTML entities - used by xml edit plugin
   let xml_use_xhtml = 1
   "let xml_no_auto_nesting = 1

   "To HTML
   let html_use_css = 1
   let html_number_lines = 0
   let use_xhtml = 1

   """""""""""""""""""""""""""""""
   " Vim section
   """""""""""""""""""""""""""""""
   autocmd FileType vim set nofen
   autocmd FileType vim map <buffer> <leader><space> :w!<CR>:source %<CR>

   """"""""""""""""""""""""""""""
   " HTML
   """""""""""""""""""""""""""""""
   au FileType html set ft=xml
   au FileType html set syntax=html

   """"""""""""""""""""""""""""""
   " C/C++
   """""""""""""""""""""""""""""""
   autocmd FileType c,cpp,xml  map <buffer> <leader><space> :wa<CR>:make<CR>
   autocmd FileType c,cpp  setl foldmethod=syntax | setl fen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   function! s:GetVisualSelection()
       let save_a = @a
       silent normal! gv"ay
       let v = @a
       let @a = save_a
       let var = escape(v, '\\/.$*')
       return var
   endfunction

   " Fast grep
   nmap <silent> <leader>lv :lv /<c-r>=expand("<cword>")<CR>/ %<CR>:lw<CR>
   vmap <silent> <leader>lv :lv /<c-r>=<sid>GetVisualSelection()<CR>/ %<CR>:lw<CR>

   " Fast diff
   "cmap @vd vertical diffsplit
   set diffopt+=vertical

   "Remove the Windows ^M
   noremap <leader>dm mzHmx:%s/<C-V><CR>//ge<CR>'xzt'z:delm x z<CR>

   "Paste toggle - when pasting something in, don't indent.
   nnoremap <F2> :set invpaste paste?<CR>
   set pastetoggle=<F2>

   "Super paste
   inoremap <C-v> <esc>:set paste<CR>mui<C-R>+<esc>mv'uV'v=:set nopaste<CR>

   "Remove indenting on empty lines
   map <F3> :%s/\s*$//g<CR>:noh<CR>''

   "Fast Ex command
   "nnoremap ; :

   "For mark move
   "nnoremap <leader>' '

   "A function that inserts links & anchors on a TOhtml export.
   " Notice: Syntax used is: Link Anchor
   function! SmartTOHtml()
    TOhtml
    try
     %s/&quot;\s\+\*&gt; \(.\+\)</" <a href="#\1" style="color: cyan">\1<\/a></g
     %s/&quot;\(-\|\s\)\+\*&gt; \(.\+\)</" \&nbsp;\&nbsp; <a href="#\2" style="color: cyan;">\2<\/a></g
     %s/&quot;\s\+=&gt; \(.\+\)</" <a name="\1" style="color: #fff">\1<\/a></g
    catch
    endtry
    exe ":write!"
    exe ":bd"
   endfunction

   "delete blank line
   nmap <silent> <leader>dbl :g/^\s*$/d<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark as loaded
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrc_loaded = 1
