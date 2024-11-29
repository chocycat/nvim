return {
  {
    "folke/lazy.nvim",
    tag = "stable",
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
        { desc = "Project Switch" },
      },
      {
        "<leader>pA",
        function()
          require("reitti.core.project").add_project(vim.fn.getcwd())
        end,
        { desc = "Add Current Directory to Projects" },
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
      { "<leader>E", "<cmd>NvimTreeFocus<cr>", desc = "Focus file explorer" },
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
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          git_placement = "after",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
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

  -- Tabs
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Pin buffer" },
      {
        "<leader>bo",
        function()
          local current = vim.api.nvim_get_current_buf()
          local buffers = vim.api.nvim_list_bufs()

          for _, buf in ipairs(buffers) do
            if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
              require("mini.bufremove").delete(buf, false)
            end
          end
        end,
        desc = "Close other buffers (safe)",
      },
      { "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
      {
        "<leader>bc",
        function()
          vim.cmd("BufferLinePick")
          vim.schedule(function()
            require("mini.bufremove").delete(0, false)
          end)
        end,
        desc = "Pick buffer to close (safe)",
      },

      { "<leader>[", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<leader>]", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },

      { "<leader>b[", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
      { "<leader>b]", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
    },
    opts = {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        indicator = {
          style = "underline",
        },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 21,
        diagnostics_update_in_insert = false,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = { left = "", right = "" },
        enforce_regular_tabs = true,
        sort_by = "insert_at_end",
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
      { "<leader>bb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      { "<leader>,", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch Buffer" },
    },
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
        },
      },
    },
  },

  -- Better Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
      },
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
    opts = { useDefaultKeymaps = true },
  },

  -- Enhanced % matching
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Hate Myself
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason" },
      disabled_keys = {
        ["<Up>"] = {},
        ["<Down>"] = {},
        ["<Left>"] = {},
        ["<Right>"] = {},
      },
    },
    config = function()
      require("hardtime").setup()
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

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      require("neodev").setup()

      local servers = require("config.lsp").servers
      local on_attach = require("config.lsp").on_attach

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
      })

      -- setup servers
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      for server, config in pairs(servers) do
        lspconfig[server].setup(vim.tbl_extend("force", {
          on_attach = on_attach,
          capabilities = capabilities,
        }, config))
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {},
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
}
