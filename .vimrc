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

" cscope database setting
cs add ~/cscope/cscope.out . -C
nnoremap <F1> :cs add ~/cscope/cscope.out<CR>
nnoremap <F5> :cs find g <cword><CR>
nnoremap <F4> :cs find c <cword><CR>
nnoremap <F3> :cs find s <cword><CR>
nnoremap <F2> :cs find f 
nnoremap <F8> :cs kill 0<CR>:cs kill 1<CR>:cs kill 2<CR>cs kill 3<CR>cs kill 4<CR>cs kill 5<CR>cs kill 6<CR>cs kill 7<CR>cs kill 8<CR>cs kill 9<CR>
nnoremap <F9> :!find . -name '*.c' -o -name '*.h' -o -name '*.cpp' -o -name '*.hpp' -o -name '*.py' > ./cscope.filelist && cscope -bqki ./cscope.filelist && rm ./cscope.filelist<CR>
nnoremap <F10> :cs add ./cscope.out . -C<CR>

" ignore key setting
nnoremap <S-h> <Nop>
nnoremap <S-j> <Nop>
nnoremap <S-k> <Nop>
nnoremap <S-l> <Nop>
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
