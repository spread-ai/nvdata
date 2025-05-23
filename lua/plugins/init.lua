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
    config = true, -- nimmt defaults
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
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
    end,
  },

  -- Treesitter  ✨  <<–– Hier war der Fehler
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { -- <-- diese Ebene fehlte
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
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
    lazy = false,
  },
}
