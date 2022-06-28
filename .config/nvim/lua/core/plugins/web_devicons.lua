local status_ok, web_devicons = pcall(require, "nvim-web-devicons")

if not status_ok then
  return
end

local current_icons = web_devicons.get_icons()

local new_icons = {}

local config = require("core.configs")

for key, icon in pairs(current_icons) do
  new_icons[key] = icon
end

web_devicons.set_icon(new_icons)
