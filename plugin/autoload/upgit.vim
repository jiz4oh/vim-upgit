let s:results = []

function! s:opts(opts) abort
  if empty(a:opts) || a:opts[0] !=# '-'
    let default = 'upgit_opts'
    return get(b:, default, get(g:, default))
  endif

  return a:opts
endfunction

function! s:upload(...) abort
  if a:0 > 1
    let path = a:1
    let opts = join(a:000[1:-1], ' ')
  elseif a:0 == 1
    let path = a:1
    let opts = ''
  else
    return
  endif

  if path !~# '^:'
    let path = fnamemodify(expand(path), ':p')
  end

  let upgit = exepath(expand(g:upgit_bin_path))

  if empty(upgit)
    throw 'please make sure ' . g:upgit_bin_path . ' is executable'
  endif

  let expr = upgit
        \.' ' . shellescape(path)
        \.' ' . s:opts(opts)

  return system(expr)
endfunction

function! upgit#upload(...) abort
  if a:0 == 0
    let output = call(function('s:upload'), ['%'])
  else
    let output = call(function('s:upload'), a:000)
  endif
  call add(s:results, output)
  echo output
  return output
endfunction

function! upgit#results() abort
  return s:results
endfunction

function! upgit#last() abort
  if empty(s:results)
    return
  else
    return s:results[-1]
  endif
endfunction
