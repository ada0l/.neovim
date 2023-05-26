return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    opts = function()
      local null_ls = require("null-ls")
      return {
        autostart = true,
        on_attach = require('superconfig.core.lsp_on_attach'),
        sources = {
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.black.with({
            extra_args = {
              "--line-length=79"
            }
          }),
          -- null_ls.builtins.diagnostics.flake8,
          null_ls.builtins.diagnostics.mypy.with({
            extra_args = {
              "--ignore-missing-imports"
            }
          }),
          null_ls.builtins.formatting.prettier,
          --null_ls.builtins.formatting.eslint_d,
          -- null_ls.builtins.diagnostics.eslint,
        },
      }
    end
  }
}
