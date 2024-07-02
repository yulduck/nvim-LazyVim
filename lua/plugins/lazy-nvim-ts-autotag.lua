return {
  -- Changed event to VeryLazy
  {
    "windwp/nvim-ts-autotag",
    event = function()
      -- return "VeryLazy"
      return { "BufReadPre", "BufNewFile" }
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
    -- {
    --         opts = {
    --           autotag = {
    --             enable = true,
    --             enable_rename = true,
    --             enable_close = true,
    --             enable_close_on_slash = true,
    --             filetypes = {
    --               "html",
    --               "javascript",
    --               "typescript",
    --               "javascriptreact",
    --               "typescriptreact",
    --               "svelte",
    --               "vue",
    --               "tsx",
    --               "jsx",
    --               "rescript",
    --               "xml",
    --               "php",
    --               "markdown",
    --               "astro",
    --               "glimmer",
    --               "handlebars",
    --               "hbs",
    --             },
    --           },
    --         },
    --         enable = true,
    --         enable_rename = true,
    --         enable_close = true,
    --         enable_close_on_slash = true,
    --         filetypes = {
    --           "html",
    --           "xml",
    --           "javascript",
    --           "javascriptreact",
    --           "typescript",
    --           "typescriptreact",
    --           "svelte",
    --           "vue",
    --           "astro",
    --           "php",
    --           "blade.php",
    --           "tsx",
    --           "jsx",
    --         },
    --       }
  },
}
