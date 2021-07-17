return require('packer').startup(function()
    use { 'wbthomason/packer.nvim', opt = true }
    use { 'tpope/vim-fugitive' }

    use { 'neovim/nvim-lspconfig' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}
    }

    use { 'nvim-lua/completion-nvim' }
    use { 'glepnir/lspsaga.nvim' }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    use { 'preservim/nerdtree' }
    use { 'phaazon/hop.nvim' }
    use { 'arzg/vim-substrata' }
    use { 'mfussenegger/nvim-dap' }
    use { 'hrsh7th/nvim-compe' }
    use { 'hrsh7th/nvim-compe' }
end)
