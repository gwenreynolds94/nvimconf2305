
local opt = vim.opt
local g = vim.g

---@diagnostic disable: unused-local
local jkglobal = require'jkglobal'

local pkgs = require'pkgs'

g.mapleader = ' '
local keys = require'keys'
keys:bindall()




opt.clipboard:append[[unnamedplus]]

opt.number = true
opt.relativenumber = true
opt.numberwidth = 3
opt.signcolumn = 'number'
opt.expandtab = true
opt.tabstop = 4
opt.smarttab = true
opt.softtabstop = -1
opt.shiftwidth = 0
opt.shiftround = true
opt.cmdheight = 2
opt.foldmethod = [[marker]]
opt.foldlevelstart = 1

vim.cmd[[filetype plugin indent on]]


--- coc ---
opt.backup = false
opt.writebackup = false
opt.updatetime = 444
-----------



local nf_conf = require'pkgs.nightfox'
local sesh_conf = require'pkgs.neovim-session-manager'
local notify_conf = require'pkgs.nvim-notify'
local lualine_conf = require'pkgs.lualine'
local nvtree_conf = require'pkgs.nvim-tree'

vim.cmd[[colorscheme duskfox]]

vim.fn.setreg('c', [[^i--- €kd]])
vim.fn.setreg('u', [[^i€kD€kD€kD€kD€kd]])

