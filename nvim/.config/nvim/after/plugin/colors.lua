-- Treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"cpp", "comment", "typescript", "rust", "go"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require("rose-pine").setup({
    disable_background = true,
})

vim.cmd("colorscheme rose-pine")
