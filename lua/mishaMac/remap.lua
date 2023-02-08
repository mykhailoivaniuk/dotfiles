vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "hj", "<Esc>")
vim.keymap.set("v", "hj", "<Esc>")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- moves selected block up/down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

 -- appends line below to the cur line with 
vim.keymap.set("n", "J", "mzJ`z")

-- d moves within file down like 1/3 of it 
-- u moves up - half-page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- moves between next/prev location of current word
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")


-- greatest remap ever
-- for keeping the replacement value in the register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- leader y copies into system clipboard -> +register
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- deleting shit into void register -> its not in copy anymore
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
-- for saving changes in vertical mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- c-f doesn't work cause i don't have tmux sessionizer
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quicksearch navigation - no idea what this shit is
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


-- Replace the word i'm on at every location
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make shit executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

