return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<C-e>",
      function()
        require("neo-tree.command").execute({
          source = "filesystem",
          position = "left",
          toggle = true,
        })
      end,
      desc = "Abrir Neo-tree (filesystem)",
    },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = {
          enabled = true,
        },
      },
      window = {
        width = 30,
      },
    })
  end,
}
