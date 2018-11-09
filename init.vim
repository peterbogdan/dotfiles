call plug#begin('~/.vim/plugged')
" File tree
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
"easy comment lines
Plug 'scrooloose/nerdcommenter'
Plug 'koirand/tokyo-metro.vim'
Plug 'junegunn/seoul256.vim'
Plug 'trevordmiller/nova-vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'altercation/solarized'
"Autocomplete for c++:
Plug 'Shougo/deoplete.nvim'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'davidhalter/jedi-vim'
Plug 'numirias/semshi'
call plug#end()

" basics:
command! W :w
filetype plugin indent on
syntax on
set number
set relativenumber
set incsearch
set hlsearch
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap

" preferances:
let mapleader="\<Space>"
nnoremap <space> <Nop>
noremap Y y$
noremap <leader>p "+gp
noremap <leader>y "+gy
imap jj <Esc>l
tnoremap <Esc> <c-\><c-n>
"stay in visual mode after identation:
vnoremap > >gv
vnoremap < <gv
"navigate split screen easily:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"resize split screen's easily:
nnoremap <silent> <c-Up> :exe "resize +5"<CR>
nnoremap <silent> <c-Right> :exe "vertical resize +5"<CR>
nnoremap <silent> <c-Down> :exe "resize -5"<CR>
nnoremap <silent> <c-Left> :exe "vertical resize -5"<CR>

"plugin settings

"vim- airline
let g:airline_powerline_fonts = 1
set guifont=Meslo\ LG\ S\ Regular\ for\ PowerLine:h20
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1

"theme:
syntax enable
set background=dark
"set termguicolors
"colorscheme solarized
colorscheme tokyo-metro

"NERDTree:
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules', '__init__.py', ]
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeShowIgnoredStatus = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"Syntastic:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
noremap <leader>s :lclose<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Semshi:
let g:semshi#active = 1
function MyCustomHighlights()
    hi semshiLocal           ctermfg=209 guifg=#ff875f
    hi semshiGlobal          ctermfg=214 guifg=#ffaf00
    hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
    hi semshiParameter       ctermfg=75  guifg=#5fafff
    hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
    hi semshiFree            ctermfg=218 guifg=#ffafd7
    hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
    hi semshiAttribute       ctermfg=49  guifg=#00ffaf
    hi semshiSelf            ctermfg=249 guifg=#b2b2b2
    hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

    hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    sign define semshiError text=E> texthl=semshiErrorSign
endfunction
autocmd FileType python call MyCustomHighlights()
autocmd ColorScheme * call MyCustomHighlights()

"Putty color settings for 16-color display:
if &term =~ "xterm"
  " 256 colors
  let &t_Co = 256
  " restore screen after quitting
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
endif

nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
    if exists("s:maximize_session")
        exec "source " . s:maximize_session
        call delete(s:maximize_session)
        unlet s:maximize_session
        let &hidden=s:maximize_hidden_save
        unlet s:maximize_hidden_save
    else
        let s:maximize_hidden_save = &hidden
        let s:maximize_session = tempname()
        set hidden
        exec "mksession! " . s:maximize_session
        only
    endif
endfunction
