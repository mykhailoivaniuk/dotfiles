return {
	{
        -- sourcehut git repo
        "https://git.sr.ht/~p00f/alabaster.nvim",
        name = "alabaster.nvim", -- optional, but nice to have
        lazy = false,            -- load on startup
        priority = 1000,         -- load before other UI plugins
        config = function()
            -- choose background you want
            vim.o.background = "dark" -- or "light"

            -- apply the colorscheme
            vim.cmd.colorscheme("alabaster")
        end,
    }

	-- { -- You can easily change to a different colorscheme.
	-- 	-- Change the name of the colorscheme plugin below, and then
	-- 	-- change the command in the config to whatever the name of that colorscheme is.
	-- 	--
	-- 	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000, -- Make sure to load this before all the other start plugins.
	-- 	init = function()
	-- 		-- Load the colorscheme here.
	-- 		-- Like many other themes, this one has different styles, and you could load
	-- 		-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
	-- 		vim.cmd.colorscheme("tokyonight-moon")

	-- 		vim.opt.colorcolumn = "80"

	-- 		vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#24283b" })
	-- 	end,
	-- },
}
