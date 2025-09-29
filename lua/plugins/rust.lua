return {
  -- Ensure LazyVim's default Rust support is disabled
  {
    "LazyVim/LazyVim",
    opts = {
      -- Disable any default Rust language support
      defaults = {
        autocmds = false,
        keymaps = false,
      },
    },
  },

  -- Rust-specific enhancements (rustaceanvim handles LSP automatically)
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    lazy = false, -- Load immediately, not just on filetype
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        -- Enable rust-analyzer
        server = {
          auto_attach = true,
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              checkOnSave = {
                enable =true,  -- Disable automatic cargo check
              },
              procMacro = {
                enable = true,
              },
              formatting = {
                enable = false,  -- Disable rust-analyzer formatting
              },
            },
          },
          on_attach = function(client, bufnr)
            -- Custom keymaps for Rust
            local opts = { buffer = bufnr, silent = true }
            vim.keymap.set("n", "<leader>cR", function()
              vim.cmd.RustLsp("codeAction")
            end, opts)
            vim.keymap.set("n", "<leader>dr", function()
              vim.cmd.RustLsp("debuggables")
            end, opts)
          end,
        },
      }
    end,
  },

  -- Explicitly disable rust_analyzer in lspconfig (rustaceanvim handles it)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = false, -- Disable, let rustaceanvim handle it
      },
    },
  },

  -- Keep crates.nvim for Cargo.toml features
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
  },
}
