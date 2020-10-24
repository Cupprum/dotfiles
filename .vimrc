set shell=bash
set encoding=utf-8
set autoindent
set nobackup
set smartcase
set ignorecase
set mouse=a
set clipboard=unnamed
set showmatch
set shiftwidth=4
set textwidth=0
set fileformat=unix
set tabstop=4
set shiftwidth=4
set expandtab

set noswapfile

" Remap arrows for autocomplete in command mode
set wildmode=list:longest,full

filetype plugin indent on

" Numbers
set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'bluz71/vim-moonfly-colors'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let mapleader = "`"

" Movement
nnoremap ‚àÜ <C-e>
nnoremap Àö <C-y>
nnoremap K <PageUp>
nnoremap J <PageDown>

" FZF - fuzzy file search
set rtp+=/usr/local/opt/fzf
nnoremap ∆í :Ag<CR> 
nnoremap <C-f> :Lines<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :Buffers<CR> 
nnoremap <C-i> :History<CR>

" Splits
set splitbelow
set splitright
noremap <C-w>l :vnew<CR>
noremap <C-w>j :new<CR>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Themes
set termguicolors
colorscheme moonfly

" Go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

let g:go_doc_keywordprg_enabled = 0
let g:go_null_module_warning=0
let g:go_fmt_command = "goimports"

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" MyIndentline
set list listchars=tab:\¬¶\ 
autocmd BufEnter *.go call matchadd("MyIndentLine", "\t")
autocmd BufEnter *.go call matchadd("MyIndentLineWithoutFirst", "^\t")
hi MyIndentLine guifg=#df00df 
hi MyIndentLineWithoutFirst guifg=#080808

" Indentline
let g:indentLine_char = '¬¶'
let g:indentLine_color_gui = '#df00df'
let g:indentLine_fileTypeExclude = ['markdown']

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> ¬± pumvisible() ? deoplete#smart_close_popup() : "\<Tab>"

" UltiSnips
" let g:UltiSnipsExpandTrigger = "¬ß"
let g:UltiSnipsExpandTrigger = "`"

" Ale
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Airline 
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

" HOTFIX
cnoremap 00 <c-u>undo<CR>

" Yaml definition
autocmd BufNewFile,BufRead *.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 fileformat=unix
autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2 fileformat=unix

" Toml definition
autocmd BufNewFile,BufRead *.toml setlocal tabstop=4 softtabstop=4 shiftwidth=4 fileformat=unix

" MarkDown definition
autocmd BufNewFile,BufRead *.md setlocal tabstop=2 softtabstop=2 shiftwidth=2 fileformat=unix textwidth=80

" ---------------- OLD STUFF
" <leader-k> redraws the screen and removes any search highlighting.
" nnoremap <leader>k :nohl<CR><C-l>

" Commentary
" vnoremap <C-\> :Commentary<CR>
" nnoremap <C-\> :Commentary<CR>

" syntax on

" Airline
" set noshowmode
" if !exists('g:airline_symbols')
" let g:airline_symbols = {}
" endif

" let g:airline_left_sep = 'ÓÇ∞'
" let g:airline_left_alt_sep = 'ÓÇ±'
" let g:airline_right_sep = 'ÓÇ≤'
" let g:airline_right_alt_sep = 'ÓÇ≥'
" let g:airline_symbols.branch = 'ÓÇ†'
" let g:airline_symbols.readonly = 'ÓÇ¢'
" let g:airline_symbols.linenr = '‚ò∞'
" let g:airline_symbols.maxlinenr = 'ÓÇ°'
