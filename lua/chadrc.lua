-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = 'bearded-arc',
  transparency = true,
  hl_add = {
    ["@log.level.warn"] = { fg = "sun" },
    ["@log.level.error"] = { fg = "red" },
    ["@log.level.info"] = { fg = "blue" },
    ["@log.level.debug"] = { fg = "grey_fg2" },
    ["@log.location"] = { fg = "purple" },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
