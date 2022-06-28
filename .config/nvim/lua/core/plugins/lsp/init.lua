local lspconfig = require("lspconfig")

local icons = require("core.utils").getvar("icons")

local configs = require("lspconfig.configs")

local capabilities = require("core.plugins.lsp.handlers").capabilities
local on_attach = require("core.plugins.lsp.handlers").on_attach

local servers = { "sumneko_lua", "bashls", "cssls", "vimls", "texlab", "jsonls", "tsserver", "clangd", "pyright" }

for _, server in pairs(servers) do
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.servers." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end
  lspconfig[server].setup(opts)
end

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.max_width = 50
  opts.max_height = 30
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local signs = {
  { name = "DiagnosticSignError", text = icons.error },
  { name = "DiagnosticSignWarn", text = icons.warning },
  { name = "DiagnosticSignHint", text = icons.hint },
  { name = "DiagnosticSignInfo", text = icons.info },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = false,

  signs = {
    active = signs,
  },

  update_in_insert = true,
  severity_sort = true,
  underline = true,

  float = {
    prefix = "",
    source = "always",
    style = "minimal",
    header = "",
  },
})
