local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_window(opts)
  opts = opts or {}

  -- Get editor dimensions
  local ui = vim.api.nvim_list_uis()[1]
  local screen_width = ui.width
  local screen_height = ui.height

  -- Calculate default dimensions (80% of screen)
  local default_width = math.floor(screen_width * 0.8)
  local default_height = math.floor(screen_height * 0.8)

  -- Set dimensions from options or use defaults
  local width = opts.width or default_width
  local height = opts.height or default_height

  -- Calculate centered position
  local col = math.floor((screen_width - width) / 2)
  local row = math.floor((screen_height - height) / 2)

  -- Create buffer for the floating window
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  -- Configure window options
  local win_opts = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_opts)

  -- Set buffer options
  -- vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  -- vim.api.nvim_buf_set_option(buf, "filetype", opts.filetype or "")

  -- Return buffer and window handles
  return { buf = buf, win = win }
end

-- Example usage:
-- Basic floating window (80% of screen)
-- local buf, win = create_floating_window()

vim.api.nvim_create_user_command("Floaterminal", function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.term()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end, {})
