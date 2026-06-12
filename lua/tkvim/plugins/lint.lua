return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Configure linters for different file types
    lint.linters_by_ft = {
      sql = { "sqlfluff" },
      python = { "pylint", "mypy" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      -- Add more file types as needed
    }

    -- Create autocmd group for linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Auto-lint on these events
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        -- Only lint if the buffer is modifiable and not empty
        if vim.opt_local.modifiable:get() and vim.fn.getfsize(vim.api.nvim_buf_get_name(0)) > 0 then
          lint.try_lint()
        end
      end,
    })

    -- Manual linting keymap (optional)
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })

    -- Customize sqlfluff linter if needed
    lint.linters.sqlfluff.cmd = "sqlfluff"
    lint.linters.sqlfluff.args = {
      "lint",
      "--format=json",
      "--annotation-level=info",
      "--disable-progress-bar",
    }

    -- Optional: Configure sqlfluff with custom config
    -- You can create ~/.sqlfluff config file or specify inline
    lint.linters.sqlfluff.args = {
      "lint",
      "--format=json",
      "--annotation-level=info",
      "--disable-progress-bar",
      "--dialect=postgres", -- or mysql, sqlite, etc.
    }
  end,
}
