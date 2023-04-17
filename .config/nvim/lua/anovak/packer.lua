vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'scrooloose/nerdtree'
    use 'easymotion/vim-easymotion'
    use 'jiangmiao/auto-pairs'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        --config = function()
        --    vim.cmd('colorscheme rose-pine-moon')
        --end
    })

    use({
        "catppuccin/nvim",
        as = 'catppuccin',
        config = function()
            vim.cmd('colorscheme catppuccin-mocha')
        end
    })

    use({
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {
                icons = false
            }
        end
    })

    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = "v1.x",
        requires = {
            -- LSP support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
end)
