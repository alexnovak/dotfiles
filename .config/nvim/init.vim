" My configs
map <C-p> gt
map <C-n> gT


"colorscheme ir_black
set background=dark

" Leader
let mapleader = ','

" NerdTree Config
nnoremap <Leader>j :NERDTreeToggle<CR>

" I like line numbers
set rnu nu

" Column signs set by many plugins, prevents uglyness
set signcolumn=no
hi clear SignColumn
hi clear TabLineFill

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Literally just because I hate default spacing in yaml. 

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType js setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Terraform config
let g:terraform_fmt_on_save=1

lua <<EOF
require('anovak')
EOF

nnoremap <space>q :q<CR>
