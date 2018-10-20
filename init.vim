call plug#begin('~/.vim/plugged')
" File tree
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
"easy comment lines
Plug 'scrooloose/nerdcommenter'
Plug 'koirand/tokyo-metro.vim'
Plug 'trevordmiller/nova-vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
"Autocomplete for c++:
Plug 'Shougo/deoplete.nvim'
"Plug 'davidhalter/jedi-vim'
call plug#end()

" basics:
filetype plugin indent on
syntax on
set number
set relativenumber
set incsearch
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
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
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
set termguicolors
"colorscheme solarized
colorscheme tokyo-metro

"NERDTree:
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"Syntastic:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
