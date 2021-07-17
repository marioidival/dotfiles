vim.g.mapleader = ','

local fn = vim.fn
local execute = vim.api.nvim_command

-- neovim settings like smartabs, relativenumber
require('settings')

-- auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end
execute 'packadd packer.nvim'

-- Auto compile when there was modification on plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

-- my keybinds
require('keybindings')

-- my plugins
require('plugins')

-- my general configurations
require('general')
