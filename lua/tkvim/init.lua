-- ~/.config/nvim/lua/tkvim/init.lua

vim.g.mapleader = " "

require("tkvim.lazy_init")
require("tkvim.keybinds")
require("tkvim.set")

-- setup must be called before loading
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
