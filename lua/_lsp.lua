local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- 1. Enable capabilities for autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

---
-- 2. LSP Server Configuration (using new vim.lsp.config API)
---

-- **A. Servers using only the default setup (plus capabilities)**
local default_servers = { 'pyright', 'ts_ls', 'html', 'cssls', 'lua_ls' }

for _, lsp in ipairs(default_servers) do
    vim.lsp.config(lsp, {
        capabilities = capabilities,
    })
end

-- **B. Servers requiring custom options (clangd)**
vim.lsp.config('clangd', {
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
    },
    settings = {
        -- This section defines the ClangFormat rules used by clangd.
        -- These rules are applied when you use a Neovim auto-format command
        -- (like ':LspFormat' or an auto-save format plugin).
        clangd = {
            -- Use a well-known base style
            -- Common choices are 'LLVM', 'Google', 'Chromium', 'Microsoft', or 'WebKit'
            Style = "Google",
            -- Overrides the base style for specific options
            -- NOTE: 'UseTab' must be 'Always' or 'ForIndentation' to use 'TabWidth'.
            UseTabs = "Never",
            -- Enforces a tab width of 4 spaces
            IndentWidth = 4,
            -- Ensures the opening parenthesis of a function (like the example you provided)
            -- is placed on the next line.
            -- This ensures consistency like:
            -- function()
            -- {
            --     ...
            -- }
            BreakBeforeBraces = "Allman", -- This style is often used for this kind of brace placement.

            -- Other useful settings for C++
            AllowShortFunctionsOnASingleLine = "None",
            ColumnLimit = 80, -- Keep lines readable
        },
    },
})

-- Enable LSP servers
vim.lsp.enable(default_servers)
vim.lsp.enable('clangd')


vim.api.nvim_create_user_command('Format', function(opts)
    -- Uses the default behavior, usually sets async = true
    vim.lsp.buf.format()
end, { desc = 'Format code using LSP' })

---
-- 4. Diagnostic Configuration
---
vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    signs = true,
    update_in_insert = false,
})
