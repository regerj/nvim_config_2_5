-- local function get_window_pos()
--   local floating_window_scaling_factor = 0.9
--
--   -- Why is this required?
--   -- vim.g.lazygit_floating_window_scaling_factor returns different types if the value is an integer or float
--   if type(floating_window_scaling_factor) == 'table' then
--     floating_window_scaling_factor = floating_window_scaling_factor[false]
--   end
--
--   local height = math.ceil(vim.o.lines * floating_window_scaling_factor) - 1
--   local width = math.ceil(vim.o.columns * floating_window_scaling_factor)
--   local row = math.ceil(vim.o.lines - height) / 2
--   local col = math.ceil(vim.o.columns - width) / 2
--   print("finished get_window_pos")
--   return width, height, row, col
-- end
--
-- local function open_floating_window()
--   local width, height, row, col = get_window_pos()
--   local border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'}
--
--   local opts = {
--     style = "minimal",
--     relative = "editor",
--     row = row,
--     col = col,
--     width = width,
--     height = height,
--     border = border_chars,
--   }
--
--   local buff = vim.api.nvim_create_buf(false, true)
--
--   -- create file window, enter the window, and use the options defined in opts
--   local win = vim.api.nvim_open_win(buff, true, opts)
--
--   vim.bo[buff].filetype = 'lazygit'
--
--   vim.bo.bufhidden = 'hide'
--   vim.wo.cursorcolumn = false
--   vim.wo.signcolumn = 'no'
--   vim.api.nvim_set_hl(0, "LazyGitBorder", { link = "Normal", default = true })
--   vim.api.nvim_set_hl(0, "LazyGitFloat", { link = "Normal", default = true })
--   vim.wo.winhl = 'FloatBorder:LazyGitBorder,NormalFloat:LazyGitFloat'
--   vim.wo.winblend = 0
--
--   vim.api.nvim_create_autocmd('VimResized', {
--     callback = function()
--       print("hello there")
--       vim.defer_fn(function()
--         if not vim.api.nvim_win_is_valid(win) then
--           return
--         end
--         local new_width, new_height, new_row, new_col = get_window_pos()
--         vim.api.nvim_win_set_config(
--           win,
--           {
--             width = new_width,
--             height = new_height,
--             relative = "editor",
--             row = new_row,
--             col = new_col,
--           }
--         )
--       end, 20)
--     end,
--   })
--
--   return win, buff
-- end

-- local win, buff = open_floating_window()
-- local buff = vim.api.nvim_create_buf(false, true)
local map = vim.keymap.set

map(
    "n",
    "<leader>lf",
    function()
        return vim.diagnostic.open_float({ border = "rounded" })
    end,
    {
        desc = "LSP Open Floating Diagnostic Window",
        silent = true,
    }
)

map(
    "n",
    "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
    function()
        -- vim.g.rustaceanvim.tools.float_win_config.border = 'rounded'
        vim.cmd.RustLsp({'hover', 'actions'})
    end,
    {
        silent = true,
        desc = "LSP Open Hover Window",
    }
)
