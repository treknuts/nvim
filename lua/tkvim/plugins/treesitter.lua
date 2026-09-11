-- ~/.config/nvim/lua/tkvim/plugins/tressitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,

  config = function()
    local ensure_installed = {
      "java",
      "javascript",
      "lua",
      "vim",
      "vimdoc",
      "c",
      "query",
      "markdown",
    }

    require("nvim-treesitter").install(ensure_installed)

    local indent_disabled = { python = true, c = true }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = ensure_installed,
      callback = function(args)
        vim.treesitter.start()

        if not indent_disabled[args.match] then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
