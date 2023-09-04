" This is made to share clipboard with the OS
set clipboard+=unnamedplus
set ignorecase




" This is done so we can use comment command in vscode. I got it from the extension wiki
function! s:vscodeCommentary(...) abort
    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    elseif a:0 > 1
        let [line1, line2] = [a:1, a:2]
    else
        let [line1, line2] = [line("'["), line("']")]
    endif

    call VSCodeCallRange('editor.action.commentLine', line1, line2, 0)
endfunction


command! -range -bar VSCodeCommentary call s:vscodeCommentary(<line1>, <line2>)

xnoremap <expr> <Plug>VSCodeCommentary <SID>vscodeCommentary()
nnoremap <expr> <Plug>VSCodeCommentary <SID>vscodeCommentary()
nnoremap <expr> <Plug>VSCodeCommentaryLine <SID>vscodeCommentary() . '_'

" Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
xnoremap <expr> <C-/> <SID>vscodeCommentary()
nnoremap <expr> <C-/> <SID>vscodeCommentary() . '_'

" end of copypasted code

" I have mapped ctrl+shift+c to <C-/> in vscode, that is why that command works




" Prevent O from copying // if we are standing on a commented line
" It does have the problem that indentation is not preserved, but I guess thats ok
nnoremap O :set paste<CR>O<Esc>:set nopaste<CR>a
nnoremap o :set paste<CR>o<Esc>:set nopaste<CR>a




" Suddenly matching with % broke, now I need this for it to work: 
runtime macros/matchit.vim 

