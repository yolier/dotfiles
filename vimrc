" Enable Pathogen
execute pathogen#infect()
filetype plugin indent on

" Set color scheme
syntax enable
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized

" map F8 to TagBarToggle
nmap <F8> :TagbarToggle<CR>

" Vairios sets
set laststatus=2
set backupdir=~/.backup
set directory=~/.backup
set number
set cmdheight=2
set shortmess=a

" Ctrlp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1


" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Some small configs to use NERDTree more effectively
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | e
map <Leader>n :NERDTreeToggle<CR>
