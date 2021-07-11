syntax enable
syntax on
filetype indent plugin on
let mapleader=","
set relativenumber
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,node_modules,target,
set noswapfile
set backspace=indent,eol,start
set nobackup
set nowritebackup
set signcolumn=yes
set completeopt = "menuone,noselect"
set smartindent
set tabstop=4 softtabstop=4

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'

" Auto completion
Plug 'hrsh7th/nvim-compe'

call plug#end()
let g:python3_host_prog='/home/kakarotto/.asdf/shims/python'

" mapping
imap hh <esc>
nnoremap ; :                                                                                               
nnoremap : ;                                                                                               
                                                                                                         
noremap <up> :echoerr 'use k to up'<CR>                                                                    
noremap <down> :echoerr 'use j to down'<CR>                                                                
noremap <left> :echoerr 'use h to left'<CR>                                                                
noremap <right> :echoerr 'use l to right'<CR>                                                              
                                                                                                         
inoremap <up> <ESC>:echoerr 'use k to up'<CR>                                                              
inoremap <down> <ESC>:echoerr 'use j to down'<CR>                                                          
inoremap <left> <ESC>:echoerr 'use h to left'<CR>                                                          
inoremap <right> <ESC>:echoerr 'use l to right'<CR>                                                        

" auto format
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)

lua << EOF
EOF
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc

lua << EOF
require'lspsaga'.init_lsp_saga()
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
}
EOF

lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(_client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

lua << EOF

EOF

set completeopt=menuone,noinsert,noselect

call sign_define("LspDiagnosticsSignError", {"text" : ">>", "texthl" : "LspDiagnosticsSignError"})
call sign_define("LspDiagnosticsSignWarning", {"text" : "⚠", "texthl" : "LspDiagnosticsSignWarning"})
call sign_define("LspDiagnosticsSignInformation", {"text" : "", "texthl" : "LspDiagnosticsSignInformation"})
call sign_define("LspDiagnosticsSignHint", {"text" : "", "texthl" : "LspDiagnosticsSignWarning"})

" Telescope: find files
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" diagnostic-nvim
let g:diagnostic_level = 'Warning'
let g:diagnostic_enable_virtual_text = 0
let g:diagnostic_virtual_text_prefix = ' '
let g:diagnostic_trimmed_virtual_text = 0
let g:diagnostic_insert_delay = 1

" completion-nvim
let g:completion_enable_auto_hover = 1
let g:completion_auto_change_source = 1
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_auto_paren = 0
let g:completion_timer_cycle = 80
let g:completion_auto_change_source = 1
let g:completion_matching_ignore_case = 1

let g:completion_chain_complete_list = {
    \ 'default' : {
    \   'default': [
    \       {'complete_items': ['snippet', 'lsp']},
    \],
    \   'comment': [],
    \   'string' : [
    \       {'complete_items': ['path']}
    \]
    \   },
    \ 'tex' : [
    \     {'complete_items': ['vimtex', 'lsp']}, 
    \   ],
    \ 'verilog': {
    \   'default': [
    \       {'complete_items': ['snippet', 'buffer']}
    \]
    \   },
    \ 'markdown.pandoc': {
    \   'default': [
    \       {'complete_items': ['snippet']}
    \]
    \   }
    \}

" Nerd Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
