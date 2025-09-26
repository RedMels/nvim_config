-- Colorscheme Configuration
-- ~/.config/nvim/lua/config/colorscheme.lua

-- Set colorscheme with fallback
local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found! Falling back to default.")
  vim.cmd.colorscheme("default")
end

-- Optional: Additional colorscheme-specific configurations
-- These will only apply if the colorscheme is successfully loaded

-- Example configurations (uncomment as needed):
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
