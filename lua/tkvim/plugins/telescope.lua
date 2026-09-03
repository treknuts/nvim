-- ~/.config/nvim/lua/tkvim/plugins/telescope.lua

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  module = "telescope",

  config = function()
    require("telescope").setup({})

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Git Files" })
    vim.keymap.set("n", "<leader>fr", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true <CR>")

    -- Toggle between Tapestry Java and TML files
    -- ft for "Find Tapestry"
    vim.keymap.set("n", "<leader>ft", function()
      local relative_path_no_ext = vim.fn.expand("%:.:r")
      local file_extension = vim.fn.expand("%:e")
      local not_file_extension = (file_extension == "java") and "tml" or "java"

      if file_extension == "java" then
        relative_path_no_ext = relative_path_no_ext:gsub("main/java/", "main/resources/")
      elseif file_extension == "tml" then
        relative_path_no_ext = relative_path_no_ext:gsub("main/resources/", "main/java/")
      end

      local search_target = relative_path_no_ext .. "." .. not_file_extension

      if vim.fn.filereadable(search_target) == 1 then
        vim.cmd("edit " .. search_target)
      else
        builtin.find_files({
          default_text = "^" .. vim.fn.expand("%:t:r") .. "." .. not_file_extension,
        })
      end
    end, { desc = "Tapestry Java/TML" })

    vim.keymap.set("n", "<leader>pws", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set("n", "<leader>pWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
  end,
}
