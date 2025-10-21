return {
  {
    "folke/lazy.nvim",
    tag = "stable",
  },

  -- Treesitter,
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate'
  },

  -- Projects
  {
    "chocycat/reitti.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      {
        "<leader>pp",
        function()
          require("telescope").extensions.reitti.projects()
        end,
        { desc = "Switch projects" },
      },
      {
        "<leader>pA",
        function()
          require("reitti.core.project").add_project(vim.fn.getcwd())
        end,
        { desc = "Add current directory to projects" },
      },
    },
    config = function()
      require("reitti").setup({
        auto_discover = {
          enabled = true,
          paths = {},
        },
        hooks = {
          after_switch = function()
            require("nvim-tree.api").tree.open()
          end,
        },
      })
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
      { "<leader>E", "<cmd>NvimTreeFocus<cr>",  desc = "Focus file explorer" },
    },
    opts = {
      git = {
        enable = true,
      },
      view = {
        width = 35,
        relativenumber = true,
        signcolumn = "no",
        side = "right",
        cursorline = false,
      },
      renderer = {
        indent_width = 2,
        indent_markers = {
          enable = false,
        },
        icons = {
          git_placement = "after",
          show = {
            file = true,
            folder = false,
            folder_arrow = true,
            git = false,
          },
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = ""
            }
          }
        },
        add_trailing = true,
      },
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { "^.git$", "^.DS_Store$", "^node_modules$" },
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
    },
  },

  -- Safely remove buffers
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bD",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Delete Buffer (Force)",
      },
    },
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>",                               desc = "Find files" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>",                                desc = "Live grep" },
      { "<leader>,", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    },
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "center",
        layout_config = {
          center = {
            anchor = "SE",
            anchor_padding = 0,
            prompt_position = "bottom",
            width = 0.33,
            height = 0.5,
          },
        },
        borderchars = {
          prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          results = { "─", "│", "─", "│", "╭", "╮", "┤", "├" },
        }
      },
    },
  },

  -- Better Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
        async = false,
      },
    },
  },

  -- Enhanced text objects
  {
    "chrisgrieser/nvim-various-textobjs",
    opts = { keymaps = { useDefaults = true } },
  },

  -- Enhanced % matching
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Automatic pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({
        check_ts = true,
        -- disable keys in Telescope
        disable_filetype = { "TelescopePrompt" },
        enable_moveright = true,
        enable_check_bracket_line = true,
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
        },
      })
    end,
  },

  -- Navigation
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
      jump = {
        autojump = true,
      },
      label = {
        rainbow = {
          enabled = false,
          shade = 5,
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  -- Hints
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    opts = {
      preset = "helix",
      delay = 0,
      win = {
        title = false,
      },
      icons = {
        mappings = false
      }
    },
  },

  -- Completion
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      keymap = { preset = 'super-tab' },
      signature = { enabled = true },
      completion = {
        menu = {
          border = 'rounded',
          scrollbar = false,
          draw = {
            treesitter = { 'lsp' },
            columns = {
              { "label",     "label_description" },
              { "kind_icon", gap = 2,            "kind" },
            }
          }
        },
        ghost_text = {
          enabled = true,
          show_without_menu = false,
        }
      }
    },
  },

  -- Indentation markers
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      indent = {
        char = "▏",
      },
    }
  },
}

