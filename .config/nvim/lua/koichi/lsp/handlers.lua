local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local M = {}

local protocol = require('vim.lsp.protocol')

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then return end

M.capabilities = protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

local icons = require 'koichi.icons'

local signs = {
  { name = "DiagnosticSignError", text = icons.diagnostics.Error },
  { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
  { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
  { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
}

M.setup = function()

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')


  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_sync() end
    })
  end
end

--[[ protocol.CompletionItemKind = { ]]
--[[   '', -- Text ]]
--[[   '', -- Method ]]
--[[   '', -- Function ]]
--[[   '', -- Constructor ]]
--[[   '', -- Field ]]
--[[   '', -- Variable ]]
--[[   '', -- Class ]]
--[[   'ﰮ', -- Interface ]]
--[[   '', -- Module ]]
--[[   '', -- Property ]]
--[[   '', -- Unit ]]
--[[   '', -- Value ]]
--[[   '', -- Enum ]]
--[[   '', -- Keyword ]]
--[[   '﬌', -- Snippet ]]
--[[   '', -- Color ]]
--[[   '', -- File ]]
--[[   '', -- Reference ]]
--[[   '', -- Folder ]]
--[[   '', -- EnumMember ]]
--[[   '', -- Constant ]]
--[[   '', -- Struct ]]
--[[   '', -- Event ]]
--[[   'ﬦ', -- Operator ]]
--[[   '', -- TypeParameter ]]
--[[ } ]]

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  float = {
    border = "rounded",
    source = "always", -- Or "if_many"
  },
})

return M
