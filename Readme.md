## Installation Instructions
1. Make sure you have rust installed
2. Make sure you have golang installed
3. Install ripgrep 
4. Install fzf
5. Download nvim.tar.gz and place it under ~/.config/nvim
6. Launch nvim and run `Lazy sync`  followed by `Lazy restore`


## Plugins and Keybindings
Each plugin configures their own keybindings and other relavant config 
in `plugin.lua` file. 

Most important plugins are:
 - `lsp.lua` -> Sets up most of the intellisense and code aware actions like
   completions, snippets etc
- `telescope.lua` -> fuzzy finder for files and strings
- `treesitter.lua` -> fast language parser
- `harpoon.lua` -> fast file switching
