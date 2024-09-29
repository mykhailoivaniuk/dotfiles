-- Remap leader to space
vim.g.mapleader = " "
-- Trigger Explore command that opens Nerdtree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- next greatest remap ever : asbjornHaland
-- leader y copies into system clipboard -> +register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("i", "hj", "<Esc>")
vim.keymap.set("v", "hj", "<Esc>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- moves selected block up/down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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

-- deleting shit into void register -> its not in copy anymore
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- quicksearch navigation - no idea what this shit is
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace the word i'm on at every location
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make shit executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
