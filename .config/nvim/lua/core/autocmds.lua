local create_autocmd = vim.api.nvim_create_autocmd

local fn_match = require("core.utils").fn_match

local get_buf_info = require("core.utils").get_buf_info

group = vim.api.nvim_create_augroup("General", {
  clear = true,
})

create_autocmd("TextYankPost", {
  command = "silent! lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 60})",
  group = group,
})

create_autocmd("BufWinEnter", {
  command = "set formatoptions-=cro",
})

create_autocmd("BufWinEnter", {
  callback = function()
    fn_match(".zshrc", "silent set ft=bash")
    fn_match("polybar/config.ini", "silent set ft=toml")
  end,
  group = group,
})

create_autocmd("BufWritePost", {
  callback = function()
    fn_match("polybar/config.ini", ":silent !polybar-msg cmd restart && notify-send 'polybar restarted'")
    fn_match("kitty.conf", "silent !kill -SIGUSR1 $(pgrep kitty) && notify-send 'kitty restarted'")
    fn_match("dunstrc", 'silent !killall dunst && notify-send "dunst restarted"')
    fn_match("sxhkd", 'silent !pkill -USR1 -x sxhkd && notify-send "sxhkd Restarted"')
  end,
  group = group,
})

create_autocmd("BufWritePost", {
  command = "source %",
  pattern = "*/nvim/lua*",
  group = group,
})

-- Prevent [No Name] buffer from being listed
create_autocmd("BufEnter", {
  callback = function()
    if get_buf_info("%").name == "" then
      vim.opt.buflisted = false
    end
  end,
  group = group,
})

create_autocmd("Filetype", {
  command = "nnoremap <silent> <buffer> q :close<cr>",
  pattern = { "Trouble", "NvimTree", "help" },
  group = group,
})

create_autocmd("Filetype", {
  command = "nnoremap <silent> <buffer> q :close<cr>",
  pattern = { "NvimTree", "help" },
  group = group,
})

create_autocmd("ColorScheme", {
  command = "so ~/.config/nvim/lua/core/plugins/palette.lua",
  group = group,
})

create_autocmd("Filetype", {
  command = "setlocal nonumber",
  pattern = "spectre_panel*",
  group = group,
})
