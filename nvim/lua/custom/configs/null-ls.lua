local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- Lua
  b.formatting.stylua,

  -- TypeScript
  b.formatting.prettierd,
  b.diagnostics.eslint_d,

  -- Python
  b.diagnostics.flake8,
  b.formatting.autoflake,
  b.formatting.black,
  b.formatting.isort,

  -- Go
  b.formatting.gofumpt,
  b.formatting.golines,
  b.formatting.goimports,
  b.diagnostics.golangci_lint,

  -- JSON
  b.diagnostics.jsonlint,

  -- Markdown
  b.diagnostics.markdownlint,

  -- Haskell
  b.formatting.fourmolu,

  -- C/C++
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnf = bufnr }
        end,
      })
    end
  end,
}
