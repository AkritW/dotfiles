local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- custom tools outside of mason
local mason_registry = require "mason-registry"
local typescript_tools = require "typescript-tools"
local rust_tools = require "rust-tools"

typescript_tools.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    separate_diagnostic_server = true,
    publish_diagnostic_on = "insert_leave",
    expose_as_code_action = {},
    tsserver_plugins = {},
    tsserver_max_memory = "auto",
    tsserver_format_options = {},
    tsserver_file_preferences = {},
    complete_function_calls = false,
  },
}

rust_tools.setup {
  on_attach = function(_, bufnr)
    vim.keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
    vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
  end,
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "lua" },
  root_dir = util.root_pattern(".init.lua", ".git"),
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

lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "java" },
  root_dir = util.root_pattern("build.gradle", "mvnw", "gradlew", ".git"),
}
