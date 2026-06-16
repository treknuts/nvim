return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = false,
        -- Show things in tree that I need to see, but are in gitignore
        exclude = {
          "jetty-env.xml",
          ".env",
        },
      },
    })
  end,
}
