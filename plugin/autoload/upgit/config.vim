function! upgit#config#edit(dir) abort
  let path = a:dir . '/config.toml'
  if filereadable(path)
    execute 'e ' . path
  else
    execute 'e ' . path
    call setline(1, readfile(a:dir . '/config.sample.toml'))
  endif
endfunction
