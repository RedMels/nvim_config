-- Go-specific Plugins Configuration
-- ~/.config/nvim/lua/plugins/go.lua

return {
  -- Go development plugin
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        -- disable vim-go style text objects
        textobjects = false,
        -- auto commands
        auto_format = true,
        auto_lint = true,
        -- lsp
        lsp_cfg = false, -- we handle LSP config in lsp.lua
        -- formatting
        gofmt = 'gofumpt',
        -- linter
        linter = 'golangci-lint',
        -- test
        test_runner = 'go',
        -- dap
        dap_debug = false, -- we can enable this later if needed
      })
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()'
  },

  -- Additional Go tools
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-go").setup()
    end,
  },
}
