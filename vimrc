" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Start vim plug
call plug#begin('~/.vim/plugged')

" Linting
Plug 'dense-analysis/ale'

" Tab autocomplete
Plug 'ervandew/supertab'

" Autocomplete for open-close pairs
Plug 'Townk/vim-autoclose'

" File browser
Plug 'preservim/nerdtree'

" Vimshell dependency
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Simple Shell
Plug 'shougo/vimshell.vim'

call plug#end()

" General Vim Config
set encoding=utf-8
set number
set updatetime=100
set modifiable
set spell

" Tab = 4 spaces for various file types
autocmd Filetype python setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype c setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype cpp setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Vim Colors
colorscheme molokai
hi clear SpellBad
hi SpellBad cterm=underline

" Use terminal colors and bug fix
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" ALE keybinds
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ALE C++ config
let g:ale_cpp_cc_options = '-std=c++20'
let g:ale_cpp_clangtidy_options = '-std=c++20'

" Nerdtree config
map <C-n> :NERDTreeToggle<CR>

" Vimshell config
map <C-i> :VimShellTab<CR>
