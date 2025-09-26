-- Coding Plugins Configuration
-- ~/.config/nvim/lua/plugins/coding.lua

return {
  -- Completion framework
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths
      "hrsh7th/cmp-nvim-lsp", -- source for LSP
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = { -- configure how nvim-cmp interacts with snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(), -- close completion window
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        -- sources for autocompletion
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- snippets
          { name = "buffer" }, -- text within current buffer
          { name = "path" }, -- file system paths
        }),
      })
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          go = { "goimports", "gofumpt" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          lua = { "stylua" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Helper function to check if a command exists
      local function command_exists(cmd)
        return vim.fn.executable(cmd) == 1
      end

      -- Configure linters only if they're available
      local available_linters = {}
      
      -- Go linters
      if command_exists("golangci-lint") then
        available_linters.go = { "golangcilint" }
      elseif command_exists("staticcheck") then
        available_linters.go = { "staticcheck" }
      end
      
      -- JavaScript/TypeScript linters
      local js_linters = {}
      if command_exists("eslint_d") then
        table.insert(js_linters, "eslint_d")
      elseif command_exists("eslint") then
        table.insert(js_linters, "eslint")
      end
      
      if #js_linters > 0 then
        available_linters.javascript = js_linters
        available_linters.typescript = js_linters
        available_linters.javascriptreact = js_linters
        available_linters.typescriptreact = js_linters
      end

      lint.linters_by_ft = available_linters

      -- Only create autocmds if we have linters
      local has_linters = false
      for _, linters in pairs(available_linters) do
        if #linters > 0 then
          has_linters = true
          break
        end
      end

      if has_linters then
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
          group = lint_augroup,
          callback = function()
            local ft = vim.bo.filetype
            if available_linters[ft] and #available_linters[ft] > 0 then
              lint.try_lint()
            end
          end,
        })

        vim.keymap.set("n", "<leader>l", function()
          local ft = vim.bo.filetype
          if available_linters[ft] and #available_linters[ft] > 0 then
            lint.try_lint()
          else
            vim.notify("No linters available for filetype: " .. ft, vim.log.levels.INFO)
          end
        end, { desc = "Trigger linting for current file" })
      end
    end,
  },
}
