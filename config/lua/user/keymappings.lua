
local set_keymap = vim.api.nvim_set_keymap

-- nerdtree
set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', {} )

-- line navigation
set_keymap('n', 'ö', '^', {} )   -- move cursor to the beginning of the line
set_keymap('n', 'ä', '$', {} )   -- move cursor to the end of the line
set_keymap('n', 'dä', 'd$', {} ) -- delete until the beginning of the line
set_keymap('n', 'dö', 'd^', {} ) -- delete until the end of the line
set_keymap('n', 'yä', 'y$', {} ) -- yank/copy until the beginning of the line
set_keymap('n', 'yö', 'y^', {} ) -- yank/copy until the end of the line
set_keymap('v', 'ö', '^', {} )   -- select until the beginning of the line
set_keymap('v', 'ä', '$', {} )   -- select until the end of the line

-- switch to next tab
set_keymap('n', '<Tab>', 'gt', {} )

-- switch to previous tab
set_keymap('n', '<S-Tab>', 'gT', {} )

-- launch terminal in new window
set_keymap('n', '<F1>','<C-w>s<C-w>j:terminal<CR><C-w>9-i', {} )

-- close the terminal
set_keymap('t', '<F1>','<C-\\><C-n>:q!<CR>', {} )
