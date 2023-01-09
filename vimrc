" Start vim plug
call plug#begin('~/.vim/plugged')

" Highlighting syntatx
Plug 'vim-syntastic/syntastic'

" Tab autocomplete
Plug 'ervandew/supertab'

" Autocomplete for open-close pairs
Plug 'Townk/vim-autoclose'

" File browser
Plug 'preservim/nerdtree'

call plug#end()


" General Vim Config
set encoding=utf-8
set number
set updatetime=100
set modifiable
set spell
"
" Tab = 4 spaces for python
autocmd Filetype python setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Vim Colors
colorscheme molokai
hi clear SpellBad
hi SpellBad cterm=underline


" Use terminal colors and bug fix
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Synastic Config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Synastic Extension config
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_plaintex_checkers = ["lacheck"]

" Nerdtree config
map <C-n> :NERDTreeToggle<CR>
