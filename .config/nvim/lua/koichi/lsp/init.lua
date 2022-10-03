local status, _ = pcall(require, "lspconfig")
if (not status) then return end

require "koichi.lsp.lsp-installer"
require "koichi.lsp.handlers"
require "koichi.lsp.null-ls"
