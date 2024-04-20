-- return {
--   -- luacheck: ignore
--   -- Setup treesitter
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = function(_, opts)
--       opts.highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = false,
--       }
--       vim.list_extend(opts.ensure_installed, {
--         "astro",
--         "svelte",
--         "css",
--         "make",
--         "templ",
--         "html",
--         "php_only",
--         "php",
--         "bash",
--       })
--     end,
--     config = function(_, opts)
--       local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
--
--       parser_config.blade = {
--         install_info = {
--           url = "https://github.com/EmranMR/tree-sitter-blade",
--           files = { "src/parser.c" },
--           branch = "main",
--         },
--         filetype = "blade",
--       }
--
--       vim.filetype.add({
--         pattern = {
--           [".*%.blade%.php"] = "blade",
--         },
--       })
--
--       require("nvim-treesitter.configs").setup(opts)
--     end,
--   },
-- }
-- <<<<<<< HEAD
--     config = function()
--       require("nvim-treesitter.configs").setup({
--         ensure_installed = { "python", "astro", "lua", "javascript", "typescript", "svelte" },
--         ignore_install = {},
--         sync_install = false,
--         auto_install = true,
--         highlight = {
--           enable = true,
--           additional_vim_regex_highlighting = false,
--         },
--         autotag = {
--           enable = true,
--           enable_rename = true,
--           enable_close = true,
--           enable_close_on_slash = true,
--           filetypes = {
--             "astro",
--             "html",
--             "javascript",
--             "typescript",
--             "svelte",
--             "vue",
--             "tsx",
--             "jsx",
--             "rescript",
--             "css",
--             "lua",
--             "xml",
--             "php",
--             "markdown",
--           },
--         },
--       })
--     end,
--     opts = function(_, opts)
--       opts.highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = false,
--       }
--       vim.list_extend(opts.ensure_installed, {
-- =======
<<<<<<< HEAD
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
=======

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    --     opts = function(_, opts)
    opts = {
      -- ensure_installed = "all",
      ensure_installed = {
        "astro",
        "svelte",
        "css",
        "make",
        "templ",
        "html",
        "php_only",
        "php",
        "bash",
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = { -- set to `false` to disable one of the mappings
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      autotag = { -- 'windwp/nvim-ts-autotag'
        enable = false, -- this breaks dot repeating with `>`
      },
      endwise = { -- 'RRethy/nvim-treesitter-endwise',
        enable = true,
      },
      textobjects = { -- 'nvim-treesitter/nvim-treesitter-textobjects',
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["if"] = "@function.inner",
            ["af"] = "@function.outer",
            ["ic"] = "@class.inner",
            ["ac"] = "@class.outer",
            ["il"] = "@loop.inner",
            ["al"] = "@loop.outer",
            ["ia"] = "@parameter.inner",
            ["aa"] = "@parameter.outer",
          },
        },
      },
      ts_context_commentstring = { -- JoosepAlviste/nvim-ts-context-commentstring
        enable = true,
        enable_autocmd = false, -- using Comment.nvim
      },
    },
    config = function(_, opts)
      -- local map = require("user.util").map
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          -- url = "~/sources/treesitter/tree-sitter-blade",
          files = {
            "src/parser.c",
            -- 'src/scanner.cc',
          },
          branch = "main",

          generate_requires_npm = true,
          requires_generate_from_grammar = true,
        },
        filetype = "blade",
      }

      -- parser_config.phpdoc = {
      --   install_info = {
      --     url = '~/sources/treesitter/tree-sitter-phpdoc',
      --     files = {
      --       'src/parser.c',
      --       'src/scanner.c',
      --     },
      --     branch = "master",
      --     generate_requires_npm = true,
      --     requires_generate_from_grammar = true,
      --   },
      --   filetype = 'php',
      -- }

      -- parser_config.php = {
      --   install_info = {
      --     url = '~/sources/treesitter/tree-sitter-php/php',
      --     files = {
      --       'src/parser.c',
      --       'src/scanner.c',
      --     },
      --     branch = "master",
      --     generate_requires_npm = true,
      --     requires_generate_from_grammar = true,
      --   },
      --   filetype = 'php',
      -- }

      -- parser_config.php_only = {
      --   install_info = {
      --     url = '~/sources/treesitter/tree-sitter-php/tree-sitter-php-only',
      --     files = {
      --       'src/parser.c',
      --       'src/scanner.c',
      --     },
      --     branch = "split_parsers",
      --     generate_requires_npm = false,
      --     requires_generate_from_grammar = false,
      --   },
      --   -- filetype = 'php',
      -- }

      require("nvim-treesitter.configs").setup(opts)

      -- map("n", "<leader>it", vim.treesitter.inspect_tree)
      -- map("n", "<leader>i", vim.show_pos)
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
      "RRethy/nvim-treesitter-endwise",
      -- @todo: configure plugin
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
  },
}
