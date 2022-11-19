version 6.0
if &cp | set nocp | endif
map ,w :w!␖
let s:cpo_save=&cpo
set cpo&vim
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
xnoremap <silent> <Plug>NetrwBrowseXVis :␖␕call netrw#BrowseXVis()␖
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))␖
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
" set backup
set display=truncate
set fileencodings=ucs-bom,utf-8,default,latin1
set guicursor=n-v-c:block,o:hor50,i-ci:hor15,r-cr:hor30,sm:block,a:blinkon0
set helplang=en
set history=1000
set hlsearch
set ignorecase
set incsearch
set langnoremap
set nolangremap
set nrformats=bin,hex
set ruler
set scrolloff=5
set showcmd
set smartcase
set smartindent
set ttimeout
set ttimeoutlen=100
set viminfo='20,\"50
set wildmenu
set ai
set si
set shiftwidth=2
set tabstop=4
set encoding=UTF-8

set termguicolors
syntax on
let ayucolor="dark"
colorscheme ayu

set formatoptions-=cro
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2

" plugin list
call plug#begin(system('echo -n "/home/ahmad-khatib/.config/nvim/plugged"'))

Plug 'tiagovla/tokyodark.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'honza/vim-snippets'
Plug 'vimwiki/vimwiki'
"Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/coc-flutter'

call plug#end()

" Support 24-bit color
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
	set termguicolors
endif

" Aesthetics
set background=dark
"colorscheme tokyodark
"let g:lightline = {'colorscheme' : 'tokyonight'}
set laststatus=2

" line numbers
set number
set relativenumber

hi Normal guibg=NONE ctermbg=NONE

syntax on

" fzf search
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :BLines<CR>
nnoremap <C-g> :GFiles<CR>

let g:Hexokinase_highlighters = ['virtual']

" emmet shortcuts
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

" coc settings
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-json',
  \ ]

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <A-C-j> yyp
nnoremap <A-C-k> yyP

let g:vimwiki_list = [{'path': '~/documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

