local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
-- local diagnostics = null_ls.builtins.diagnostics

--[[ local luasnip = require("luasnip.loaders.from_vscode").lazy_load() ]]

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    code_actions.eslint
    -- formatting.eslint,
    -- diagnostics.eslint,
    --[[ diagnostics.stylelint, ]]
  },
})
