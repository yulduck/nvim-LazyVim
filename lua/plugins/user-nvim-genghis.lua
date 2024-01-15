return {
  -- File management plugin for Neovim (Uses SPC zx for Chmodx)
  {
    "chrisgrieser/nvim-genghis",
    dependencies = "stevearc/dressing.nvim",
    keys = {
      { "<leader>zx", "<cmd>Chmodx<CR>", mode = { "n" }, desc = "Make Current File Executable" },
    },
    cmd = {
      "New", -- Create a new file
      "Duplicate", -- Duplicate the current file
      "NewFromSelection", -- Create a new file from the current selection
      "Rename", -- Rename the current file
      "Move", -- Move and rename the current file
      "Trash", -- Delete the current file
      "CopyFilename", -- Copy the current filename
      "CopyFilepath", -- Copy the current filepath (absolute)
      "CopyRelativePath", -- Copy the current filepath (relative)
      "CopyDirectoryPath", -- Copy the current directory path (absolute)
      "CopyRelativeDirectoryPath", -- Copy the current directory path (relative)
      "Chmodx", -- Make the current file executable
    },
  },
}
