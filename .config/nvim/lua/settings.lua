local utils = require "utils"
local indent = 4

utils.opts('b', 'expandtab', true)
utils.opts('b', 'shiftwidth', indent)
utils.opts('b', 'tabstop', indent)

utils.opts('w', 'relativenumber', true)

utils.opts('o', 'completeopt', 'menuone,noinsert,noselect')
utils.opts('o', 'clipboard', 'unnamedplus')
utils.opts('o', 'smartindent', true)
utils.opts('o', 'smartcase', true)
utils.opts('o', 'laststatus', 2)
-- utils.opts('o', 'noswapfile', true)
-- utils.opts('o', 'nobackup', true)
-- utils.opts('o', 'nowritebackup', true)

vim.cmd 'syntax enable'
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
-- vim.cmd 'colorscheme substrata'
vim.g.material_style = 'lighter'
vim.cmd 'colorscheme material'
