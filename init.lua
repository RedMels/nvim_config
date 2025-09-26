-- Neovim Configuration Entry Point
-- ~/.config/nvim/init.lua

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.gui")

-- Load plugin management
require("plugins.lazy")

-- Load additional configurations
require("config.colorscheme")
