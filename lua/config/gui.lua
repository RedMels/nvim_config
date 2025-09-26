-- GUI Configuration
-- ~/.config/nvim/lua/config/gui.lua

-- This file contains GUI-specific settings for Neovim when running in GUI mode
-- (like Neovide, VimR, or other GUI clients)

local opt = vim.opt
local g = vim.g

-- Font settings
opt.guifont = "FiraCode Nerd Font Mono:h14"

-- Enable font ligatures (if supported by GUI)
g.neovide_cursor_vfx_mode = "railgun"

-- GUI-specific options
if g.neovide then
  -- Neovide-specific settings
  g.neovide_transparency = 0.95
  g.neovide_cursor_animation_length = 0.05
  g.neovide_cursor_trail_size = 0.3
  g.neovide_cursor_antialiasing = true
  g.neovide_cursor_animate_in_insert_mode = true
  g.neovide_cursor_animate_command_line = true
  g.neovide_scroll_animation_length = 0.3
  g.neovide_remember_window_size = true
  g.neovide_refresh_rate = 60
  g.neovide_confirm_quit = true
  g.neovide_input_macos_alt_is_meta = true
  
  -- Font settings for Neovide
  opt.linespace = 0
  
  -- Keymaps for Neovide
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  
  -- Allow clipboard copy paste in neovim
  keymap("", "<D-v>", "+p<CR>", opts)
  keymap("!", "<D-v>", "<C-R>+", opts)
  keymap("t", "<D-v>", "<C-R>+", opts)
  keymap("v", "<D-v>", "<C-R>+", opts)
  keymap("", "<D-c>", '"+y<CR>', opts)
end

-- Terminal GUI settings
if vim.fn.exists("g:fvim_loaded") == 1 then
  -- FVim-specific settings
  g.fvim_cursor_vfx = "railgun"
  g.fvim_background_composition = "blur"
end

-- VimR settings
if vim.fn.exists("g:vimr") == 1 then
  -- VimR-specific settings
  opt.title = true
  opt.titlestring = "VimR"
end

-- Function to adjust font size
local function adjust_font_size(delta)
  local current_font = vim.o.guifont
  local font_name, font_size = current_font:match("^(.+):h(%d+)")
  
  if font_name and font_size then
    local new_size = tonumber(font_size) + delta
    if new_size >= 8 and new_size <= 72 then
      vim.o.guifont = font_name .. ":h" .. new_size
    end
  end
end

-- Keymaps for font size adjustment
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<D-+>", function() adjust_font_size(1) end, opts)
keymap("n", "<D-->", function() adjust_font_size(-1) end, opts)
keymap("n", "<D-0>", function() vim.o.guifont = "FiraCode Nerd Font Mono:h14" end, opts)

-- Also support Ctrl+ for non-Mac systems
keymap("n", "<C-+>", function() adjust_font_size(1) end, opts)
keymap("n", "<C-->", function() adjust_font_size(-1) end, opts)
keymap("n", "<C-0>", function() vim.o.guifont = "FiraCode Nerd Font Mono:h14" end, opts)
