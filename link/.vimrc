set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fireplace'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-classpath'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/paredit.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'derekwyatt/vim-scala'
Bundle 'bling/vim-airline'


set laststatus=2
let g:airline_theme='dark'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
" let g:airline_branch_prefix = '⎇ '
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇ '
let g:airline_section_y = ""
let g:airline_section_x = ""

filetype plugin indent on

syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set title

" CLJ Rainbow parens config
" ========================
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" =======================


:set colorcolumn=80        " highlight column after 'textwidth'
" :set colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'
:highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" other colors should respect bg color
set background=dark

" Search helpers
set incsearch
set hlsearch
set ignorecase
set smartcase

" sgalkin tips
let g:ctrlp_working_path_mode = '0'
set wildignore+=*.o,*.obj,*.class,*.jar,.git,vendor,public/system,checkouts/**
" Hide buffers when they are abandoned
set hidden
" For copy/paste
set clipboard=unnamed

" show whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" disable arrow keys, because apparently i'm not being brave enough
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

autocmd FileType clojure nnoremap <buffer> <localleader>e :Eval (clojure.repl/pst)<CR>
autocmd FileType clojure nnoremap <buffer> <localleader>p :Eval (clojure.pprint/pp)<CR>

