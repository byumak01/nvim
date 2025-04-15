-- General Settings
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Relative line numbers
vim.o.mouse = 'a' -- Enable mouse support
vim.o.ignorecase = true -- Case-insensitive search
vim.o.smartcase = true -- Case-sensitive if uppercase present
vim.o.termguicolors = true -- Enable true colors
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.cmd([[colorscheme gruvbox]]) -- Set nightfox theme

-- Tab Settings
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.shiftwidth = 2 -- Number of spaces per indent level
vim.o.tabstop = 2 -- Number of spaces a tab counts for
vim.o.softtabstop = 2 -- Number of spaces for <Tab> in insert mode

-- UI Settings
vim.o.cursorline = true -- Highlight the current line
vim.o.signcolumn = "yes" -- Always show sign column
vim.o.scrolloff = 8 -- Keep 8 lines visible when scrolling
vim.api.nvim_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })


-- Performance
vim.o.updatetime = 250 -- Faster updates (affects CursorHold events)
vim.o.timeoutlen = 300 -- Faster key sequences

