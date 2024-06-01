return {
  -- Changed event to VeryLazy
  -- {
  --   "RRethy/vim-illuminate",
  --   event = function()
  --     return "VeryLazy"
  --   end,
  --   opts = {
  --     filetypes_denylist = {
  --       "dirbuf",
  --       "dirvish",
  --       "fugitive",
  --       "dashboard",
  --     },
  --   },
  -- },
  {
    "RRethy/vim-illuminate",
    lazy = true,
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = { "CursorMoved", "InsertLeave" },
    config = function()
      require("illuminate").configure({
        filetypes_denylist = {
          "neotree",
          "neo-tree",
          "Telescope",
          "telescope",
          "dirbuf",
          "dirvish",
          "fugitive",
          "dashboard",
        },
      })
    end,
  },
}
