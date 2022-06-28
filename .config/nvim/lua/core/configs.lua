vim.g.vitex_view_method = "zathura"
vim.g.vimtex_view_forward_search_on_start = false

local config = {
  relativenumber = false,
  cursorline = false,
  number = true,
  laststatus = 3,
  showtabline = 2,
  cmdheight = 1,
  foldcolumn = "0",
  foldcolumndigits = false,
  pumheight = 10,
  splitright = true,
  linespace = 4,

  borders = {
    telescope = "single",
    completion = "none",
  },

  show_icons = true,
  show_folders = false,

  icons = {
    { "", "left_sep" }, --     
    { "", "right_sep" }, --     
    { " ", "git" }, --     
    { "+", "added" }, --   +  
    { "~", "changed" }, --   ~  
    { "-", "removed" }, --   -  
    { "", "modified" }, --   
    { " ", "error" }, --   
    { "", "warning" }, --   
    { " ", "info" }, --   
    { "", "readonly" },
    { " ", "folder" },
    { " ", "folder_open" },
    { " ", "chevron_r" },
    { " ", "chevron_d" },
    { " 🭲", "tree_indent" },
    { "🭱", "editor_indent" },
    { " ", "tab_indicator" }, -- ▍
    { " ", "Text" },
    { "m ", "Method" },
    { " ", "Function" },
    { " ", "Constructor" },
    { " ", "Field" },
    { " ", "Variable" },
    { " ", "Class" },
    { " ", "Interface" },
    { " ", "Module" },
    { " ", "Property" },
    { " ", "Unit" },
    { " ", "Value" },
    { " ", "Enum" },
    { " ", "Keyword" },
    { " ", "Snippet" },
    { " ", "Color" },
    { " ", "File" },
    { " ", "Reference" },
    { " ", "Folder" },
    { " ", "EnumMember" },
    { " ", "Constant" },
    { " ", "Struct" },
    { " ", "Event" },
    { " ", "Operator" },
    { " ", "TypeParameter" },
  },

  scrolloff = 4,
  signcolumn = "no",
  signcolumnhl = false,
  numberwidth = 5,
  termguicolors = true,
  showmode = false,
  hlsearch = false,

  -- Wrapping
  textwidth = 80,
  wrap = true,
  linebreak = true,
  breakindent = true,
  breakindentopt = "shift:2",

  -- Indentation
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,

  -- Behavior
  hidden = true,
  timeoutlen = 400,
  updatetime = 300,
  ignorecase = true,
  lazyredraw = true,
  swapfile = false,
  smartcase = true,
  mouse = "a",
  backup = false,
}

vim.cmd([[
hi Cursor guibg=#268BD2
hi CursorIM guibg=#268BD2
hi lCursor guibg=#268BD2
hi rCursor guibg=#268BD2

set guicursor=n-c:block-Cursor
  \,v:block-CursorIM
  \,i-ci-ve:ver25-lCursor
  \,r-cr:hor20-rCursor
  \,o:hor50
  \,sm:block-blinkwait175-blinkoff150-blinkon175
]])

vim.opt.fillchars:append({
  vert = "▕",
  vertright = "▕",
  fold = "🭳",
  foldclose = "",
  foldopen = "",
  foldsep = " ",
  vertleft = "▕",
  eob = " ",
  horiz = "🮀",
})

vim.wo.foldlevel = 90 -- feel free to decrease the value
vim.wo.foldmethod = "manual"
vim.wo.foldenable = true

for k, v in pairs(config) do
  pcall(function()
    vim.opt[k] = v
  end, k, v)
end

return config
