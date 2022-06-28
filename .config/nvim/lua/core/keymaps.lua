local M = {}
local keymap = require("core.utils").keymap

-- Space for leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Toggle hlsearch
keymap("n", "\\", ":set invhlsearch")

-- Bufferline
keymap("n", "<Tab>", ":bn")
keymap("n", "<S-Tab>", ":bp")

-- Git signs
keymap("n", "<A-p>", ":Gitsigns preview_hunk")
keymap("n", "<A-[>", ":Gitsigns prev_hunk")
keymap("n", "<A-]>", ":Gitsigns next_hunk")

-- Emulation of multicursor
keymap("n", "<C-n>", ":NvimTreeToggle")

-- Telescope
keymap({ "n", "v" }, "<C-p>", ':lua require("telescope.builtin").find_files(DROPDOWN())')
keymap({ "n", "v" }, "?", ':lua require("telescope.builtin").live_grep(PREVIEW())')

-- Commenting
keymap("i", "<C-/>", "<esc>:norm gcA<cr>a")
keymap("n", "<C-/>", ":lua require('Comment.api').toggle_current_linewise()")
keymap("v", "<C-/>", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())")

-- Toggle terminal
keymap("n", "<F1>", ":lua lazygit_toggle()")
keymap("n", "<C-\\>", ":ToggleTerm")

-- LSP
M.lsp = function()
  keymap("n", "gr", ":Trouble lsp_references")
  keymap("n", "gd", ":Trouble definition")
  -- keymap("n", "gd", vim.lsp.buf.definition)
  -- keymap("n", "gd", vim.lsp.buf.definition)
  keymap("n", ">", vim.lsp.buf.code_action)
  keymap("n", "K", vim.lsp.buf.hover)
end

-- Emulation of multicursor
keymap("v", "<C-d>", "//dgn", { noremap = false })
keymap("v", "<C-n>", "//cgn", { noremap = false })

-- Highlight selected text
keymap("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>:set hlsearch<CR>N]])

-- Switch to previous buffer (Ctrl+Enter)
keymap("n", "<C-CR>", "<C-^>", { silent = false })

-- New lines
keymap("i", "<C-CR>", "<C-o>o")
keymap("i", "<C-S-CR>", "<C-o>O")

-- Copy to system clipboard
keymap({ "n", "v" }, "<C-c>", '"+y')

-- Paste from system clipboard
keymap({ "i", "c" }, "<C-v>", "<C-r>+")
keymap({ "n", "v" }, "<C-v>", '"+p')

-- Paste from register
keymap("i", "<C-p>", "<C-r>0", { silent = false })

-- Ctrl + j to %
keymap("v", "<C-j>", ":norm gv%")
keymap("n", "d<C-j>", ":norm d%")
keymap("n", "<C-j>", ":norm %")

-- Block selection
keymap({ "n", "v" }, "<C-b>", "<C-v>")

-- Vertical movement
keymap("n", "<C-u>", "2<C-y>")
keymap("n", "<C-d>", "2<C-e>")

-- Start / end of line
keymap({ "n", "v" }, "<C-h>", "^")
keymap({ "n", "v" }, "<C-l>", "$")

-- For ":norm" commands
keymap("c", "<C-l>", "$", { silent = false })
return M
