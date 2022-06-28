local show_folders = require("core.configs").show_folders

local icons = require("core.utils").getvar("icons")

local keymaps = {
  { key = { "l", "<CR>" }, action = "edit" },
  { key = { "h", "<BS>" }, action = "close_node" },
  { key = "r", action = "full_rename" },
  { key = "c", action = "cd" },
  { key = "?", action = "toggle_help" },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
  return
end

nvim_tree.setup({
  git = {
    enable = true,
  },
  renderer = {
    group_empty = true,
    full_name = false,
    highlight_git = true,
    icons = {
      git_placement = "after",
      padding = " ",
      show = {
        file = true,
        git = false,
      },
      glyphs = {
        default = " ",

        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },

        folder = {
          default = show_folders and icons.folder or icons.chevron_r,
          open = show_folders and icons.folder_open or icons.chevron_d,
          empty = show_folders and icons.folder or icons.chevron_r,
          empty_open = show_folders and icons.folder_open or icons.chevron_d,
        },
      },
    },

    indent_markers = {
      enable = true,
      icons = {
        edge = icons.tree_indent,
        none = icons.tree_indent,
        corner = icons.tree_indent,
        item = icons.tree_indent,
      },
    },
  },

  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
  },

  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },

  disable_netrw = true,
  hijack_netrw = true,
  auto_reload_on_write = true,

  view = {
    signcolumn = "no",
    side = "left",
    preserve_window_proportions = true,
    hide_root_folder = true,
    width = 33,

    mappings = {
      list = keymaps,
    },
  },
})
