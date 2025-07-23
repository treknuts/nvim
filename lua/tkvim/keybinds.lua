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
vim.keymap.set("n", "<Tab>", "<cmd>BufferNext<CR>")
-- motions between windows end
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferPrevious<CR>")
-- Quit Buffer
vim.keymap.set("n", "<leader>qb", "<cmd>BufferClose<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
