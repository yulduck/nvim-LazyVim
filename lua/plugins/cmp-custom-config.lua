return {
  -- luacheck: ignore
  -- Custom config for nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    -- event = function()
    --   return "VeryLazy"
    -- end,
    event = { "InsertEnter", "CmdlineEnter" },

    dependencies = {
      "onsails/lspkind.nvim", -- Added lspkind icons
      -- "zbirenbaum/copilot-cmp",
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      local compare = require("cmp.config.compare")
      local luasnip = require("luasnip")

      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect", -- Added noselect to prevent auto select
      }

      opts.mapping = {
        ["<CR>"] = cmp.config.disable,
        -- ctrl + e关闭补全窗口
        -- <C-n> and <C-p> for navigating snippets
        ["<C-n>"] = cmp.mapping(function()
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          end
        end, { "i", "s" }),
        ["<C-p>"] = cmp.mapping(function()
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function()
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        end, { "i", "s" }),
        ["<C-j>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            cmp.complete()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.config.disable,
      }
      -- opts.mapping = cmp.mapping.preset.insert({
      --   ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), -- j to go down the list
      --   ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), -- k to go up the list
      --   ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- b to scroll the documentation up
      --   ["<C-f>"] = cmp.mapping.scroll_docs(4), -- f to scroll the documentation down
      --   ["<C-Space>"] = cmp.mapping.complete(),
      --   ["<Tab>"] = cmp.mapping.complete(),
      --   ["<C-o>"] = cmp.mapping.complete(),
      --   ["<C-e>"] = cmp.mapping.abort(),
      --   ["<C-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      --   ["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      --   ["<CR>"] = function(fallback) -- Changed C-CR to CR
      --     cmp.abort()
      --     fallback()
      --   end,
      -- })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local handlers = require("nvim-autopairs.completion.handlers")

      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done({
          filetypes = {
            -- "*" is a alias to all filetypes
            ["*"] = {
              ["("] = {
                kind = {
                  cmp.lsp.CompletionItemKind.Function,
                  cmp.lsp.CompletionItemKind.Method,
                },
                handler = handlers["*"],
              },
            },
          },
        })
      )

      -- UI Customization
      cmp.setup({
        window = {
          documentation = cmp.config.window.bordered(),
        },
      })
      opts.window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
          col_offset = -3,
          side_padding = 0,
        },
        documentation = {
          winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
        },
      }

      opts.formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          local kind = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            symbol_map = { Copilot = "" },
          })(entry, item)

          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
      }
      return opts
    end,
  },
}
