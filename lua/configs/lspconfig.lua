-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local map = vim.keymap.set

-- EXAMPLE
local servers = { "pyright", "bashls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- Opens a floating diagnostic window with options
local function open_float()
    return vim.diagnostic.open_float({ border = "rounded" })
end

-- Adds room to customize the on_attach function
local function extended_on_attach()
    map("n", "<leader>lf", open_float, { desc = "LSP Open Floating Diagnostic Window"})
    nvlsp.on_attach()
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = extended_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    nvlsp.on_attach(client, bufnr)
  end,

  capabilities = nvlsp.capabilities
}

lspconfig.rust_analyzer.setup{
  on_attach = extended_on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = {"rust"},
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        features = {
        }
      }
    }
  }
}
