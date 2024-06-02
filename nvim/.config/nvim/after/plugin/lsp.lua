  local lsp_zero = require('lsp-zero')

  require('mason').setup({})
  require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {'clangd', 'tsserver', 'rust_analyzer', 'gopls', 'pyright', 'html', 'jdtls'},
    handlers = {
      lsp_zero.default_setup,
    },
  })

lsp_zero.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<localleader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<localleader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<localleader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<localleader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<localleader>f", vim.lsp.buf.format, opts)
end)

lsp_zero.setup()

local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}),
  }
})

