require("toggleterm").setup({
  size = 10,
  open_mapping = [[<F7>]],
  shading_factor = 2,
  direction = "float",
  float_opts = {
    border = "curved",
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', { desc = 'Open NVimTree' })
vim.keymap.set('n', '<leader>gg', ':TermExec cmd="lazygit"<CR>', { desc = 'ToggleTerm lazygit' })
-- require("toggleterm.terminal").Terminal:new(opts)
vim.keymap.set('n', '<leader>tl', function() require("toggleterm.terminal").Terminal:new({cmd="lazygit"}) end, { desc = 'ToggleTerm lazygit' })
