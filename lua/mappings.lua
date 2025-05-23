require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<C-l>", function()
  return vim.fn["copilot#Accept"]()
end, {
  desc = "Copilot Accept",
  silent = true,
  expr = true, -- Ensure this is treated as an expression mapping
  noremap = true,
  replace_keycodes = false,
})

map("n", "K", vim.diagnostic.open_float, { desc = "Show full diagnostic" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
map("n", "<leader>q", function()
 -- Schließt Location und Quickfix
  vim.cmd("lclose")
  vim.cmd("cclose")

  -- Wenn aktuelles Fenster ein Terminal ist, dann schließe es
  local buftype = vim.api.nvim_buf_get_option(0, "buftype")
  if buftype == "terminal" then
    vim.cmd("bd!") -- oder :q wenn du kein Buffer Kill willst
  end
end, { desc = "Close everything (quickfix, loclist, terminal)" })
map("n", "<leader>mg", ":Glow<CR>", { desc = "Glow Preview" })
map("n", "<leader>gg", ":Neogit<CR>", { desc = "Git" })
