require("nvchad.configs.lspconfig").defaults()

local servers = { "json-lsp", "bashls", "clangd", "pyright", "just" }

-- read :h vim.lsp.config for changing options of lsp servers 
-- Opens a floating diagnostic window with options
local function open_float()
    return vim.diagnostic.open_float({ border = "rounded" })
end

-- Adds room to customize the on_attach function
local function extended_on_attach(client)
    map("n", "<leader>lf", open_float, { desc = "LSP Open Floating Diagnostic Window"})
    on_attach(client)
end

vim.lsp.config('clangd', {
  setup = {
    on_attach = function (client, bufnr)
      print("hello there")
      client.server_capabilities.signatureHelpProvider = false
      map("n", "<leader>lf", vim.diagnostic.open_float({ border = "rounded" }), { desc = "LSP Open Floating Diagnostic Window"})
      on_attach(client, bufnr)
    end,

    capabilities = capabilities,
    on_init = on_init,
    filetypes = { 'c', 'cpp', 'cuda', 'cxx', 'h', 'hpp', 'hxx' },
  }
})

vim.lsp.config('json-lsp', {
  cmd = {'vscode-json-language-server', '--stdio'},
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = true,
  },
  root_markers = { '.git' },
})

-- lspconfig.rust_analyzer.setup{
--   on_attach = extended_on_attach,
--   capabilities = nvlsp.capabilities,
--   filetypes = {"rust"},
--   root_dir = lspconfig.util.root_pattern("Cargo.toml"),
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = {
--         features = {
--         }
--       }
--     }
--   }
-- }

vim.lsp.config('azure_pipelines_ls', {
  setup = {
    cmd = { "azure-pipelines-language-server", "--stdio" },
    root_dir = ".pipelines/",
    on_attach = extended_on_attach,
    capabilities = capabilities,
    filetypes = {"yaml"},
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/main/service-schema.json"] = {
                    "/.pipelines/**/*.yml",
                    "/.pipelines/*.yml",
                },
            },
        },
    },
  }
})

vim.lsp.enable(servers)
