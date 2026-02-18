-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
})
require("nvim-treesitter").install({
	"bash",
	"c",
	"cpp",
	"css",
	"comment",
	"go",
	"html",
	"java",
	"javascript",
	"json",
	"perl",
	"php",
	"lua",
	"python",
	"rust",
	"toml",
	"yaml",
	"tsx",
	"typescript",
	"vimdoc",
	"vim",
	"markdown",
	"markdown_inline",
})
