return {
  -- Setup language servers, Changed event to VeryLazy
  {
    "neovim/nvim-lspconfig",
    event = function()
      return "VeryLazy"
    end,
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disabled <C-k> keymap
      keys[#keys + 1] = { "<c-k>", mode = "i", false }
    end,
    opts = {
      servers = {
        pyright = {},
        bashls = {},
        html = {},
        cssls = {},
        astro = {},
        emmet_language_server = {
          filetypes = {
            "astro",
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "pug",
            "sass",
            "scss",
            "svelte",
            "typescriptreact",
          },
        },
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          ---@type LazyKeysSpec[]
          -- keys = {},
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = {
                  "vim",
                },
              },
            },
          },
        },
      },
    },
  },
}
