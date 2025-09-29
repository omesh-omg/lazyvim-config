return {
  -- Disable all built-in TypeScript servers (using typescript-tools instead)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable ALL TypeScript servers to avoid conflicts
        tsserver = false,
        ts_ls = false, 
        vtsls = false,
        -- ESLint
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },
        -- CSS/SCSS
        cssls = {},
        -- HTML
        html = {},
        -- JSON
        jsonls = {},
        -- Tailwind CSS (if using)
        tailwindcss = {
          filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        },
      },
    },
  },

  -- Enhanced TypeScript features
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {
      settings = {
        separate_diagnostic_server = true,
        expose_as_code_action = {},
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },

  -- React/React Native snippets and utilities
  {
    "mlaursen/vim-react-snippets",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },

  -- Enhanced JSX/TSX support
  {
    "maxmellon/vim-jsx-pretty",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },

  -- Auto-close JSX tags
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = {
          "html", "xml", "javascript", "javascriptreact", "typescript", "typescriptreact"
        },
      })
    end,
  },

  -- Package.json management
  {
    "vuki656/package-info.nvim",
    ft = "json",
    config = function()
      require("package-info").setup()
      -- Show package versions in package.json
      vim.keymap.set("n", "<leader>ns", require("package-info").show, { desc = "Show package info" })
      vim.keymap.set("n", "<leader>nc", require("package-info").hide, { desc = "Hide package info" })
      vim.keymap.set("n", "<leader>nt", require("package-info").toggle, { desc = "Toggle package info" })
      vim.keymap.set("n", "<leader>nu", require("package-info").update, { desc = "Update package" })
      vim.keymap.set("n", "<leader>nd", require("package-info").delete, { desc = "Delete package" })
    end,
  },

  -- React Native specific
  {
    "akinsho/flutter-tools.nvim", -- Also works for React Native debugging
    lazy = true,
    ft = { "dart", "javascript", "typescript" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
  },

  -- REST client alternative (rest.nvim has dependency issues)
  -- Use :Telescope live_grep to search API calls instead
  -- Or use external tools like curl, postman, etc.

  -- Better folding for large React components
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}