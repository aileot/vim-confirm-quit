let g:confirm_quit_only_last_window =
  \ get(g:, 'confirm_quit_only_last_window', 1)

augroup confirm_quit
  au!
  au QuitPre *
       \ if (!g:confirm_quit_only_last_window
       \    || tabpagenr('$') == 1 && winnr('$') == 1)
       \    && confirm('Do you really want to quit?', "&Yes\n&No", 2) != 1
       \ | split %:p
       \ | endif
augroup END
