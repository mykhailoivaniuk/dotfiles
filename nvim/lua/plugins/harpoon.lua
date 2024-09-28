return {
	-- This config is for Harpoon 1 and i actually like it more, so I'll keep it
	{
		"ThePrimeagen/harpoon",
		opts = {
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
			},
			settings = {
				save_on_toggle = true,
			},
		},
		init = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")
			vim.keymap.set("n", "<leader>a", mark.add_file)
			vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
			vim.keymap.set("n", "<C-h>", function()
				ui.nav_next()
			end)
			vim.keymap.set("n", "<C-t>", function()
				ui.nav_prev()
			end)
		end,
	},
}
-- This config works for Harpoon 2, but switching between the files is ass,
-- so switching back to older version
--{
--  "ThePrimeagen/harpoon",
--  branch = "harpoon2",
--  opts = {
--    menu = {
--      width = vim.api.nvim_win_get_width(0) - 4,
--    },
--    settings = {
--      save_on_toggle = true,
--    },
--  },
--  keys = {
--      {
--        "<leader>a",
--        function()
--          require("harpoon"):list():add()
--        end,
--        desc = "Add file to be tracked by Harpoon",
--      },
--      {
--        "<C-e>",
--        function()
--          local harpoon = require("harpoon")
--          harpoon.ui:toggle_quick_menu(harpoon:list())
--        end,
--        desc = "Harpoon Quick Menu",
--      },
--      {
--	"<C-h>",
--	function()
--	  require("harpoon"):list():select(1)
--	end,
--	desc = "Go to next file tracked by Harpoon"
--      },
--    }
--
--}
