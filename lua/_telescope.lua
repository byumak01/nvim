require('telescope').setup {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.9,
      height = 0.8,
      preview_cutoff = 120,
    },
    sorting_strategy = "ascending",
    prompt_prefix = "🔍 ",
    selection_caret = "➜ ",
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    preview = {
      hide_on_startup = false,
    },
    file_ignore_patterns = {
      "^.git/",    -- Ignore .git directory
      "^.vscode/", -- Ignore .vscode directory
      "^.idea/",   -- Ignore .idea directory
    },
  },
  pickers = {
    find_files = {
      hidden = true,    -- Show hidden files
      follow = true,    -- Follow symbolic links
      previewer = true, -- Enable file preview
    },
    live_grep = {
      hidden = true, -- Show hidden files
    },
    lsp_definitions = { theme = "ivy", previewer = true },
    lsp_references = { theme = "ivy", previewer = true },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}

require('telescope').load_extension('ui-select')

