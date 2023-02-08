function Colors(color)
	color = color or "tokyonight-moon"
	vim.cmd.colorscheme(color)
	-- set bg to be transparent
	--vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	--vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end
Colors()
