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
" If it is 0, you'll be asked to confirm to quit only the last window; otherwise, any window.
" (default: 0)
let g:confirm_quit_any_window = 1
```
