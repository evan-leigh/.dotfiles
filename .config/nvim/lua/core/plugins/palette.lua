vim.opt.background = "dark"

local status_ok, palette = pcall(require, "palette")

if not status_ok then
  return
end

local lighten = require("palette.utils").lighten

palette.setup({
  transparent = false,

  on_change = function()
    vim.cmd([[source ~/.config/nvim/lua/core/plugins/lualine.lua]])
    vim.cmd([[source ~/.config/nvim/lua/core/plugins/bufferline.lua]])
  end,

  ["*"] = {
    settings = {
      darken = 0,
      -- darken = 0,
    },
  },

  onedark = {
    dark = {
      background = "#171a1c",
      foreground = "#ABB2BF",
    },
    light = {
      background = "#ffffff",
      foreground = "#000000",
    },
  },
  solarized8 = {
    dark = {
      background = "#002B36",
      foreground = "#ABB2BF",
    },
    settings = {
      darken = 25,
    },
  },
})

palette.custom_highlights({
  ["*"] = {
    dark = {
      VertSplit = { bg = vim.g.background_0, fg = lighten(vim.g.background_3, 20) },
      NvimTreeVertSplit = { bg = vim.g.background_1, fg = lighten(vim.g.background_3, 20) },
      BufferLineFill = { bg = vim.g.background_1 },
      NvimTreeStatusline = { fg = vim.g.background_3 },
      luaTSConstructor = { fg = vim.g.foreground_3 },
      TelescopePromptNormal = { bg = vim.g.background_0, fg = vim.g.foreground_1 },
      TelescopePromptBorder = { bg = vim.g.background_0, fg = vim.g.foreground_3 },
      TelescopeResultsNormal = { bg = vim.g.background_0, fg = vim.g.foreground_1 },
      TelescopeResultsBorder = { bg = vim.g.background_0, fg = vim.g.foreground_3 },
      TelescopePreviewNormal = { bg = vim.g.background_0, fg = vim.g.foreground_1 },
      TelescopePreviewBorder = { bg = vim.g.background_0, fg = vim.g.foreground_3 },
      TelescopeSelection = { bg = vim.g.blue, fg = vim.g.background_0 },
    },
    light = {
      TelescopePromptNormal = { bg = vim.g.background_0, fg = vim.g.foreground_1 },
      TelescopePromptBorder = { bg = vim.g.background_0, fg = vim.g.foreground_3 },
      TelescopeResultsNormal = { bg = vim.g.background_0, fg = vim.g.foreground_1 },
      TelescopeResultsBorder = { bg = vim.g.background_0, fg = vim.g.foreground_3 },
      TelescopePreviewNormal = { bg = vim.g.background_0, fg = vim.g.foreground_1 },
      TelescopePreviewBorder = { bg = vim.g.background_0, fg = vim.g.foreground_3 },
      TelescopeSelection = { bg = vim.g.blue, fg = vim.g.background_0 },
    },
  },
})
