local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

local status_ok, packer = pcall(require, "packer")

if not status_ok then
  return
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
  -- Plugin Manager
  use("wbthomason/packer.nvim")

  -- Lazy Loader
  use({
    "lewis6991/impatient.nvim",
    commit = "969f2c5c90457612c09cf2a13fee1adaa986d350",
  })

  -- Code abstraction layer
  use({
    "nvim-treesitter/nvim-treesitter",
    commit = "158009d873525373d1d65fe2cecdbfdf18c824cd",
    -- requires = "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require("core.plugins.treesitter")
    end,
  })

  -- LSP interface
  use({
    "neovim/nvim-lspconfig",
    commit = "9278dfbb92f8e99c313ce58ddcff92bd0bce5c0c",
    config = function()
      require("core.plugins.lsp")
    end,
  })

  use("jose-elias-alvarez/nvim-lsp-ts-utils")

  -- Inject LSP actions
  -- use({
  --     "jose-elias-alvarez/null-ls.nvim",
  --   config = function()
  --     require("core.plugins.lsp.null_ls")
  --   end,
  --       commit = "c59ea57dfd9bc0402a53ad2e2ad7f23467fdf06a",
  -- })

  use({
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
    end,
  })

  -- Manage LSP servers
  use({
    "williamboman/nvim-lsp-installer",
    commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6",
  })

  -- Preview LSP renames
  use({
    "smjonas/inc-rename.nvim",
    commit = "a5ef4c3a16488fbe80d494debeea63ca04e1faf3",
    config = function()
      require("core.plugins.inc_rename")
    end,
  })

  -- Completion engine
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("core.plugins.nvim_cmp")
    end,
    commit = "1cad1815e165c2b436f41a1ee20327701842a761",
  })

  -- Document symbol completion
  use({
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    commit = "c3f0086ed9882e52e0ae38dd5afa915f69054941",
  })

  -- Nvim's lua API completion
  use({
    "hrsh7th/cmp-nvim-lua",
    commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
  })

  -- Buffer completion
  use({
    "hrsh7th/cmp-buffer",
    commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323",
  })

  -- LSP completion
  use({
    "hrsh7th/cmp-nvim-lsp",
    commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
  })

  -- Calc completion
  use({
    "hrsh7th/cmp-calc",
    commit = "f7efc20768603bd9f9ae0ed073b1c129f63eb312",
  })

  -- Path completion
  use({
    "hrsh7th/cmp-path",
    commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e",
  })

  -- Commandline completion
  use({
    "hrsh7th/cmp-cmdline",
    commit = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252",
  })

  -- Snippet completion
  use({
    "saadparwaiz1/cmp_luasnip",
    commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
  })

  -- Snippet engine
  use({
    "L3MON4D3/LuaSnip",
    commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a",
  })

  -- LSP folding
  use({
    "kevinhwang91/nvim-ufo",
    commit = "0c39893907b124a884b6a11bb565da2cdcc3cb69",
    requires = "kevinhwang91/promise-async",
    config = function()
      require("core.plugins.fold")
    end,
  })

  -- Tag completion
  use({
    "windwp/nvim-ts-autotag",
    commit = "044a05c4c51051326900a53ba98fddacd15fea22",
    after = "nvim-treesitter",
    config = function()
      require("core.plugins.auto_tags")
    end,
  })

  -- Pair completion
  use({
    "windwp/nvim-autopairs",
    commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec",
    after = "nvim-treesitter",
    config = function()
      require("core.plugins.auto_pairs")
    end,
  })
  -- Integrated terminal
  use({
    "akinsho/toggleterm.nvim",
    commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8",
    cmd = "ToggleTerm",
    keys = "<F1>",
    config = function()
      require("core.plugins.toggleterm")
    end,
  })

  -- Utility lua functions
  use({
    "nvim-lua/plenary.nvim",
    commit = "968a4b9afec0c633bc369662e78f8c5db0eba249",
  })

  -- Git integration
  use({
    "lewis6991/gitsigns.nvim",
    commit = "c18e016864c92ecf9775abea1baaa161c28082c3",
    config = function()
      require("core.plugins.gitsigns")
    end,
  })

  -- Image previewer
  use({
    "~/draw_image/",
    config = function()
      require("draw_image").setup()
    end,
  })

  -- Colorscheme manager
  use({
    "~/Github/palette.lua/",
    config = function()
      require("core.plugins.palette")
    end,
  })

  -- Color previews
  use({
    "norcalli/nvim-colorizer.lua",
    commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6",
    cmd = "ColorizerAttachToBuffer",
    config = function()
      require("core.plugins.colorizer")
    end,
  })

  -- Onedark
  use("navarasu/onedark.nvim")

  use("sainnhe/sonokai")

  use("kvrohit/rasmus.nvim")

  -- Icons
  use({
    "kyazdani42/nvim-web-devicons",
    commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e",
    config = function()
      require("core.plugins.web_devicons")
    end,
  })

  -- Surround motions
  use("tpope/vim-surround")

  -- Search and replace panel
  use({
    "windwp/nvim-spectre",
    commit = "58010388ff3cd6e52394183ce207659d2ae87753",
    module = "spectre",
    config = function()
      require("core.plugins.spectre")
    end,
  })

  -- File explorer
  use({
    "kyazdani42/nvim-tree.lua",
    commit = "79258f1d670277016523e13c0a88daa25070879f",
    -- cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("core.plugins.nvim_tree")
    end,
  })

  -- Keystroke based commands
  use({
    "folke/which-key.nvim",
    commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71",
    config = function()
      require("core.plugins.whichkey")
    end,
  })

  -- Show indent
  use({
    "lukas-reineke/indent-blankline.nvim",
    commit = "42fe62eb8792e427b2c7b0e1fa1b0d9597baac89",
    config = function()
      require("core.plugins.indentline")
    end,
  })

  -- Compile Tex Documents
  use({
    "lervag/vimtex",
    ft = "tex",
  })

  -- Notes system
  use({
    "nvim-orgmode/orgmode",
    commit = "3186ac3805ce9726c85a6ebdda741c33148f6535",
    config = function()
      require("core.plugins.orgmode")
    end,
  })

  -- Statusline
  use({
    "nvim-lualine/lualine.nvim",
    wants = "nvim-gps",
    commit = "3362b28f917acc37538b1047f187ff1b5645ecdd",
    config = function()
      require("core.plugins.lualine")
    end,
  })

  use("SmiteshP/nvim-gps")

  -- Bufferline
  use({
    "akinsho/bufferline.nvim",
    requires = {
      "moll/vim-bbye",
    },
    commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353",
    config = function()
      require("core.plugins.bufferline")
    end,
  })

  -- Fuzzy finder
  use({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    module = "telescope",
    commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0",
    config = function()
      require("core.plugins.telescope")
    end,
  })

  -- Commenting
  use({
    "numToStr/Comment.nvim",
    commit = "2c26a00f32b190390b664e56e32fd5347613b9e2",
    requires = {
      {
        after = "nvim-treesitter",
        "JoosepAlviste/nvim-ts-context-commentstring",
      },
    },
    cmd = "Comment",
    module = "Comment.api",
    config = function()
      require("core.plugins.comment")
    end,
  })

  -- Measure startuptime
  use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
