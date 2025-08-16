-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

vim.schedule(function() require "mappings" end)
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

vim.opt.fillchars:append "diff:╱"
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#2A4A2A", fg = "#6FAC60" })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#37222c", fg = "#D54E53" })
vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1f2231", fg = "#D7BA7D" })
vim.api.nvim_set_hl(0, "DiffText", { bg = "#394b70" })
