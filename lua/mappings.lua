require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- These remaps allow up and down navigation inside of wrapped lines
-- with simple j and k. Now use gj and gk to jump entire logical
-- lines instead of visual lines
map({"n", "v"}, "j", "gj")
map({"n", "v"}, "k", "gk")
map({"n", "v"}, "gj", "j")
map({"n", "v"}, "gk", "k")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
