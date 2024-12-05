---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'bearded-arc',
  hl_add = {
    ["@log.level.warn"] = { fg = "sun" },
    ["@log.level.error"] = { fg = "red" },
    ["@log.level.info"] = { fg = "blue" },
    ["@log.level.debug"] = { fg = "grey_fg2" },
    ["@log.location"] = { fg = "purple" },
  },
}
M.plugins = "custom.plugins"
return M
