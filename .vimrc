execute pathogen#infect()
syntax on
filetype plugin indent on

" Spell checking
setlocal spell spelllang=en_gb " turn spell checking on, use z= to see alternatives

set nocompatible
syntax enable           " enable syntax processing
colorscheme gruvbox 
set background=dark

set hidden
set number              " show line numbers
set wildchar=<Tab> wildmenu wildmode=full
set showmatch           " higlight matching parenthesis
set ttyfast                     " faster redraw
set backspace=indent,eol,start  " better backspace
set colorcolumn=100
set laststatus=2        " show status line
set autoread            " reload files changed outside automatically
set wrap
set scrolloff=5         " Always shows 5 lines above/below the cursor
set clipboard=unnamed   " copy to clipboard with p

" Indentation
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set shiftwidth=4
set autoindent

" Searching 
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches

" Splits
set splitbelow
set splitright

" Setting for gv command to open file under coursor
let &path.="src/include,/usr/include/AL,"  

" Line Shortcuts
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap Y  y$
" use as escape
inoremap jk <esc>
vnoremap jk <esc>
inoremap kj <esc>
vnoremap kj <esc>
" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv
" recenter when searching
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

" Leader Shortcuts 
let mapleader="\<space>"
let maplocalleader="'"

nnoremap <leader>w :Ex<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>1 :set number!<CR>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
nnoremap <leader>p "*p
nnoremap gb :ls<cr>:b<space>

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" CtrlP 
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Undo tree
let g:undotree_WindowLayout=2
let g:undotree_DiffCommand="diff -u"

" Backups
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" Custom Functions 
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())
 
  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "r"
      let c = "["
  endif
 
  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" Air-line
 if !exists('g:airline_symbols')
     let g:airline_symbols = {}
 endif

 let g:airline_left_sep = ''
 let g:airline_right_sep = ''
 let g:airline_symbols.linenr = '|'
 let g:airline_symbols.branch = 'Y'
 let g:airline_symbols.paste = 'p'
 let g:airline_symbols.whitespace = ''

