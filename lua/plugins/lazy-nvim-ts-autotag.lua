return {
  -- Changed event to VeryLazy
  {
    "windwp/nvim-ts-autotag",
    event = function()
      return "VeryLazy"
    end,
    opts = {
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "vue",
          "tsx",
          "jsx",
          "rescript",
          "xml",
          "php",
          "markdown",
          "astro",
          "glimmer",
          "handlebars",
          "hbs",
        },
      },
    },
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- event = "BufRead",
    config = function()
      -- require("nvim-treesitter.configs").setup({
      --   autotag = {
      --     enable = true,
      --     enable_rename = true,
      --     enable_close = true,
      --     enable_close_on_slash = true,
      --     filetypes = {
      --       "html",
      --       "xml",
      --       "javascript",
      --       "javascriptreact",
      --       "typescript",
      --       "typescriptreact",
      --       "svelte",
      --       "vue",
      --       "astro",
      --       "php",
      --       "blade.php",
      --       "tsx",
      --       "jsx",
      --     },
      --   },
      -- })
      require("nvim-ts-autotag").setup({
        -- autotag = {
        -- autotag = {
        --   enable = true,
        -- },
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = {
          "html",
          "xml",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "svelte",
          "vue",
          "astro",
          "php",
          "blade.php",
          "tsx",
          "jsx",
        },
        -- },
      })
      -- return {
      --   enable = true,
      --   enable_rename = true,
      --   enable_close = true,
      --   enable_close_on_slash = true,
      --   filetypes = {
      --     "html",
      --     "xml",
      --     "javascript",
      --     "javascriptreact",
      --     "typescript",
      --     "typescriptreact",
      --     "svelte",
      --     "vue",
      --     "astro",
      --     "php",
      --     "blade.php",
      --     "tsx",
      --     "jsx",
      --   },
      -- }
    end,
  },
}
