return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- disable treesitter in preview mode due to a bug (when highlighting)
    require("telescope").setup({
      defaults = {
        preview = {
          treesitter = false,
        },
      },
    })

    local config = require("nvim-treesitter.config")

    config.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
