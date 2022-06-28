local status_ok, spectre = pcall(require, "spectre")

if not status_ok then
  return
end

local keymap = require("core.utils").keymap

keymap("n", "<C-S-f>", ":lua require('spectre').open()")
keymap("v", "<C-f>", ":lua require('spectre').open_visual({select_word=true})")
keymap("n", "<C-f>", ":lua require('spectre').open_file_search()")

spectre.setup({
  color_devicons = true,
  open_cmd = "vnew",
  live_update = true, -- auto excute search again when you write any file in vim
  line_sep_start = "",
  result_padding = "",
  line_sep = "",
  default = {
    find = {
      --pick one of item in find_engine
      cmd = "rg",
      args = {
        "--color=always",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },

      options = { "ignore-case" },
    },
    replace = {
      --pick one of item in replace_engine
      cmd = "sed",
      args = {
        "--color=always",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
    },
  },
  replace_vim_cmd = "cdo",
  is_open_target_win = true, --open file on opener window
  is_insert_mode = false, -- start open panel on is_insert_mode
})
