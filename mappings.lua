-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<M-k>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
    ["<M-j>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
    ["<M-h>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
    ["<M-l>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },
    -- quick sav#000000e
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true }mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-J>"] = { "copilot#Accept(<Tab>)", silent = true, expr = true, script = true }
  }
}
