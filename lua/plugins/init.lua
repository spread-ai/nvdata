return {
  -- Formatter
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- format-on-save
    opts = require "configs.conform",
  },

  -- Mason + Mason-LSP
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    config = true,
  },
  {
    "pest-parser/pest.vim",
    ft = "pest", -- load it only for .pest files
  },
  {
    "nvimtools/none-ls.nvim",
  },
  {
    "MunifTanjim/prettier.nvim",
    lazy = false,
    cmd = "Prettier",
    config = function()
      require("prettier").setup {
        bin = "prettier", -- oder "prettierd" wenn du es global hast
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "json",
          "css",
          "scss",
          "html",
          "markdown",
        },
      }
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = false,
    opts = {
      ensure_installed = {
        "rust_analyzer",
        "lua_ls",
        "yamlls",
        "ts_ls",
        "pyright",
        "html",
        "cssls",
        "ruff",
      },
    },
  },

  -- LSPConfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Crates
  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      require("crates").setup()
    end,
  },

  -- Copilot
  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  --   config = function()
  --     vim.g.copilot_no_tab_map = true
  --     vim.g.copilot_assume_mapped = true
  --     vim.g.copilot_tab_fallback = ""
  --   end,
  -- },
  -- supermaven
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup ({
        keymaps = {
          accept_suggestion = "<C-y>", -- Accept suggestion
          clear_suggestion = "<C-]>", -- Clear suggestion (optional)
          accept_word = "<C-j>", -- Accept one word (optional)
        },
        disable_keymaps = false, -- keep keymaps enabled so the above works
      })
    end,
    lazy = false,
  },
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "yaml",
        "rust",
        "typescript",
        "tsx",
      },
    },
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
    lazy = false,
  },
}
