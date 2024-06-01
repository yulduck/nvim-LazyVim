return {
  -- luacheck: ignore
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-,>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        ignore_filetypes = { cpp = true },
        color = {
          suggestion_color = "#ffffff",
          cterm = 244,
        },
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      cmp.setup.buffer({
        sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "supermaven", group_index = 2 } })),
      })
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "supermaven", group_index = 2 } }))
      -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },
}
