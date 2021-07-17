local utils = require('utils')

utils.set_keybinds('n', '<C-Space>', '<cmd>noh<cr>')
utils.set_keybinds('i', 'hh', '<esc>')
utils.set_keybinds('n', ';', ':')
utils.set_keybinds('n', ':', ';')
utils.set_keybinds('n', '<up>', '<esc><cmd>echoerr "use k to up"')
utils.set_keybinds('n', '<down>', '<esc><cmd>echoerr "use j to down"')
utils.set_keybinds('n', '<left>', '<esc><cmd>echoerr "use h to left"')
utils.set_keybinds('n', '<right>', '<esc><cmd>echoerr "use h to right"')

utils.set_keybinds('i', '<up>', '<esc><cmd>echoerr "use k to up"')
utils.set_keybinds('i', '<down>', '<esc><cmd>echoerr "use j to down"')
utils.set_keybinds('i', '<left>', '<esc><cmd>echoerr "use h to left"')
utils.set_keybinds('i', '<right>', '<esc><cmd>echoerr "use h to right"')
utils.set_keybinds('n', '<tab>', 'gt')
utils.set_keybinds('n', '<s-tab>', 'gT')
-- window moving
utils.set_keybinds('n', '<leader>l', '<c-w><c-l>')
utils.set_keybinds('n', '<leader>h', '<c-w><c-h>')
utils.set_keybinds('n', '<leader>k', '<c-w><c-k>')
utils.set_keybinds('n', '<leader>j', '<c-w><c-j>')

-- TODO: window sizing
