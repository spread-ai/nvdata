-- Load NvChad defaults (keymaps, diagnostics, capabilities, etc.)
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- Helper to enable inlay hints on attach (works across 0.9/0.10/0.11)
local function on_attach_with_inlay(client, bufnr)
  if nvlsp.on_attach then
    nvlsp.on_attach(client, bufnr)
  end
  -- Neovim 0.10+ API
  if vim.lsp.inlay_hint then
    -- new style (0.10): vim.lsp.inlay_hint(bufnr, true)
    local ok = pcall(vim.lsp.inlay_hint, bufnr, true)
    if not ok and vim.lsp.inlay_hint.enable then
      -- older style (0.9): vim.lsp.inlay_hint.enable(true)
      pcall(vim.lsp.inlay_hint.enable, true)
    end
  end
end

-- Generic servers
for _, name in ipairs { "yamlls", "html", "cssls", "pyright", "ts_ls" } do
  vim.lsp.config(name, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

-- rust_analyzer (with your settings)
vim.lsp.config("rust_analyzer", {
  on_attach = on_attach_with_inlay,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    ["rust-analyzer"] = {
      assist = { importGranularity = "module", importPrefix = "by_self" },
      cargo = { loadOutDirsFromCheck = true, allFeatures = true },
      checkOnSave = true,
      check = { command = "clippy" },
      procMacro = { enable = true },
      inlayHints = {
        enable = true,
        typeHints = true,
        parameterHints = true,
        chainingHints = true,
        maxLength = 25,
      },
    },
  },
})

-- tsserver (ts_ls) with your inlay hints
vim.lsp.config("ts_ls", {
  on_attach = on_attach_with_inlay,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    typescript = {
      tsserver = { useSyntaxServer = false },
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})

-- If you want eager startup (optional): start LSPs for current buffer type
-- Most users can omit this; Neovim will auto-start on first LSP-eligible buffer.
-- vim.lsp.enable({ "rust_analyzer", "ts_ls", "pyright", "html", "cssls", "yamlls" })

-- crates.nvim — unchanged
require("crates").setup {
  lsp = {
    enabled = true,
    on_attach = function(client, bufnr)
      -- use same on_attach if you want:
      -- nvlsp.on_attach(client, bufnr)
    end,
    actions = true,
    completion = true,
    hover = true,
  },
}
require("crates").setup {
  completion = {
    crates = {
      enabled = true,
      max_results = 8,
      min_chars = 3,
    },
  },
}
