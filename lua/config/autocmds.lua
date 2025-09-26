-- Autocommands Configuration
-- ~/.config/nvim/lua/config/autocmds.lua

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General settings
local general = augroup("General", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
  group = general,
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
  group = general,
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Restore cursor location when file is opened
autocmd("BufReadPost", {
  group = general,
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    if
      line > 1
      and line <= vim.fn.line("$")
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd('normal! g`"')
    end
  end,
})

-- File type specific settings
local filetypes = augroup("FileTypes", { clear = true })

-- Set indentation to 2 spaces for web dev files
autocmd("FileType", {
  group = filetypes,
  pattern = { "html", "css", "javascript", "typescript", "json", "lua" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- Set indentation to 4 spaces for Go files (Go standard)
autocmd("FileType", {
  group = filetypes,
  pattern = { "go" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = false  -- Go uses tabs
  end,
})

-- Terminal settings
local terminal = augroup("Terminal", { clear = true })

-- Open terminal in insert mode
autocmd("TermOpen", {
  group = terminal,
  pattern = "*",
  command = "startinsert",
})

-- Disable line numbers in terminal
autocmd("TermOpen", {
  group = terminal,
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
