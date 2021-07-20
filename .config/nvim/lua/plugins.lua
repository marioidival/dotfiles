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
    use { 'nvim-telescope/telescope-dap.nvim' }
    use { 'hrsh7th/nvim-compe' }
    use { 'b3nj5m1n/kommentary' }
    use {
      'hoob3rt/lualine.nvim',
      requires = {{'kyazdani42/nvim-web-devicons', opt = true}}
    }

    -- Git
    use { 'f-person/git-blame.nvim' }
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- colorscheme
    use { 'marko-cerovac/material.nvim' }
end)
