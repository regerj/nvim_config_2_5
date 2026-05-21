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

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
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
      -- Detect special env for rust-analyzer
      local function file_exists(name)
        local f = io.open(name, "r")
        if f ~= nil then
          io.close(f)
          return true
        else
          return false
        end
      end
      local lines = {}
      local env = {}
      if file_exists(".ra-env") then
        for line in io.lines(".ra-env") do
          lines[#lines + 1] = line
        end
        for _,v in pairs(lines) do
          local a, b = v:match"^raenv (%S+)=(.+)"
          if a == nil then
            goto continue
          end
          env[a] = b
          ::continue::
        end
        print(env)
      end

      vim.g.rustaceanvim = {
        tools = {
          float_win_config = {
            border = 'rounded'
          }
        },
        server = {
          default_settings = {
            ['rust-analyzer'] = {
              cargo = {
                extraEnv = env
              }
            }
          }
        }
      }
    end
  },
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
  {
    "mfussenegger/nvim-dap",
    config = function ()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function ()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function ()
        dapui.close()
      end
    end,
    keys = {
      { "<leader>dl", "<cmd>lua require'dap'.step_into()<cr>", desc = "Debugger step into"},
      { "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", desc = "Debugger step over"},
      { "<leader>dk", "<cmd>lua require'dap'.step_out()<cr>", desc = "Debugger step out"},
      { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Debugger continue"},
      { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Debugger toggle breakpoint"},
      { "<leader>dd", "<cmd>lua require'dap'.set_breakpoint(vim.fn.intput('Breakpoint condition: '))<cr>", desc = "Debugger set conditional breakpoint"},
      { "<leader>de", "<cmd>lua require'dap'.terminate()<cr>", desc = "Debugger reset"},
      { "<leader>dr", "<cmd>lua require'dap'.run_last()<cr>", desc = "Debugger run last"},
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function ()
      require("dapui").setup()
    end,
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    opts = {
      -- or "fzf-lua" or "snacks" or "default"
      picker = "telescope",
      -- bare Octo command opens picker of commands
      enable_builtin = true,
    },
    keys = {
      {
        "<leader>oi",
        "<CMD>Octo issue list<CR>",
        desc = "List GitHub Issues",
      },
      {
        "<leader>op",
        "<CMD>Octo pr list<CR>",
        desc = "List GitHub PullRequests",
      },
      {
        "<leader>od",
        "<CMD>Octo discussion list<CR>",
        desc = "List GitHub Discussions",
      },
      {
        "<leader>on",
        "<CMD>Octo notification list<CR>",
        desc = "List GitHub Notifications",
      },
      {
        "<leader>os",
        function()
          require("octo.utils").create_base_search_command { include_current_repo = true }
        end,
        desc = "Search GitHub",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR "ibhagwan/fzf-lua",
      -- OR "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  }
}
