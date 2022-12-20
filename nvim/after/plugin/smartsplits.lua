vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Open NVimTree' })

-- Better window navigation
vim.keymap.set('n', '<C-h>', function() require('smart-splits').move_cursor_left() end, { desc = 'Move to left split' })
vim.keymap.set('n', '<C-j>', function() require('smart-splits').move_cursor_down() end, { desc = 'Move to below split' })
vim.keymap.set('n', '<C-k>', function() require('smart-splits').move_cursor_up() end, { desc = 'Move to above split' })
vim.keymap.set('n', '<C-l>', function() require('smart-splits').move_cursor_right() end, { desc = 'Move to right split' })

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', function() require('smart-splits').resize_up() end, { desc = 'Resize split up' })
vim.keymap.set('n', '<C-Down>', function() require('smart-splits').resize_down() end, { desc = 'Resize split down' })
vim.keymap.set('n', '<C-Left>', function() require('smart-splits').resize_left() end, { desc = 'Resize split left' })
vim.keymap.set('n', '<C-Right>', function() require('smart-splits').resize_right() end, { desc = 'Resize split right' })
