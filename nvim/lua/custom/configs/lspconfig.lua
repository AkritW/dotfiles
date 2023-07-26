local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- -- if you just want default config for the servers then put them in a table
-- local servers = { "html", "cssls", "tsserver", "clangd" }
--
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "lua" },
  root_dir = util.root_pattern(".init.lua", ".git"),
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  root_dir = util.root_pattern("tsconfig.json", "package.json", ".git"),
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "literal",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  root_dir = util.root_pattern("pyproject.toml", "poetry.lock", "requirements.txt", ".git"),
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", "go.sum", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "html-languageserver", "--studio" },
  filetypes = { "html" },
  root_dir = util.root_pattern("package.json", ".git"),
  provideFormatter = true,
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "css-languageserver", "--studio" },
  filetypes = { "css", "scss", "sass", "module" },
  root_dir = util.root_pattern("package.json", ".git"),
}

lspconfig.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "docker-langserver", "--studio" },
  filetypes = { "Dockerfile", "docker-compose.yml", "Dockerfile.*" },
}

lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json" },
  init_options = {
    provideFormatter = true,
  },
  single_file_support = true,
}

lspconfig.grammarly.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "grammarly-languageserver", "--studio" },
  filetypes = { "markdown" },
}

lspconfig.prismals.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "prisma-language-server", "--studio" },
  filetypes = { "prisma" },
}

lspconfig.graphql.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "graphql-lsp", "server", "-m", "stream" },
  filetypes = { "graphql", "typescriptreact", "javascriptreact" },
  root_dir = util.root_pattern(".graphqlrc*", ".graphql.config.*", "graphql.config.*", ".git"),
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern("Cargo.toml", "Cargo.lock", "rust-project.json", ".git"),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

lspconfig.hls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "html-language-server-wrapper", "--lsp" },
  filetypes = { "haskell" },
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "cuda" },
  root_dir = util.root_pattern("Makefile", ".git"),
}
