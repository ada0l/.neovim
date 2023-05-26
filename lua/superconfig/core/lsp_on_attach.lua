local on_attach = function(client, bufnr)
  local capabilities = client.server_capabilities
  local opts_ = { noremap = true, silent = true }
  local wk = require("which-key")
  local map = require("superconfig.core.utils").map

  local map_dict = {}

  map("n", "[d", vim.diagnostic.goto_prev, opts_)
  map("n", "]d", vim.diagnostic.goto_next, opts_)

  map_dict["e"] = {
    ":lua vim.diagnostic.setloclist()<CR>",
    "Diagnostic list",
  }

  if capabilities.codeActionProvider then
    map_dict["a"] = {
      ":lua vim.lsp.buf.code_action()<CR>",
      "Code action",
    }
  end

  if capabilities.declarationProvider then
    map_dict["gD"] = {
      ":lua vim.lsp.buf.declaration()<CR>",
      "Declaration",
    }
  end

  if capabilities.definitionProvider then
    map_dict["gd"] = {
      ":lua vim.lsp.buf.definition()<CR>",
      "Definition",
    }
  end

  if capabilities.hoverProvider then
    map_dict["k"] = {
      ":lua vim.lsp.buf.hover()<CR>",
      "Hover",
    }
  end

  if capabilities.implementationProvider then
    map_dict["gi"] = {
      ":lua vim.lsp.buf.implementation()<CR>",
      "Implementation",
    }
  end

  if capabilities.renameProvider then
    map_dict["r"] = {
      ":lua vim.lsp.buf.rename()<CR>",
      "Rename",
    }
  end

  if capabilities.referencesProvider then
    map_dict["gi"] = {
      ":lua vim.lsp.buf.references()<CR>",
      "References",
    }
  end

  if client.name == "volar" or client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  if capabilities.documentFormattingProvider then
    map_dict["="] = {
      ":lua vim.lsp.buf.format { async = true }<CR>",
      "format",
    }
  end

  wk.register(map_dict, { prefix = "<leader>" })
end

return on_attach