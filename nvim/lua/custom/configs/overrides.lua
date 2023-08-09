local M = {}

M.treesitter = {
  ensure_installed = {
    -- lua
    "lua",

    -- typescript
    "typescript",
    "tsx",

    -- python
    "python",

    -- go
    "go",

    -- css
    "css",
    "scss",

    -- html
    "html",

    -- dockerfile
    "dockerfile",

    -- json
    "json",

    -- markdown
    "markdown",

    -- prisma
    "prisma",

    -- rust
    "rust",

    -- haskell
    "haskell",

    -- c/c++
    "c",
    "cpp",
    "cuda",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  automatic_installation = true,
  ensure_installed = {
    -- lua stuff
    "lua-language-server", -- lsp server
    "stylua", -- formatter

    -- typescript stuff
    "typescript-language-server",
    "prettierd", -- formatter
    "eslint_d", -- linter

    -- python stuff
    "pyright", -- lsp server
    "autoflake", -- formatter
    "black", -- formatter
    "isort", -- formatter
    "flake8", -- linter

    -- go stuff
    "gopls", -- lsp server
    "gofumpt", -- formatter
    "golines", -- formatter
    "goimports", -- formatter
    "golangci-lint", -- linter

    -- web stuff
    "html-lsp", -- lsp server
    "css-lsp", -- lsp server

    -- docker stuff
    "dockerfile-language-server", -- lsp server
    "docker-compose-language-service", -- lsp server

    -- json stuff
    "json-lsp", -- lsp server
    "jsonlint", -- linter

    -- markdown stuff
    "grammarly-languageserver", -- lsp server
    "markdownlint", -- linter

    -- prisma stuff
    "prisma-language-server", -- lsp server

    -- graphql stuff
    "graphql-language-service-cli",

    -- rust stuff
    -- [[ lsp is in typescript-tools ]] --

    -- haskell stuff
    "haskell-language-server", -- lsp server
    "fourmolu", -- formatter

    -- c/cpp stuff
    "clangd", -- lsp server
    "clang-format", -- formatter

    -- java stuff
    "jdtls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
