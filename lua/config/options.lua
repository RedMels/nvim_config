-- Neovim Options Configuration
-- ~/.config/nvim/lua/config/options.lua

local opt = vim.opt

-- General
opt.mouse = "a"                       -- Enable mouse support
opt.clipboard = "unnamedplus"         -- Use system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect"

-- UI
opt.number = true                     -- Show line numbers
opt.relativenumber = true             -- Show relative line numbers
opt.showmatch = true                  -- Highlight matching parenthesis
opt.foldmethod = "marker"             -- Enable folding (default 'foldmarker')
opt.colorcolumn = "80"                -- Line length marker at 80 columns
opt.splitright = true                 -- Vertical split to the right
opt.splitbelow = true                 -- Horizontal split to the bottom
opt.ignorecase = true                 -- Ignore case letters when search
opt.smartcase = true                  -- Ignore lowercase for the whole pattern
opt.linebreak = true                  -- Wrap on word boundary
opt.termguicolors = true              -- Enable 24-bit RGB colors
opt.laststatus = 3                    -- Set global statusline

-- Tabs, indent
opt.expandtab = true                  -- Use spaces instead of tabs
opt.shiftwidth = 4                    -- Shift 4 spaces when tab
opt.tabstop = 4                       -- 1 tab == 4 spaces
opt.smartindent = true                -- Autoindent new lines

-- Memory, CPU
opt.hidden = true                     -- Enable background buffers
opt.history = 100                     -- Remember N lines in history
opt.lazyredraw = true                 -- Faster scrolling
opt.synmaxcol = 240                   -- Max column for syntax highlight
opt.updatetime = 250                  -- ms to wait for trigger an event

-- Font configuration
opt.guifont = "FiraCode Nerd Font Mono:h14"  -- Set GUI font
-- Enable font ligatures and better font rendering
if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode = "railgun"
end

-- Startup
opt.shortmess:append("c")             -- Don't show redundant messages from ins-completion-menu
opt.shortmess:append("W")             -- Don't show "written" when writing
opt.shortmess:append("I")             -- Don't show intro message when starting vim
