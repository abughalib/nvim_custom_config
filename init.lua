vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)



-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Keybinds
local keymap = vim.keymap.set

-- Show hover doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP Hover Doc" })

-- Show diagnostic in floating window
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line Diagnostics" })

-- Jump to next diagnostic
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })

-- Jump to previous diagnostic
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Prev Diagnostic" })

-- Code action
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { desc = "Range Code Action" })

-- Rename
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename Symbol" })

-- Peek definition
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })

-- Go to definition
keymap("n", "gD", "<cmd>Lspsaga goto_definition<CR>", { desc = "Goto Definition" })

-- Show symbols in winbar
keymap("n", "<leader>sb", "<cmd>Lspsaga show_cursor_symbol<CR>", { desc = "Show Symbol in Winbar" })

