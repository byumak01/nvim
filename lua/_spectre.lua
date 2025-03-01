vim.keymap.set('n', '<C-s>', function()
  require('spectre').open({
    is_insert_mode = false,  -- Open in normal mode
    is_open_target_win = true  -- Open in a new window (right-side)
  })
end, { noremap = true, silent = true, desc = 'Open Spectre on the right' })

