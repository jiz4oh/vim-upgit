if exists('g:loaded_upgit')
  finish
endif
let g:loaded_upgit = 1

if !exists('g:upgit_no_defult')
  augroup upgit
    autocmd!

    autocmd FileType markdown let b:upgit_opts = '--output-format markdown'
  augroup END

  command! -nargs=* Upgit let @+=upgit#upload(<f-args>)
  command! -nargs=* UpgitClipboard let @+=upgit#upload(':clipboard')
endif

if !exists('g:upgit_bin_path')
  let s:binary_dir = expand('<sfile>:p:h:h')
  let g:upgit_bin_path = s:binary_dir. '/upgit'

  command! -nargs=* UpgitConfig call upgit#config#edit(s:binary_dir)
endif

if !exists('g:upgit_opts')
  let g:upgit_opts = ''
endif
