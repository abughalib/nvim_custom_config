return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      -- You can customize features here
      ui = {
        border = "rounded",
        devicon = true,
      },
      lightbulb = {
        enable = true,
        sign = true,
        virtual_text = false,
      },
      symbol_in_winbar = {
        enable = true,
        separator = " › ",
        show_file = true,
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons",     -- optional
  },
    ui = {
    border = "rounded",
    title = true,
    expand = "",
    collapse = "",
    code_action = "💡",
    incoming = " ",
    outgoing = " ",
    kind = {},
  },
  diagnostic = {
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    max_width = 80, -- 👈 restrict width to avoid overflow
    max_height = 12,
    border_follow = true,
    keys = {
      exec_action = "o",
      quit = "q",
      toggle_or_jump = "<CR>",
      quit_in_show = { "q", "<ESC>" },
    },
  },
  lightbulb = {
    enable = true,
    sign = true,
    virtual_text = false,
  },
  hover = {
    max_width = 80,
  },
  rename = {
    in_select = true,
    auto_save = true,
  },
  symbol_in_winbar = {
    enable = true,
    separator = " › ",
    show_file = true,
    folder_level = 2,
  },
}

