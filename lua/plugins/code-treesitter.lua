return {
  -- luacheck: ignore
  -- Setup treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "astro", "lua", "javascript", "typescript", "svelte" },
        ignore_install = {},
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
          filetypes = {
            "astro",
            "html",
            "javascript",
            "typescript",
            "svelte",
            "vue",
            "tsx",
            "jsx",
            "rescript",
            "css",
            "lua",
            "xml",
            "php",
            "markdown",
          },
        },
      })
    end,
    opts = function(_, opts)
      opts.highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
      vim.list_extend(opts.ensure_installed, {
        "astro",
        "svelte",
        "css",
        "make",
        "templ",
      })
      opts.autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = {
          "astro",
          "html",
          "javascript",
          "typescript",
          "svelte",
          "vue",
          "tsx",
          "jsx",
          "rescript",
          "css",
          "lua",
          "xml",
          "php",
          "markdown",
        },
      }
    end,
  },
}
