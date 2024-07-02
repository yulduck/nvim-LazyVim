return {
  -- luacheck: ignore
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      cmp.setup.buffer({ sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot" } })) })
      -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot" } }))
      -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },
}

-- return {
--   -- luacheck: ignore
--   -- Add emoji support source to nvim-cmp
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = { "hrsh7th/cmp-emoji" },
--     ---@param opts cmp.ConfigSchema
--     opts = function(_, opts)
--       local cmp = require("cmp")
--       opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
--     end,
--   },
-- }
