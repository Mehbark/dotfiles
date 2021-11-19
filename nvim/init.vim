" Vim-plug
call plug#begin("~/.vim/plugged")

Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'blueyed/vim-diminactive'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/gruvbox-material'
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-highlightedyank'

call plug#end()

" Line number settings
set number relativenumber
" Absolute in insert, relative in normal.
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Leader settings
let mapleader = ";"
let maplocalleader = ","

" Delete the current line, then paste it below where we are right now
nnoremap <leader>- ddp
" Move it up instead
nnoremap <leader>_ ddkP

" Map ctrl+u to convert the current word to uppercase
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU

" Color scheme stuff
set background=dark
let g:gruvbox_material_background = "medium"
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material

" Set yank highlight time to something reasonable
let g:highlightedyank_highlight_duration = 200

" Misc mappings (to make it stress-free to add random ones)
" Edit vim config
nnoremap <leader>ev :vsplit $MYVIMRC<cr><c-w>l
" Reload vim config
nnoremap <leader>sv :source $MYVIMRC<cr>
