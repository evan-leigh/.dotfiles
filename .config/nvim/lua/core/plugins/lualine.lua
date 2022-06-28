local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
  return
end

local icons = require("core.utils").getvar("icons")
local workspace_root = require("core.utils").workspace_root
local wordcount = require("core.utils").wordcount
local darken = require("palette.utils").darken
local gps = require("nvim-gps")

local theme = {
  normal = {
    a = { fg = vim.g.blue, bg = vim.g.background_3 },
    b = { fg = vim.g.foreground_0, bg = vim.g.background_3 },
    c = { fg = vim.g.foreground_0, bg = vim.g.background_3 },
    x = { fg = vim.g.foreground_0, bg = vim.g.background_3 },
    y = { fg = vim.g.foreground_0, bg = vim.g.background_3 },
    z = { fg = vim.g.foreground_0, bg = vim.g.background_3 },
  },

  inactive = {
    a = { fg = vim.g.foreground_1, bg = vim.g.background_1 },
    b = { fg = vim.g.foreground_1, bg = vim.g.background_1 },
    c = { fg = vim.g.foreground_1, bg = vim.g.background_1 },
    y = { fg = vim.g.foreground_1, bg = vim.g.background_1 },
    z = { fg = vim.g.foreground_1, bg = vim.g.background_1 },
  },
  insert = {
    a = { fg = vim.g.green, bg = vim.g.background_3 },
  },

  command = {
    a = { fg = vim.g.yellow, bg = vim.g.background_3 },
  },

  visual = {
    a = { fg = vim.g.red, bg = vim.g.background_3 },
  },

  replace = {
    a = { fg = vim.g.purple, bg = vim.g.background_3 },
  },
}

local function search_result()
  if vim.v.hlsearch == 0 then
    return ""
  end
  local last_search = vim.fn.getreg("/")
  if not last_search or last_search == "" then
    return ""
  end
  local searchcount = vim.fn.searchcount({ maxcount = 9999 })
  return last_search .. " " .. searchcount.current .. "/" .. searchcount.total
end

local function modified()
  if vim.bo.modified then
    return icons.modified
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return icons.readonly
  end
  return ""
end

lualine.setup({
  options = {
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "scratch", "Alpha" },
    disabled_buftypes = { "quickfix", "prompt", "scratch" },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        function()
          -- return "▍"
          return ""
        end,
        padding = { left = 0 },
      },
    },
    lualine_b = {
      { "mode", color = { gui = "bold" } },
    },
    lualine_c = {
      { modified, padding = { right = 1, left = 1 } },
      { "filename", file_status = false },
      { gps.get_location, cond = gps.is_available },
    },
    lualine_x = {
      "%p%% %L",
      wordcount,
      search_result,
      { "branch", icon = "", colors = { gui = "bold" } },
      { "diff", colored = false },
    },
    lualine_y = { { icon = " ", workspace_root } },
    lualine_z = {},
  },

  inactive_sections = {
    lualine_a = {
      {
        function()
          -- return "▍"
          return ""
        end,
        padding = { left = 0 },
      },
      { "mode", colors = { gui = "bold" } },
    },
    lualine_b = {
      {
        "%w",
        cond = function()
          return vim.wo.previewwindow
        end,
      },
    },
    lualine_c = {
      { modified, padding = { right = 1, left = 1 } },
      { "filename", file_status = false },
      { gps.get_location, cond = gps.is_available },
    },
    lualine_x = {
      "%p%% %L",
      wordcount,
      search_result,
      { "branch", icon = "", colors = { gui = "bold" } },
      { "diff", colored = false },
    },
    lualine_y = {
      { icon = " ", workspace_root },
    },
    lualine_z = {},
  },
})

gps.setup({
  disable_icons = true,
  separator = "  ",
})
