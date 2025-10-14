-- to close the snacks.nvim as soon as I open a file file tree for neo vim 
return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      actions = {
        files = {
          ["<CR>"] = function(ctx)
            -- Open file and close explorer
            ctx:open()
              vim.schedule(function()
                vim.cmd("lua Snacks.explorer.open()")
              end)
          end,
        },
      },
    },
  },
}
