-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "rust_analyzer", "pyright", "ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
-- LSPs with default config
for _, lsp in ipairs(servers) do
  if lsp == "rust_analyzer" then
    -- Custom configuration for rust_analyzer
    lspconfig.rust_analyzer.setup {

      on_attach = function(client, bufnr)
        -- Default on_attach logic
        nvlsp.on_attach(client, bufnr)
        vim.lsp.inlay_hint.enable(true)
        -- Explicitly enable inlay hints if supported
        if vim.lsp.buf.inlay_hint then
          vim.lsp.buf.inlay_hint(bufnr, true)
        end
      end,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importGranularity = "module",
            importPrefix = "by_self",
          },
          cargo = {
            loadOutDirsFromCheck = true,
            allFeatures = true,
          },
          checkOnSave = {
            command = "clippy",
          },
          procMacro = {
            enable = true,
          },
          inlayHints = {
            enable = true,
            typeHints = true,
            parameterHints = true,
            chainingHints = true,
            maxLength = 25, -- Maximum length for inline hints
          },
        },
      },
    }
  else
    -- Default configuration for other servers
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end
end
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

require("crates").setup {
  lsp = {
    enabled = true,
    on_attach = function(client, bufnr)
      -- the same on_attach function as for your other lsp's
    end,
    actions = true,
    completion = true,
    hover = true,
  },
}
require("crates").setup {
  completion = {
    crates = {
      enabled = true, -- disabled by default
      max_results = 8, -- The maximum number of search results to display
      min_chars = 3, -- The minimum number of charaters to type before completions begin appearing
    },
  },
}

--
