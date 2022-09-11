vim.cmd [[
  try
    colorscheme tokyonight 
    hi Normal guibg=NONE
    hi NormalNC guibg=NONE
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
  ]]

