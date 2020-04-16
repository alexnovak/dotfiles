" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'hashivim/vim-terraform'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'

call plug#end()

" My configs
map <C-p> gt
map <C-n> gT


colorscheme ir_black
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


" Rust config

let g:rustfmt_autosave = 1

" Go config
let g:go_fmt_command = "goimports"


" Languageserver config
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'go': ['go-langserver', '-gocodecompletion=true', 'lint-tool=golint'],
    \ 'rust': ['rls'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

nnoremap  <C-F> :FZF<CR>
