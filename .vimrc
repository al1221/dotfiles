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
set ttyfast                     " faster redraw
set backspace=indent,eol,start  " better backspace
set laststatus=2        " show status line
set autoread            " reload files changed outside automatically
set wrap
set scrolloff=3         " Always shows 5 lines above/below the cursor
set clipboard=unnamed   " copy to clipboard with p
set visualbell
set undodir=$HOME/.vimundo
set undofile
set relativenumber

" Indentation
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set shiftwidth=4
set autoindent

" Searching 
nnoremap / /\v
vnoremap / /\v
set ignorecase          " ignore case when searching
set smartcase           " but if one of the letter is upper case use it
set incsearch           " search as characters are entered
set showmatch           " highlight matching parenthesis
set hlsearch            " highlight all matches
set gdefault            " globally replace with :%s/foo/bar
nnoremap <leader><space> :noh<CR>
nnoremap <tab> %
vnoremap <tab> %

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
cnoremap jk <esc>
inoremap kj <esc>
vnoremap kj <esc>
cnoremap kj <esc>
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
let maplocalleader=","

nnoremap <leader>w :Ex<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>m :make<CR>
nnoremap <leader>1 :set number!<CR>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
nnoremap p "*p
nnoremap gb :ls<cr>:b<space>

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" C++
let g:ConqueGdb_Leader = maplocalleader
set makeprg=g++\ -g\ %
nnoremap <leader>r :!./a.out<CR>
nnoremap <silent><localleader>y :ConqueGdbCommand y<CR>
nnoremap <silent><localleader>n :ConqueGdbCommand n<CR>
nnoremap <localleader>c :ConqueGdbVSplit a.out<CR> 
nnoremap <localleader>s :ConqueTerm bash<CR>

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

" Latex
autocmd BufNewFile,BufRead *.tex set makeprg=latexmk\ -pdf\ %<CR>
nnoremap <leader>v :w<CR>:!~/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %:r.pdf<CR><CR>
