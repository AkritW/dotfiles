return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    enabled = false,
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    enabled = false,
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

 {
   "nvchad/ui",
    config = function()
      require "nvchad" 
    end
 },

  {
  	"williamboman/mason.nvim",
    enabled = false,
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier"
  		},
  	},
  },
  {
    'windwp/nvim-autopairs',
    enabled = false,
  },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  {
	  "L3MON4D3/LuaSnip",
    enabled = false,
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
  		   "html", "css", "javascript", "typescript", "tsx"
  		},
  	},
  },
}
