return {
   {
     'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
      keys = {
	{"<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Search files"},
	{"<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Search by Grep"},
	{"<leader>pw", "<cmd>Telescope grep_string<cr>", desc = "Search current word"},
	{"<C-p>", "<cmd>Telescope git_files<cr>", desc = "Only search through git files"},
	{"<A-e>", "<cmd>Telescope oldfiles<cr>", desc = "Search through recent files"}
      }}
}
