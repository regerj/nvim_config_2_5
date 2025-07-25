return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
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
        "codelldb",
      }
    }
  },
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
          "lua",
          "c",
          "bash",
          "python",
          "cpp",
          "rust",
          "doxygen",
          "json",
          "markdown",
          "toml",
          "yaml"
  		},
  	},
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
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_start = true
    end,
    ft = { "markdown" },
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function ()
      vim.g.rustaceanvim = {
        tools = {
          float_win_config = {
            border = 'rounded'
          }
        }
      }
    end
  }
--   {
--     "mrcjkb/rustaceanvim",
--     version = "^5",
--     lazy = false,
--     config = function ()
--       local mason_registry = require("mason-registry")
--       local codelldb = mason_registry.get_package("codelldb")
--       local extension_path = codelldb:get_install_path() .. "/extension/"
--       local codelldb_path = extension_path .. "adapter/codelldb"
--       local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
--       local cfg = require("rustaceanvim.config")
--       vim.g.rustaceanvim = {
--         dap = {
--           adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
--         }
--       }
--     end
--   },
--   {
--     "mfussenegger/nvim-dap",
--     config = function ()
--       local dap, dapui = require("dap"), require("dapui")
--       dap.listeners.before.attach.dapui_config = function ()
--         dapui.open()
--       end
--       dap.listeners.before.launch.dapui_config = function ()
--         dapui.open()
--       end
--       dap.listeners.before.event_terminated.dapui_config = function ()
--         dapui.close()
--       end
--       dap.listeners.before.event_exited.dapui_config = function ()
--         dapui.close()
--       end
--     end,
--     keys = {
--       { "<leader>dl", "<cmd>lua require'dap'.step_into()<cr>", desc = "Debugger step into"},
--       { "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", desc = "Debugger step over"},
--       { "<leader>dk", "<cmd>lua require'dap'.step_out()<cr>", desc = "Debugger step out"},
--       { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Debugger continue"},
--       { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Debugger toggle breakpoint"},
--       { "<leader>dd", "<cmd>lua require'dap'.set_breakpoint(vim.fn.intput('Breakpoint condition: '))<cr>", desc = "Debugger set conditional breakpoint"},
--       { "<leader>de", "<cmd>lua require'dap'.terminate()<cr>", desc = "Debugger reset"},
--       { "<leader>dr", "<cmd>lua require'dap'.run_last()<cr>", desc = "Debugger run last"},
--     }
--   },
--   {
--     "rcarriga/nvim-dap-ui",
--     dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
--     config = function ()
--       require("dapui").setup()
--     end,
--   }
}
