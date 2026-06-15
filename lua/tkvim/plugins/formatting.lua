return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        html = { "prettier" },
        tml = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        java = { "google-java-format" },
        lua = { "stylua" },
        kotlin = { "ktlint" },
        go = { "goimports" },
        sql = { "sqlfluff" },
        xml = { "xmlformatter" },
      },
      formatters = {
        sqlfluff = {
          command = vim.fn.stdpath("data") .. "/mason/bin/sqlfluff",
          args = {
            "format",
            "-",
          },
          stdin = true,
          exit_codes = { 0, 1 },
        },
        prettier = {
          args = { "--parser", "html", "--stdin-filepath", "$FILENAME" },
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 5000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 5000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
