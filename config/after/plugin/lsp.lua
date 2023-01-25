-- setup LSP server plugins for automatic installation of specified language servers
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true
})

-- use an on_attach function to only map the following keys after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    local function buf_set_keymap(mode, new_keys, old_keys) vim.api.nvim_buf_set_keymap(bufnr, mode, new_keys, old_keys, {}) end
    -- most common lsp functions
    buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
    buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
    buf_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
    buf_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
    buf_set_keymap('n', '<space>e', ':lua vim.diagnostic.open_float()<CR>')
    buf_set_keymap('n', ']d', ':lua vim.diagnostic.goto_next()<CR>')
    buf_set_keymap('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>')
    buf_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
    buf_set_keymap('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>')
    buf_set_keymap('n', '<space>rn', ':lua vim.lsp.buf.rename()<CR>')
    buf_set_keymap('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>')
    buf_set_keymap('n', '<space>f', ':lua vim.lsp.buf.formatting()<CR>')
end

-- add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- LSP client configuration using lspconfig

-- specify language servers for installation and configuration
-- language servers:
-- LaTeX: 'texlab', Python: 'jedi_language_server', R: 'r_language_server'
local servers = { 'texlab', 'jedi_language_server', 'r_language_server'}

-- enable language servers with the additional completion capabilities offered by nvim-cmp
local lspconfig = require('lspconfig')
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- prioritise completion suggestions coming from the LSP or buffer
local cmp = require('cmp')
cmp.setup {
  sources = {
      { name = 'nvim_lsp', max_item_count = 20, priority_weight = 100 },
      { name = 'buffer', priority_weight = 70, keyword_length = 4 },
  },
}
