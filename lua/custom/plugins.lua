local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "rust-analyzer",
        "pyright",
        "shfmt",
        "shellcheck",
        "bash-language-server",
      }
    }
  },
  {
    "kdheepak/lazygit.nvim",

    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" }
    },
  },
}
return plugins
