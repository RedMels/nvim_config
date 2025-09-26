-- Utility Functions
-- ~/.config/nvim/lua/utils/init.lua

local M = {}

-- Check if a plugin is loaded
function M.is_loaded(plugin)
  local loaded = package.loaded[plugin]
  return loaded and type(loaded) == "table"
end

-- Safe require that won't throw errors
function M.safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.notify("Error requiring " .. module .. "\n\n" .. result)
    return nil
  end
  return result
end

-- Get the root directory of the current project
function M.get_root()
  local root_patterns = { ".git", "lua", "package.json", "Cargo.toml", "pyproject.toml", "Makefile" }
  local path = vim.api.nvim_buf_get_name(0)
  
  if path == "" then
    return vim.loop.cwd()
  end
  
  path = vim.fs.dirname(path)
  local root = vim.fs.find(root_patterns, { path = path, upward = true })[1]
  
  if root then
    return vim.fs.dirname(root)
  end
  
  return vim.loop.cwd()
end

-- Toggle between light and dark theme
function M.toggle_theme()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end

-- Create a centered floating window
function M.create_centered_floating_window(width_ratio, height_ratio)
  width_ratio = width_ratio or 0.8
  height_ratio = height_ratio or 0.8
  
  local screen_w = vim.opt.columns:get()
  local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
  local window_w = screen_w * width_ratio
  local window_h = screen_h * height_ratio
  local window_w_int = math.floor(window_w)
  local window_h_int = math.floor(window_h)
  local center_x = (screen_w - window_w) / 2
  local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
  
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    row = center_y,
    col = center_x,
    width = window_w_int,
    height = window_h_int,
    style = "minimal",
    border = "rounded",
  })
  
  return { buf = buf, win = win }
end

-- Check if we're in a git repository
function M.is_git_repo()
  vim.fn.system("git rev-parse --is-inside-work-tree")
  return vim.v.shell_error == 0
end

-- Get git branch name
function M.get_git_branch()
  if not M.is_git_repo() then
    return ""
  end
  
  local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
  if vim.v.shell_error ~= 0 then
    return ""
  end
  
  return branch
end

return M
