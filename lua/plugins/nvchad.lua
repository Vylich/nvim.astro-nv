return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function() require "configs.conform" end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  { "nvim-neotest/nvim-nio" },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "eslint-lsp",
        "gopls",
        "js-debug-adapter",
        "typescript-language-server",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "typescript",
        "javascript",
        "go",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function() require "configs.lint" end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function() require "configs.lspconfig" end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function() require("nvim-ts-autotag").setup() end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function() require("better_escape").setup() end,
  },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("chatgpt").setup {}
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-jest" {
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.ts",
            env = { CI = true },
            cwd = function(path) return vim.fn.getcwd() end,
          },
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local ok, dap = pcall(require, "dap")
      if not ok then return end
      dap.configurations.typescript = {
        {
          type = "node2",
          name = "node attach",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
        },
      }
      dap.adapters.node2 = {
        type = "executable",
        command = "node-debug2-adapter",
        args = {},
      }
    end,
    dependencies = {
      "mxsdev/nvim-dap-vscode-js",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()

      local dap, dapui = require "dap", require "dapui"

      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open {} end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close {} end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close {} end
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end,
  },
  { "tpope/vim-fugitive" },
  { "rbong/vim-flog", dependencies = {
    "tpope/vim-fugitive",
  }, lazy = false },
  { "sindrets/diffview.nvim", lazy = false },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function() require("leap").add_default_mappings(true) end,
  },
  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function() require("todo-comments").setup() end,
  }, -- To make a plugin not be loaded
  {
    "Exafunction/codeium.vim",
    lazy = false,
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "m00qek/baleia.nvim",
  },
  {
    "samodostal/image.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("image").setup {
        render = {
          min_padding = 5,
          show_label = true,
          show_image_dimensions = true,
          use_dither = true,
          foreground_color = true,
          background_color = true,
        },
        events = {
          update_on_nvim_resize = true,
        },
      }
    end,
  },
  {
    "nmassardot/nvim-preview-svg",
    lazy = false,
    config = function()
      require("nvim-preview-svg").setup {
        browser = "Firefox",
        args = false,
      }
    end,
  },
  {
    "anuvyklack/keymap-amend.nvim",
    lazy = false,
  },
  {
    "anuvyklack/fold-preview.nvim",
    lazy = false,
    requires = { "anuvyklack/keymap-amend.nvim" },
    config = function()
      local fp = require "fold-preview"
      local map = require("fold-preview").mapping
      local keymap = vim.keymap
      keymap.amend = require "keymap-amend"

      fp.setup {
        default_keybindings = false,
        -- another settings
      }

      keymap.amend("n", "K", function(original)
        -- if not fp.show_preview() then
        --   original()
        -- end
        -- or
        if not fp.toggle_preview() then original() end
        -- to close preview on second press on K.
      end)
      keymap.amend("n", "h", map.close_preview_open_fold)
      keymap.amend("n", "l", map.close_preview_open_fold)
      keymap.amend("n", "zo", map.close_preview)
      keymap.amend("n", "zO", map.close_preview)
      keymap.amend("n", "zc", map.close_preview_without_defer)
      keymap.amend("n", "zR", map.close_preview)
      keymap.amend("n", "zM", map.close_preview_without_defer)
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    lazy = false,
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require("ufo").setup {
        open_fold_hl_timeout = 150,
        preview = {
          win_config = {
            winblend = 0,
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = (" 󰁂 %d "):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              local hlGroup = chunk[2]
              table.insert(newVirtText, { chunkText, hlGroup })
              chunkWidth = vim.fn.strdisplaywidth(chunkText)
              -- str width returned from truncate() may less than 2nd argument, need padding
              if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
              end
              break
            end
            curWidth = curWidth + chunkWidth
          end
          table.insert(newVirtText, { suffix, "MoreMsg" })
          return newVirtText
        end,
        provider_selector = function() return { "treesitter", "indent" } end,
      }
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require "statuscol.builtin"
      require("statuscol").setup {
        -- configuration goes here, for example:
        relculright = true,
        segments = {
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          {
            sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
            click = "v:lua.ScSa",
          },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          {
            sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
            click = "v:lua.ScSa",
          },
        },
      }
    end,
  },
  {
    "ap/vim-css-color",
    lazy = false,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "tpope/vim-repeat",
    lazy = false,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    branch = "master",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-i>",
        ["Find Subword Under"] = "<C-i>",
        ["Select All"] = "<C-a>",
        ["Find Prev"] = "<C-k>",
        ["Find Next"] = "<C-l>",
      }
      vim.g.VM_theme = "iceblue"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  { "akinsho/toggleterm.nvim", version = "*", config = true },
  { "rafamadriz/friendly-snippets" },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "giusgad/hologram.nvim",
    lazy = false,
    config = function()
      require("hologram").setup {
        auto_display = true,
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          follow_files = true,
        },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 500,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      }
    end,
  },
  {
    "NvChad/nvterm",
    lazy = false,
    config = function()
      require("nvterm").setup {
        terminals = {
          shell = vim.o.shell,
          list = {},
          type_opts = {
            float = {
              relative = "editor",
              row = 0.2,
              col = 0.15,
              width = 0.7,
              height = 0.6,
              border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.3 },
            vertical = { location = "rightbelow", split_ratio = 0.5 },
          },
        },
        behavior = {
          autoclose_on_quit = {
            enabled = false,
            confirm = true,
          },
          close_on_exit = true,
          auto_insert = true,
        },
      }
    end,
  },
  {
    "nvchad/ui",
    config = function() require "nvchad" end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function() require("base46").load_all_highlights() end,
  },

  "nvchad/volt",
  {
    "Equilibris/nx.nvim",
    lazy = false,

    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("nx").setup {
        -- Base command to run all other nx commands, some other values may be:
        -- - `npm nx`
        -- - `yarn nx`
        -- - `pnpm nx`
        nx_cmd_root = "npx nx",

        -- Command running capabilities,
        -- see nx.m.command-runners for more details
        command_runner = require("nx.command-runners").terminal_cmd(),
        -- Form rendering capabilities,
        -- see nx.m.form-renderers for more detials
        form_renderer = require("nx.form-renderers").telescope(),

        -- Whether or not to load nx configuration,
        -- see nx.loading-and-reloading for more details
        read_init = true,
      }
    end,

    opts = {
      -- See below for config options
      nx_cmd_root = "npx nx",
    },

    -- Plugin will load when you use these keys
    keys = {
      { "<leader>nx", "<cmd>Telescope nx actions<CR>", desc = "nx actions" },
    },
  },
  {
    "heavenshell/vim-jsdoc",
    lazy = false,
    ft = { "javascript", "javascript.jsx", "typescript", "typescript.tsx" },
    build = "make install",
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFile",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },
}
