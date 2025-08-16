local options = {

  base46 = {
    theme = "nightowl", -- default theme
    hl_add = {},
    hl_override = {},
    integrations = {},
    changed_themes = {},
    transparency = false,
    theme_toggle = { "nightowl", "one_light" },
  },



  cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with test
  },
  ui = {

    statusline = {
      enabled = false,
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
      enabled = false,
    },
  },


  mason = { pkgs = {}, skip = {} },

}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
