# Neovim Configuration

A modern Neovim configuration written in Lua with a focus on simplicity, performance, and extensibility.

## Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── config/              # Core configuration
│   │   ├── autocmds.lua     # Auto commands
│   │   ├── keymaps.lua      # Key mappings
│   │   ├── options.lua      # Neovim options
│   │   └── colorscheme.lua  # Color scheme settings
│   ├── plugins/             # Plugin configurations
│   │   ├── lazy.lua         # Plugin manager setup
│   │   ├── ui.lua          # UI-related plugins
│   │   ├── editor.lua      # Editor enhancement plugins
│   │   ├── coding.lua      # Coding-related plugins
│   │   └── lsp.lua         # LSP configuration
│   └── utils/               # Utility functions
│       └── init.lua         # Helper functions
└── README.md                # This file
```

## Features

### Core Features
- **Modern Lua configuration** - Clean, organized, and maintainable
- **Lazy loading** - Fast startup times with lazy.nvim
- **LSP support** - Full language server protocol integration
- **Autocompletion** - Smart completion with nvim-cmp
- **Syntax highlighting** - Treesitter-powered highlighting
- **File explorer** - nvim-tree for file management
- **Fuzzy finding** - Telescope for searching files/text
- **Git integration** - Gitsigns for git status in editor

### Key Mappings (Leader: Space)

#### File Operations
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>x` - Save and quit

#### File Navigation
- `<leader>e` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags

#### Window Management
- `<C-h/j/k/l>` - Navigate windows
- `<leader>v` - Vertical split
- `<leader>s` - Horizontal split
- `<C-Up/Down/Left/Right>` - Resize windows

#### Buffer Management
- `<S-l>` - Next buffer
- `<S-h>` - Previous buffer

#### LSP Features
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `gr` - Show references
- `K` - Show documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `[d` / `]d` - Previous/Next diagnostic

#### Go Development
- `<leader>gt` - Run Go tests
- `<leader>gr` - Run Go program
- `<leader>gb` - Build Go program
- `<leader>gi` - Install Go program

#### Other
- `<leader>h` - Clear search highlighting
- `gcc` - Toggle line comment
- `<leader>mp` - Format code

## Plugin Categories

### UI Plugins
- **catppuccin** - Beautiful color scheme
- **lualine** - Status line
- **nvim-tree** - File explorer
- **bufferline** - Buffer tabs
- **alpha-nvim** - Dashboard
- **indent-blankline** - Indent guides
- **which-key** - Keybinding help

### Editor Plugins
- **telescope** - Fuzzy finder
- **nvim-treesitter** - Syntax highlighting
- **nvim-autopairs** - Auto pair brackets
- **Comment.nvim** - Easy commenting
- **gitsigns** - Git integration
- **nvim-surround** - Surround text objects
- **better-escape** - Better escape sequences

### Coding Plugins
- **nvim-cmp** - Autocompletion
- **conform.nvim** - Code formatting
- **nvim-lint** - Linting support

### LSP Plugins
- **mason.nvim** - LSP server management
- **nvim-lspconfig** - LSP configuration
- **mason-lspconfig** - Bridge mason and lspconfig

## Installation

1. Make sure you have Neovim 0.9+ installed
2. Backup your existing config (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```
3. Clone or copy this configuration to `~/.config/nvim`
4. Open Neovim - plugins will be automatically installed on first launch
5. Run `:Mason` to ensure all LSP servers and tools are installed

## Customization

- **Add new plugins**: Create files in `lua/plugins/` directory
- **Modify keymaps**: Edit `lua/config/keymaps.lua`
- **Change options**: Edit `lua/config/options.lua`
- **Add custom functions**: Use `lua/utils/init.lua`

## Language Support

The configuration is optimized for:
- **Go**: Full Go development with gopls, gofumpt, golangci-lint, and go.nvim
- **Web Development**: JavaScript, TypeScript, HTML, CSS with proper formatting and linting
- **Configuration**: Lua support for Neovim configuration

Additional language servers can be easily added through Mason.

## Requirements

- Neovim >= 0.9.0
- Git (for plugin management)
- A Nerd Font (for icons)
- ripgrep (for telescope live_grep)
- Node.js (for some language servers)

## Troubleshooting

- If plugins don't load, try `:Lazy sync`
- For LSP issues, run `:Mason` and ensure servers are installed
- Check `:checkhealth` for system dependencies
- Use `:Lazy profile` to diagnose startup performance

Enjoy your new Neovim setup! 🎉
