return {
  {
    "andymass/vim-matchup",
    event = "BufReadPost",

    init = function()
      vim.o.matchpairs = "(:),{:},[:]"
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        matchup = {
          enable = true, -- mandatory, false will disable the whole extension
          disable = { "c", "ruby" }, -- optional, list of language that will be disabled
          -- [options]
        },
        -- autotag = {
        --   enable = true,
        --   enable_rename = true,
        --   enable_close = true,
        -- },
      })
    end,
  },
}
