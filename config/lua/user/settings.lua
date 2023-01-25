-- OPTIONS

vim.o.number = true          -- show line numbers
vim.o.relativenumber = true  -- show line numbers relative to the current line
vim.o.signcolumn = 'yes:1'   -- sign column on the left side of the screen
vim.o.list = true            -- display special characters for white spaces

vim.o.smartindent = true     -- automatically adjusts indentation
vim.o.tabstop = 4            -- number of spaces for a tab character
vim.o.shiftwidth = 4         -- number of spaces for each step of (auto)indent
vim.o.shiftround = true      -- shift commands round indent to multiples of ’shiftwidth’.

vim.o.termguicolors = true   -- enable color support if terminal supports it
vim.o.hidden = true          -- allows to have multiple versions of the same
                             --  buffer loaded simultaneously

vim.o.ignorecase = true      -- case-insensitive search
vim.o.smartcase = true       -- case-sensitive search if any uppercase letter
                             --  is used in the search pattern

vim.o.scrolloff = 4          -- number of lines to keep above and below the
                             --  cursor when scrolling
vim.o.mouse = 'a'            -- mouse support in all modes, allows the use of
                             --  the mouse to interact with Neovim


-- AUTOCOMMANDS

local autocmd = vim.api.nvim_create_autocmd

-- Example 1: highlight yank for 250ms
autocmd('TextYankPost', {
    pattern='*',
    callback = function ()
        vim.highlight.on_yank({ on_visual = false, timeout = 250 })
    end
})

-- Example 2: toggle hiding invisible chars on insert
autocmd('InsertEnter', {
    pattern='*',
    callback = function () vim.wo.list = false end
})
autocmd('InsertLeave', {
    pattern='*',
    callback = function () vim.wo.list = true end
})

-- Example 3: use normal tabs instead of spaces in c-like files
autocmd('FileType', {
    pattern = { 'c', 'cpp', 'sh', 'make' },
    callback = function() vim.o.expandtab = false end
})

