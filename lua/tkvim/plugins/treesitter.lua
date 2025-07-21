-- ~/.config/nvim/lua/tkvim/plugins/tressitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "java",
        "javascript",
        "lua",
        "vim",
        "vimdoc",
        "c",
        "query"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = { "python", "c" }
      },
    })
  end
}

