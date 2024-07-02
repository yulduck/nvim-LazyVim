return {
  -- Setup formatters
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["php"] = { "pint" },
        ["blade"] = { "blade-formatter" },
        ["python"] = { "black" },
        ["bash"] = { "shfmt" },
        ["astro"] = { "prettier" },
        ["json"] = { "jq" },
        -- ["json"] = { "prettier" },
        -- ["json"] = { "jsonls" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
        -- # Example of using dprint only when a dprint.json file is present
        -- dprint = {
        --   condition = function(ctx)
        --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
        --
        -- # Example of using shfmt with extra args
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
      },
      timeoutms = 10000,
      timeout = 1000,
    },
  },
}
