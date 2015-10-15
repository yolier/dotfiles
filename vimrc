" Vim configuration file
" YoLieR - 2015-10-15

" Manage all the Plugins using Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-repeat'
Plugin 'mattn/emmet-vim'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'freitass/todo.txt-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'LaTeX-Box-Team/LaTeX-Box'

call vundle#end()            " required
filetype plugin indent on    " required

" Set color scheme
syntax enable
colorscheme gruvbox
set background=dark

" Vairios sets
set laststatus=2
set backupdir=~/.backup
set directory=~/.backup
set number
set relativenumber
set cmdheight=2
set shortmess=a
set spell spelllang=de,en_us
set colorcolumn=81
set scrolloff=3
set autoindent
set incsearch
set hlsearch
set history=50
set splitbelow
set splitright
let g:vim_markdown_folding_disabled=1
let g:instant_markdown_autostart = 0


" Ctrlp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1


" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Some small configs to use NERDTree more effectively
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | e
map <Leader>n :NERDTreeToggle<CR>

" Custom Key Maps
map <Leader>t :TagbarToggle<CR>
map <c-b> :CtrlPBuffer<CR>
map <Leader>vr :VimuxPromptCommand<CR>
map <Leader>vc :VimuxCloseRunner<CR>
map <Leader>cd :cd %:p:h<CR>
nmap tc b~e
map <Leader>id :r! date "+\%Y-\%m-\%d"<CR>
"map <Leader>lc :Latexmk<CR>
"map <Leader>lv :LatexView<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
