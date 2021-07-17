local U = {}
local scopes = {
    o = vim.o,
    b = vim.bo,
    w = vim.wo,
}

U.opts = function(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

U.set_keybinds = function(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return U
