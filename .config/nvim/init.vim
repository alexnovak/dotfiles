" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree'
Plug 'neovim/nvim-lspconfig'
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
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jdonaldson/vaxe'

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

lua <<EOF
local opts = { noremap=true, silent=true }
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end
require'lspconfig'.rust_analyzer.setup{on_attach = on_attach}
EOF

nnoremap <space>q :q<CR>
nnoremap  <C-F> :FZF<CR>
