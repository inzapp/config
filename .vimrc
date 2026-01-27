if has ("syntax")
    syntax on
endif
colorscheme onehalfdark
set hlsearch
set incsearch
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set fileencoding=utf8
set wildmenu
set wildmode=longest:full,full

" visual bell off in git bash terminal
set t_vb=

" auto refresh current file content when updated from outer space
set autoread
if ! exists("g:CheckUpdateStarted")
    let g:CheckUpdateStarted=1
    call timer_start(1,'CheckUpdate')
endif
function! CheckUpdate(timer)
    silent! checktime
    call timer_start(1000,'CheckUpdate')
endfunction

" set cursor position to last closed cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" highlight color setting
" hi Search term=standout ctermfg=0 ctermbg=10
" hi! Visual cterm=none ctermfg=none ctermbg=242
" highlight clear StatusLine
" hi! StatusLine ctermfg=242 ctermbg=black

" cscope/ctags setting
set cscopetag
set csto=0
set tags=~/cscope/tags
cs add ~/cscope/cscope.out . -C
nnoremap <F1> :exec "cs add ~/cscope/cscope.out . -C"<Bar>exec "set tags=~/cscope/tags"<CR>
nnoremap <F2> :cs find f 
nnoremap <F3> :cs find s <cword><CR>
nnoremap <F4> :cs find c <cword><CR>
nnoremap <F5> :exec "tjump " . expand("<cword>")<CR>
nnoremap <F8> :cs kill -1<CR>
nnoremap <F9> :!find . -name '*.c' -o -name '*.h' -o -name '*.cpp' -o -name '*.hpp' -o -name '*.py' > ./cscope.filelist && cscope -bq -i ./cscope.filelist && ctags -L ./cscope.filelist && rm ./cscope.filelist<CR>
nnoremap <F12> :exec "cs add ./cscope.out . -C"<Bar>exec "set tags=tags"<CR>

" ignore key setting
nnoremap <S-h> <Nop>
nnoremap <S-j> <Nop>
nnoremap <S-k> <Nop>
nnoremap <S-l> <Nop>
vnoremap <S-h> <Nop>
vnoremap <S-j> <Nop>
vnoremap <S-k> <Nop>
vnoremap <S-l> <Nop>
xnoremap <S-h> <Nop>
xnoremap <S-j> <Nop>
xnoremap <S-k> <Nop>
xnoremap <S-l> <Nop>
nnoremap gn <Nop>
nnoremap & <Nop>
nnoremap ( <Nop>
nnoremap ) <Nop>

" tab key setting
map th :tabprev<CR>
map tl :tabnext<CR>
map tn :tabnew %<CR>
map td :tabclose<CR>
map t[ :tabmove-<CR>
map t] :tabmove+<CR>
map tu :Ex<CR>
