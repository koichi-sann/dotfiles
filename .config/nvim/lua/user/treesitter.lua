local status_ok, configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

configs.setup {
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
  enable = true,
  enable_autocmd = false,
  },
  autotag = {
    enable = true,
  }
}

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
