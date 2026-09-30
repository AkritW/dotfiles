require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local set_keymap = vim.api.nvim_set_keymap

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
--
--
-- ----------------------
-- -- BEGIN COC CONFIG --
-- ----------------------
local opts = { noremap = true, silent = true, expr = true }

-- Use tab for trigger completion with characters ahead and navigate
set_keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_backspace() ? "\\<Tab>" : coc#refresh()', opts)
set_keymap("i", "<S-TAB>", 'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-h>"', opts)
-- map("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
-- map("i", "<C-space>", [[coc#refresh()]], { noremap = true, silent = true, expr = true })
--
-- -- Check for backspace
-- _G.check_backspace = function()
--   local col = vim.fn.col('.') - 1
--   return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
-- end

-- Use `[g` and `]g` to navigate diagnostics
map("n", "[d", "<Plug>(coc-diagnostic-prev)", { noremap = false, silent = true })
map("n", "]d", "<Plug>(coc-diagnostic-next)", { noremap = false, silent = true })

-- GoTo code navigation
map("n", "gd", "<Plug>(coc-definition)", { noremap = false, silent = true })
map("n", "gy", "<Plug>(coc-type-definition)", { noremap = false, silent = true })
map("n", "gi", "<Plug>(coc-implementation)", { noremap = false, silent = true })
map("n", "gr", "<Plug>(coc-references)", { noremap = false, silent = true })

-- Use K to show documentation in preview window
map("n", "K", ":lua ShowDocumentation()<CR>", { noremap = true, silent = true })

function ShowDocumentation()
  if vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.fn.feedkeys('K', 'in')
  end
end

-- Highlight the symbol and its references when holding the cursor
vim.cmd [[autocmd CursorHold * silent call CocActionAsync('highlight')]]

-- Symbol renaming
map("n", "<leader>rn", "<Plug>(coc-rename)", { noremap = false, silent = true })

-- -- Formatting selected code
-- map("x", "<leader>f", "<Plug>(coc-format-selected)", { noremap = false, silent = true })
-- map("n", "<leader>f", "<Plug>(coc-format-selected)", { noremap = false, silent = true })

-- -- Applying code actions to the selected code block
-- map("x", "<leader>a", "<Plug>(coc-codeaction-selected)", { noremap = false, silent = true })
-- map("n", "<leader>a", "<Plug>(coc-codeaction-selected)", { noremap = false, silent = true })
--
-- Remap keys for applying code actions at the cursor position
map("n", "<leader>ca", "<Plug>(coc-codeaction-cursor)", { noremap = false, silent = true })
--
-- -- Remap keys for apply code actions affect whole buffer
-- map("n", "<leader>as", "<Plug>(coc-codeaction-source)", { noremap = false, silent = true })
--
-- -- Apply the most preferred quickfix action to fix diagnostic on the current line
-- map("n", "<leader>qf", "<Plug>(coc-fix-current)", { noremap = false, silent = true })
--
-- Remap keys for applying refactor code actions
map("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { noremap = false, silent = true })
map("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { noremap = false, silent = true })
map("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { noremap = false, silent = true })
--
-- -- Run the Code Lens action on the current line
-- map("n", "<leader>cl", "<Plug>(coc-codelens-action)", { noremap = false, silent = true })
--
-- -- Map function and class text objects
-- map("x", "if", "<Plug>(coc-funcobj-i)", { noremap = false, silent = true })
-- map("o", "if", "<Plug>(coc-funcobj-i)", { noremap = false, silent = true })
-- map("x", "af", "<Plug>(coc-funcobj-a)", { noremap = false, silent = true })
-- map("o", "af", "<Plug>(coc-funcobj-a)", { noremap = false, silent = true })
-- map("x", "ic", "<Plug>(coc-classobj-i)", { noremap = false, silent = true })
-- map("o", "ic", "<Plug>(coc-classobj-i)", { noremap = false, silent = true })
-- map("x", "ac", "<Plug>(coc-classobj-a)", { noremap = false, silent = true })
-- map("o", "ac", "<Plug>(coc-classobj-a)", { noremap = false, silent = true })
--
-- -- Remap <C-f> and <C-b> to scroll float windows/popups
-- if vim.fn.has('nvim-0.4.0') or vim.fn.has('patch-8.2.0750') then
--   map("n", "<C-f>", [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]], opts)
--   map("n", "<C-b>", [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]], opts)
--   map("i", "<C-f>", [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"]], opts)
--   map("i", "<C-b>", [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"]], opts)
--   map("v", "<C-f>", [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]], opts)
--   map("v", "<C-b>", [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]], opts)
-- end
--
-- -- Use CTRL-S for selections ranges
-- -- Requires 'textDocument/selectionRange' support of language server
-- map("n", "<C-s>", "<Plug>(coc-range-select)", { noremap = false, silent = true })
-- map("x", "<C-s>", "<Plug>(coc-range-select)", { noremap = false, silent = true })
--
-- -- Add `:Format` command to format current buffer
-- vim.cmd [[command! -nargs=0 Format :call CocActionAsync('format')]]
--
-- -- Add `:Fold` command to fold current buffer
-- vim.cmd [[command! -nargs=? Fold :call CocAction('fold', <f-args>)]]
--
-- -- Add `:OR` command for organize imports of the current buffer
-- vim.cmd [[command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')]]
--
-- -- Add (Neo)Vim's native statusline support
-- -- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- -- provide custom statusline: lightline.vim, vim-airline
-- vim.opt.statusline = "%{coc#status()}%{get(b:,'coc_current_function','')}"
--
-- -- Mappings for CoCList
-- map("n", "<space>a", ":<C-u>CocList diagnostics<CR>", { noremap = true, silent = true })
-- map("n", "<space>X", ":<C-u>CocList extensions<CR>", { noremap = true, silent = true })
-- map("n", "<space>c", ":<C-u>CocList commands<CR>", { noremap = true, silent = true })
-- map("n", "<space>o", ":<C-u>CocList outline<CR>", { noremap = true, silent = true })
-- map("n", "<space>s", ":<C-u>CocList -I symbols<CR>", { noremap = true, silent = true })
-- map("n", "<space>j", ":<C-u>CocNext<CR>", { noremap = true, silent = true })
-- map("n", "<space>k", ":<C-u>CocPrev<CR>", { noremap = true, silent = true })
-- map("n", "<space>p", ":<C-u>CocListResume<CR>", { noremap = true, silent = true })
-- --------------------
-- -- END COC CONFIG --
-- --------------------
--
-- Auto-formatting settings
vim.cmd([[
  augroup my_auto_format
    autocmd!
    autocmd BufWritePre * call CocAction('format')
  augroup END
]])
