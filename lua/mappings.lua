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

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
