-- ~/.config/nvim/lua/tkvim/keybinds.lua

-- Move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- refactor whatever your cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Starts and toggles the same terminal session
vim.keymap.set("n", "<leader>tt", "<cmd>Floaterminal<CR>")
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
-- Vim motions between windows
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")

-- Organize java imports
vim.keymap.set("n", "<leader>ljo", '<cmd>lua require("jdtls").organize_imports()<CR>')

-- Barbar keybinds
vim.keymap.set("n", "<Tab>", "<cmd>BufferNext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>bq", "<cmd>BufferClose<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bca", "<cmd>BufferCloseAllButCurrent<CR>",
  { desc = "Close all buffers but the current buffer" })
vim.keymap.set("n", "<leader>bcp", "<cmd>BufferCloseAllButCurrentOrPinned<CR>",
  { desc = "Close all buffers but the current or pinned buffers" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferPick<CR>", { desc = "Pick a buffer" })
vim.keymap.set("n", "<leader>b.", "<cmd>BufferPin<CR>", { desc = "Pick a buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>:BufferOrderByBufferNumber<CR>", { desc = "Order buffers by number" })
vim.keymap.set("n", "<leader>bn", "<cmd>:BufferOrderByName<CR>", { desc = "Order buffers by name" })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
