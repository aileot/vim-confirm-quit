# vim-confirm-quit

vim-confirm-quit prevents you from quitting vim/neovim unexpectedly.
This plugin will never overwrite your mappings.

## NOTICE

Currently, this plugin cannot prevent `:qa` or `:xa`.
Any ideas are welcome to stop them by `:autocmd`.

## Installation

Install the plugin using your favorite package manager.

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'aileot/vim-confirm-quit'
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use "aileot/vim-confirm-quit"
```

[dein.vim](https://github.com/Shougo/dein.vim) in toml:

```toml
[[plugin]]
repo = 'aileot/vim-confirm-quit'
```

## Usage

```vim
" Set 0 to confirm any window to quit
" (default: 1)
let g:confirm_quit_only_last_window = 1
```