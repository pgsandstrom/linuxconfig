" This is made to share clipboard with the OS
set clipboard+=unnamedplus
set ignorecase



" Prevent O from copying // if we are standing on a commented line
" It does have the problem that indentation is not preserved, but I guess thats ok
nnoremap O :set paste<CR>O<Esc>:set nopaste<CR>a
nnoremap o :set paste<CR>o<Esc>:set nopaste<CR>a




" Suddenly matching with % broke, now I need this for it to work: 
runtime macros/matchit.vim 


" only load this plugin if we are not using nvim
" TODO this is currently disabled since I understand nothing about vim plugins. Maybe abandon vim forever and only use nvim?
" if !has('nvim')
"	Plug 'tpope/vim-surround'
" endif


" only load this config file if we are using nvim
if has('nvim')
	luafile ~/.config/nvim/init.lua
endif
