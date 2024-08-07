return {
  -- Set styles for comments, keywords, function and variables
  {
    -- catppuccin/nvim",
    "catppuccin/nvim",

    opts = {
      name = "catppuccin",
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = false },
        functions = { italic = true },
        variables = { italic = true },
        -- conditionals = { italic = true },
        -- strings = { italic = true },
        -- numbers = { bold = true },
        -- boolean = { bold = true },
      },
    },
    config = function() end,
  },
}
