command! -nargs=* VcLog silent echo '<args>'

let s:vc_home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
VcLog vc_home:'s:vc_home'
exec 'set rtp+='.s:vc_home

function! s:VcIncImpl(scrpath)
    VcLog include path:'a:scrpath'
    execute 'source '.s:vc_home.'/'.a:scrpath
endfunction

command! -nargs=* VcInc call s:VcIncImpl('<args>')

VcInc vc/vcbasic.vim
VcInc vc/vckeymap.vim
VcInc vc/vcplug.vim
VcInc vc/vcplugconf.vim
