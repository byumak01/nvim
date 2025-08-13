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
  { 'nyoom-engineering/oxocarbon.nvim'},
  { 'neovim/nvim-lspconfig' },  -- LSP configurations
  { 'hrsh7th/nvim-cmp' },       -- Autocompletion
  { 'hrsh7th/cmp-nvim-lsp' },   -- LSP completion source
  { 'L3MON4D3/LuaSnip' },       -- Snippet support
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }, -- Syntax highlighting
  { 'nvim-tree/nvim-tree.lua', dependencies = 'nvim-tree/nvim-web-devicons' }, -- File explorer
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } }, -- Fuzzy search
  { 'nvim-telescope/telescope-ui-select.nvim' }, -- Better UI for Telescope LSP
  { 'nvim-lualine/lualine.nvim' }, -- Status line
  { "Mofiqul/dracula.nvim" }

})

