local keymap = require("core.utils").keymap
local M = {}

M.lsp_document_highlight = function(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
    vim.api.nvim_create_augroup("lsp_document_highlight", {
      clear = false,
    })

    vim.api.nvim_clear_autocmds({
      group = "lsp_document_highlight",
      buffer = bufnr,
    })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
    })
  end
end

M.on_attach = function(cilent, bufnr)
  local client = cilent

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)

  M.lsp_document_highlight(cilent, bufnr)

  if client.server_capabilities.foldingRangeProvider then
    keymap("n", "<C-S-h>", "zc")
    keymap("n", "<C-S-l>", "za")
  end

  require("core.keymaps").lsp()

  -- Avoid formatting confict with null-ls
  -- client.server_capabilities.documentFormattingProvider = false

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,

        close_events = {
          "BufLeave",
          "CursorMoved",
          "InsertEnter",
          "FocusLost",
        },
        source = "always",
        scope = "cursor",
        prefix = " ",
      }
      vim.diagnostic.open_float(opts)
    end,
  })
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.snippetSupport = true

capabilities.textDocument.foldingRange = {
  dynamicRegistration = true,
  lineFoldingOnly = true,
}

M.capabilities = capabilities

return M
