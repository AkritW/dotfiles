return {
    "neoclide/coc.nvim",
    branch = "release",
    build = function()
      vim.fn.system({'npm', 'install'})
    end,
    config = function()
      -- Configuration for coc.nvim goes here
      vim.cmd [[
        " Use tab for trigger completion with characters ahead and navigate
        inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

        " Other example configurations
        inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
        inoremap <silent><expr> <C-space> coc#refresh()
        nnoremap <silent> gd <Plug>(coc-definition)
        nnoremap <silent> gy <Plug>(coc-type-definition)
        nnoremap <silent> gi <Plug>(coc-implementation)
        nnoremap <silent> gr <Plug>(coc-references)
      ]]
    end,
    lazy = false,
}
