require('nvim-treesitter.configs').setup({
    -- A list of parser names
    ensure_installed = { 'lua', 'python', 'latex', 'r', 'bash', 'make'},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    highlight = {
        enable = true,
   },
})
