local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Core Features
  { 'neovim/nvim-lspconfig' },  -- LSP configurations
  { 'hrsh7th/nvim-cmp' },       -- Autocompletion
  { 'hrsh7th/cmp-nvim-lsp' },   -- LSP completion source
  { 'L3MON4D3/LuaSnip' },       -- Snippet support
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }, -- Syntax highlighting
  { 'nvim-tree/nvim-tree.lua', dependencies = 'nvim-tree/nvim-web-devicons' }, -- File explorer
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } }, -- Fuzzy search
  { 'nvim-telescope/telescope-ui-select.nvim' }, -- Better UI for Telescope LSP
  { 'nvim-lualine/lualine.nvim' }, -- Status line
  { 'EdenEast/nightfox.nvim' }, -- Theme

  -- Debugging
  { 'nvim-neotest/nvim-nio' },
  { 'williamboman/mason.nvim',  build = ":MasonUpdate"}, -- Ensure Mason updates automatically
  { 'mfussenegger/nvim-dap' },  -- Debug Adapter Protocol
  { 'rcarriga/nvim-dap-ui' },   -- Debugging UI
  { 'theHamsta/nvim-dap-virtual-text' }, -- Show variables inline
  { 'jay-babu/mason-nvim-dap.nvim', dependencies = { "mason.nvim", "nvim-dap" } } -- Install Debuggers
})

