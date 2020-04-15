set encoding=utf-8

set autoindent
set nobackup
set smartcase
set ignorecase
filetype plugin indent on

set mouse=a
set clipboard=unnamed
set showmatch

" Numbers
set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Vundle
"set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'Valloric/YouCompleteMe'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'rizzatti/dash.vim'
Plugin 'megantiu/true.vim'
Plugin 'fatih/vim-go'

call vundle#end()

let mapleader = "`"

" Buffers
nnoremap <leader>h :bnext<CR>
nnoremap <leader>l :bprev<CR>

" Movement
nnoremap <M-j> <C-e>
nnoremap <M-k> <C-y>

" Tabs
nnoremap <leader>t :tabe<CR>

" FZF - fuzzy file search
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Ag<CR> 
nnoremap <C-o> :Buffers<CR> 
nnoremap <C-m> :History<CR>

" MRU - most recently used - REPLACED FOR FZF HISTORY
" let g:mru_file_list_size = 20
" nnoremap <C-m> :Mru<CR>

" <Ctrl-k> redraws the screen and removes any search highlighting.
nnoremap <C-k> :nohl<CR><C-l>

" Splits
set splitbelow
set splitright
noremap <C-l> :vnew<CR>
noremap <C-j> :new<CR>

" Nerdtree
map <C-\> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Dash open on cursor
nnoremap <leader>d :Dash<CR>

" Remap arrows for autocomplete in command mode
set wildmode=list:longest,full
"
" Javipolo
set termguicolors
colorscheme javipolo

" Go
function! GO_FUNC()
	only
	GoRun
endfunction
nnoremap go :<C-u>call GO_FUNC()<CR>

" Indenline
set list listchars=tab:\¦\ 

" Ycm
let g:ycm_autoclose_preview_window_after_completion=1

" Vim Latex Live Preview
let g:livepreview_previewer = 'open -a Preview'

" Syntastic
let g:syntastic_python_checkers=['flake8']
let g:syntastic_go_checkers=['golint']
let g:syntastic_check_on_open = 1
let python_highlight_all=1
let go_highlight_all=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline 
let g:airline#extensions#tabline#enabled = 1
set noshowmode
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

set shiftwidth=4
set textwidth=79
set fileformat=unix
set tabstop=4 shiftwidth=4 expandtab

" JS/HTML/CSS definition 
autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2 fileformat=unix
autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2 fileformat=unix
autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2 fileformat=unix

" Yaml/Toml definition
autocmd BufNewFile,BufRead *.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 fileformat=unix
autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2 fileformat=unix
autocmd BufNewFile,BufRead *.toml setlocal tabstop=2 softtabstop=2 shiftwidth=2 fileformat=unix

" Latex definition
autocmd BufNewFile,BufRead *.tex setlocal tabstop=2 softtabstop=2 shiftwidth=2 fileformat=unix
