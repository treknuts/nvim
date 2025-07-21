-- ~/.config/nvim/lua/tkvim/init.lua

vim.g.mapleader = " "

require("tkvim.lazy_init")
require("tkvim.keybinds")
require("tkvim.set")

-- Customize theme
require("catppuccin").setup({ flavour = "mocha" })

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
