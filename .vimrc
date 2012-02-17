"""""""""""""""""""""""""""""""""""""""""""""""""
"  Script: Rykka's Vimrc
"  Author: Rykka <Rykka10(at)gmail.com>
"  Update: 2012-02-17
"  License: WTFPL v2.0
"""""""""""""""""""""""""""""""""""""""""""""""""
" 1.Settings{{{1
" 1.0.Bundles "{{{2 
if !exists("g:bundles_loaded") || g:bundles_loaded != 1
    let g:bundles_loaded = 1
    set nocompatible               " be iMproved
    filetype off                   " required!
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
"{{{ Vundles
Bundle 'gmarik/vundle'

Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'matchit.zip'
Bundle "godlygeek/tabular"

Bundle 'majutsushi/tagbar'
let g:tagbar_compact          = 1
let g:tagbar_width            = 30
Bundle 'sjl/gundo.vim'
let g:gundo_preview_bottom    = 1
let g:gundo_width             = 30
let g:gundo_right             = 1

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_dotfiles  = 0
let g:ctrlp_max_depth = 10

Bundle 'vim-scripts/sudo.vim'
Bundle 'tpope/vim-fugitive'

Bundle 'mattn/zencoding-vim'
let g:user_zen_settings       = { 'indentation' : '    '}
let g:user_zen_leader_key     = '<c-e>'
let g:user_zen_expandabbr_key = '<c-e>e'    "e
let g:user_zen_expandword_key = '<e-e>E'    "e
let g:user_zen_next_key       = '<c-e>j'    "n
let g:user_zen_prev_key       = '<c-e>k'    "p
let g:user_zen_removetag_key  = '<c-e>d'    "k
Bundle 'lilydjwg/csspretty.vim'
Bundle 'kchmck/vim-coffee-script'

Bundle 'mattn/calendar-vim'

Bundle 'fs111/pydoc.vim'
Bundle 'ode79/pythonfolding'
let g:python_fold_block = "all"

Bundle 'Rykka/ColorV'
Bundle 'Rykka/vim-galaxy'
Bundle 'Rykka/easydigraph.vim'
Bundle 'Rykka/lastbuf.vim'
"}}}
    set nocompatible
    syntax on
    filetype plugin indent on     " required!
endif
"1.1.Basic "{{{2
let s:win_col       = 80
let s:win_col_span2 = 2 * s:win_col + 1
let s:win_pos       = exists("s:win_pos") ? s:win_pos : 550
let mapleader       = " "
let maplocalleader  = ","
function! s:auto_mkdir(dir, force) "{{{
    if !isdirectory(a:dir) && (a:force ||
                \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
endfunction "}}}

set history=255 viminfo='100,\"30,:30,s10,!
set autoread noautowrite

set backup backupdir=~/.vim_backups/
call s:auto_mkdir(expand('~/.vim_backups'),1)

set noswapfile directory=~/.vim_swaps/
call s:auto_mkdir(expand('~/.vim_swaps'),1)

set browsedir=buffer
set hidden bufhidden=hide switchbuf=useopen

set shortmess+=As           " no swap exists 'ATTENTION'
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set report=0                " : commands always print changed line count.

set expandtab tabstop=4  smarttab
set softtabstop=4 shiftwidth=4
set shiftround              " rounds indent to a multiple of shiftwidth
set autoindent copyindent   " copy the previous indentation on autoindenting

set virtualedit=block

set nopaste pastetoggle=<F2>

set completeopt=menuone
set pumheight=10            " Keep a small completion window

set isfname-==
set iskeyword+=_,$,@ iskeyword-=#
set comments=n://,fb:-,n:>,fb:*
set formatlistpat="^\s*[(\d)*#-]\+[\]:.)}\t ]\s*"
set formatoptions+=1on2mMq
" set formatoptions-=r      " Do not automatically insert a comment
" set formatoptions-=t      " Do no auto-wrap text using textwidth

set cscopetag               " When using :tag, <C-]>, or "vim -t", try cscope:
set cscopetagorder=0        " try ":cscope find g foo" and then ":tselect foo"

if has("unix") | set shell=sh | endif

set cryptmethod = "blowfish"
if has('unnamedplus') "{{{
    set clipboard+=unnamedplus "All system
else
    if has("unix")
        set clipboard+=unnamed "System clipboard
    else
        set clipboard=
    endif
endif "}}}
" 1.2.Multi_Byte "{{{2
if has("multi_byte")
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
    set encoding=utf-8
    set termencoding=utf-8
    set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,latin-1
endif
if has("win32") || has("win64")
    source $VIMRUNTIME/delmenu.vim
    set langmenu=zh_CN.utf-8
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif
" 1.3.UI fonts colors "{{{2
" Guifont
if has("gui_running")
    if has ("win32") || has ("win64")
        " set gfw=Microsoft_YaHei:h13:cGB2312
        set guifont=Dejavu_Sans_Mono:h13:cANSI
        set gfw=Wenquanyi_Micro_Hei_Mono:h13:cANSI
    elseif has("gui_mac")
        set guifont=Monaco:h13
    elseif has("gui_gtk2") || has("gui_gnome")
        set guifont=Dejavu\ Sans\ Mono\ 13,WenQuanYi\ Micro\ Hei\ 13
        set gfw=Wenquanyi\ Micro\ Hei\ Mono\ 13,WenQuanYi\ Zen\ Hei\ 13
    endif
endif
" menu
set winaltkeys=no                       " no ALT key for menus
let did_install_default_menus = 1       " no default menus
let did_install_syntax_menu = 1         " no syntax menus
" colorscheme
let $colorscheme_n="galaxy"
colorscheme $colorscheme_n
" tabline
set showtabline=1 tabpagemax=15
" statusline
set ruler "column and line number even no status line
set rulerformat=%15(%c%V\ %p%%%)
set laststatus=2
set statusline=%2*%02n.%*[%03l,%02c,%P]%<%F%1*%m%r%*\%=[U%B][%W%Y,%{&enc},%{&ff}]
" cmdline
set cmdheight=1 showcmd showmode
if has('wildmenu')
    set wildchar=<Tab> wildmenu wildmode=full
    set wildignore=*.o,*.obj,*.bak,*.exe,*.swp
    set cpoptions-=<  "compatible-options"
    set wildcharm=<C-Z> "wildchar inside macro"
endif
" misc
set showmatch               " show matchpairs

set foldenable foldmethod=marker foldcolumn=1
set foldlevel=0 foldlevelstart=0
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldclose=

set mouse=a                 " Enable terminal mouse in all mode
set mousemodel=extend mousehide

set nolazyredraw
set visualbell t_vb=
" 1.4.vim version"{{{2
if v:version >= 703 "{{{
    let &colorcolumn=s:win_col-1

    call s:auto_mkdir(expand('~/.vim_undo'),1)
    set undofile undodir=~/.vim_undo/   " persistent undo

    set conceallevel=1                  " always SHOW conceal text
    set concealcursor=vn              " n Normal v Visual i Insert c Command
endif "}}}
" 2.Commands and Autocmds {{{1
" 3.1.Commands "{{{2
command! -nargs=0 Write exec "w sudo:% "
command! -nargs=0 Mkdir call <SID>auto_mkdir(expand('%:p:h'),0)

function! s:delete(name) "{{{
    let f = a:name
    if input('Delete '.f.' ?(y/N)') =~? '^y\%[es]$'
        if !delete(f)
            echom f."deleted successfully!"
            Explore
        else
            echom f."delete faiure!"
        endif
    endif
endfunction "}}}
function! s:rename(name) "{{{
    let f = expand('%:p')
    exec "saveas ". a:name
    call s:delete(f)
endfunction "}}}
command! -nargs=0 Delete call <SID>delete(expand("%:p"))
command! -nargs=1 Rename call <SID>rename(<q-args>)

command! CopyName let @+ = expand('%:p:t')
command! CopyPath let @+ = expand('%:p:h')
command! CopyFull let @+ = expand('%:p')

command! TrimWhite %s/\s\+$//
command! TrimCtrlM %s//\r/

command! Ch7 !chmod 755 '%:p'
command! Ch6 !chmod 644 '%:p'

function! s:last_update() "{{{
    let rx_str_upd='\%(Change\|Update\|Updated\|Modified\)'
    for i in range(1,20)
        let line = getline(i)
        if line =~# rx_str_upd
            let nline = substitute(line, '\(^.*'.rx_str_upd.':\s*\).*$',
                        \ '\1'.strftime("%Y-%m-%d"), '')
            if line != nline
                call setline(i, nline)
            endif
            return
        endif
    endfor
endfunction "}}}
command! -nargs=0 -bar LastUpdate call <SID>last_update()

function! s:Ack(args) "{{{
    let grepprg_bak=&grepprg
    set grepprg=ack\ -H\ --nocolor\ --nogroup
    silent! execute "grep! " . a:args
    let &grepprg=grepprg_bak
    botright copen
    redraw!
endfunction "}}}
command! -nargs=* -complete=file Ack call <SID>Ack(<q-args>)

" 3.2.Insert Abbrevation "{{{2 
iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi.
" 3.3.Digraphs "{{{2 
" v- ǖ    v' ǘ    v< ǚ    v` ǜ
digraphs v- 470 v' 472 v< 474 v` 476
" redefine DOWN-ARROW ↓ to '|v' which was '-v'
digraphs \|v 8595 \|^ 8593
" 3.4.Autocmd_Group{{{2
aug au_GuiEnter "{{{
    au!
    au GuiEnter * set t_vb=
    exe "au GuiEnter * winpos ".s:win_pos." 0"
    exe "au GuiEnter * winsize ".s:win_col." 48"
aug END "}}}
aug au_Vimrc "{{{
    au!
    au SourcePre ~/.vimrc redraw | echohl WarningMsg
                \|echo "Reloading .vimrc"|echohl Normal
    au BufWritePost,FileWritePost ~/.vimrc redraw | echohl WarningMsg
                \|echo "Writing .vimrc"|echohl Normal
    au BufWritePost,FileWritePost ~/.vimrc so ~/.vimrc
    au SessionLoadPost * so ~/.vimrc
aug END "}}}
aug au_Buffer "{{{
    au!
    au BufEnter,BufNew,BufReadPost * silent! lcd %:p:h:gs/ /\\ /
    " to the line when file last opened
    au BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe  "normal! g`\"" | endif
aug END "}}}
aug au_Filetypes "{{{
    au!
    au BufRead,BufNew,BufNewFile *.j       setl ft=jass
    au BufRead,BufNew,BufNewFile *.mako    setl ft=mako
    au BufRead,BufNew,BufNewFile *.conf    setl ft=conf
    au BufRead,BufNew,BufNewFile tmux.conf setl ft=tmux
aug END "}}}
aug au_Htmls "{{{
    au!
    au Filetype php,html,xhtml,xml setl shiftwidth=4 softtabstop=4
    au Filetype php,html,xhtml,xml setl foldmethod=indent
aug END "}}}
aug au_Plugins "{{{
    au!
    au colorscheme *.vwk call s:vimwiki_my_set()
    au FileType,Syntax vimwiki  call s:vimwiki_my_set()
    au FileType netrw    call s:netrw_my_set()
aug END "}}}
" 3.Mappings "{{{1
" 3.1.Leader_Mapping{{{2
"Single Key "{{{
nno   <leader>   <Nop>
vno   <leader>   <Nop>
nno   s          <Nop>
nno   S          <Nop>
nno   Q          <Nop>
"similar with D
nno   Y          y$
nno   >          >>
nno   <          <<
vno   >          >gv
vno   <          <gv
" last changed position '.  `.
" last inserted position '^ `^
nno   `,         `^
nno   ',         '^

" repeat on every line
vno   .          :normal .<CR>
nno <rightmouse><leftmouse> <c-o>
ino <rightmouse><leftmouse> <c-o>
"}}}
"Dotfiles "{{{
map <leader>vr  :so ~/.vimrc<CR>
map <leader>vp  :Sp\|e ~/.pentadactylrc<CR>
map <leader>vsp :Sp\|e ~/Dropbox/Vimwiki/Ref/ShuangPin.vwk<CR>
map <leader>vdv :call <SID>diff_this('~/.vimrc',
            \ '~/Documents/dotfiles/.vimrc')<cr>
map <leader>vv  :Sp\|e ~/Dropbox/dotfiles/.vimrc<CR>
if has("unix")
    map <silent><leader>vb :Sp\|e ~/.bashrc<CR>
    map <silent><leader>vt :Sp\|e ~/.tmux.conf<CR>
    map <silent><leader>vz :Sp\|e ~/.zshrc<CR>
    map <silent><leader>vc :Sp\|e ~/.conkyrc<CR>
endif "}}}
" Toggle Diff "{{{
set diffopt=filler,vertical,foldcolumn:1
nma <leader>da :1,$+1diffget<cr>
nma <leader>d1 :1,.diffget<cr>
nma <leader>d$ :.,$+1diffget<cr>
map <silent> <leader>dd :call <SID>toggle_diff()<CR>
map <silent> <leader>do :call <SID>diff_this()<CR>
function! s:toggle_diff() "{{{
    if &diff
        diffoff
        set foldmethod=marker
        set foldcolumn=1
        echohl ModeMsg | echo "diffmode Off" | echohl None
    else
        diffthis
        echohl WarningMsg | echo "diffmode On" | echohl None
    endif
endfun "}}}
function! s:diff_this(...) "{{{
    if exists("a:1")
        exec "sp ".a:1
    endif
    let syn=&syntax
    call s:split()
    if !exists("a:2")
        enew | setl bt=nofile | r # | 0d_
        exec "set syn=".syn
        setl ro
    else
        exec "e ".a:2
    endif
    diffthis | wincmd p | diffthis
endfunction "}}}
"}}}
"Toggle Fold "{{{
nno <silent> zf :set opfunc=MyFoldMarker<CR>g@
vno <silent> zf :<C-U>call MyFoldMarker(visualmode(), 1)<CR>zv
nno <silent> zz @=(&foldlevel?'zM':'zR')<CR>
nno <silent> <leader>zz @=(&foldlevel?'zM':'zR')<CR>
nno <silent> <leader><leader> @=(foldclosed('.')>0?'zv':'zc')<CR>
vno <silent> <leader><leader> <ESC>@=(foldclosed('.')>0?'zv':'zc')<CR>gv
nor <silent> <leader>fm :setl fdm=<C-R>=&fdm=~'ke'?'indent'
            \:&fdm=~'in'?'syntax'
            \:&fdm=='sy'?'expr':'marker'<CR><BAR>ec &fdm<CR>
function! s:set_fold_markers(lnum_st, lnum_end) "{{{
" let foldmarkers to be applied with space before a comment.
    let markers = split(&foldmarker, ",")

    function! s:set_line(ln, marker)
        let cmnt = substitute(&commentstring, "%s", a:marker, "")
        let line = getline(a:ln)
        if line =~ '^\s*$'
            let space = ''
        else
            let space = ' '
        endif
        let line = substitute(line, '\s*$', space, '').cmnt
        call setline(a:ln, line)
    endfunction

    call s:set_line(a:lnum_st, markers[0])
    call s:set_line(a:lnum_end, markers[1])
endfunction "}}}
function! MyFoldMarker(type, ...) "{{{
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    if a:0  " Invoked from Visual mode, use '< and '> marks.
        call s:set_fold_markers("'<", "'>")
    elseif a:type == 'line'
        call s:set_fold_markers("'[", "']")
    elseif a:type == 'block'
    endif

    let &selection = sel_save
    let @@ = reg_save
endfunction "}}}
"}}}
"Toggle Option "{{{
set listchars=tab:\|-,trail:-,extends:>,precedes:<
nor <Leader>li :setl list! list?<CR>

nor <leader>nn :setl <c-r>=&nu?'rnu':&rnu?'nornu':'nu'<CR><CR>

let &showbreak='> '         " wrap text break string
set wrap linebreak
set display=lastline        " show wraping text even it's not complete show
nor <leader>wp :setl wrap! wrap?<CR>

set spelllang=en nospell
nor <leader>sp :setl spell!<CR>:echo "Spell:"
            \.<c-r>=&spell? "'ON'" : "'OFF'" <CR><CR>

set guioptions=gt
set guioptions-=mT
nor <m-1> :set <C-R>=&go=~#'m' ? 'go-=m' : 'go+=m'<CR><CR>
nor <m-2> :set <C-R>=&go=~#'r' ? 'go-=Rr': 'go+=Rr'<CR><CR>
nor <m-3> :set <C-R>=&go=~#'T' ? 'go-=T' : 'go+=T'<CR><CR>

nma <leader>11 :filetype detect \| syntax enable <CR>
nma <leader>1m  :emenu Syntax.
nma <silent><leader>1s :call <SID>SynStack()<CR>
function! <SID>SynStack() "{{{
    if exists("*synstack")
        for id in synstack(line("."), col("."))
            echon " ".synIDattr(id, "name")
            exe "echohl ".synIDattr(id, "name")
            echon "[".synIDattr(synIDtrans(id), "name")."]"
            echohl None
        endfor
    endif
endfunc "}}}
"}}}
" 3.2.Switch Window "{{{2
set winheight=12 winwidth=25        " current window minimum width/height
set winminwidth=0 winminheight=0
set noequalalways splitbelow splitright
nma <silent><C-W>1 :call <SID>max_resize_win()<CR>
nma <silent><C-W>2 :call <SID>span_vert_win(0)<CR><C-W>=
nma <silent><C-W>3 :call <SID>fold_vert_win(1)<CR>
nma <silent><C-W>4 :call <SID>place_vim()<CR>

nno <C-W>n <C-W>w
nno <C-W>N <C-W>n

nma <silent><C-W><c-q> :close<bar>call <SID>fold_vert_win(0)<CR>
nma <silent><C-W>q     :close<bar>call <SID>fold_vert_win(0)<CR>

nno <C-W><C-V> :Sp<cr>gf
nno <C-W><C-S> :sp<CR>gf
nno <C-W><C-T> :tab sp<CR>gf
nno <C-W><C-F> :sp\|e <cfile><CR>

map <C-Up>      :tabclose<CR> | map <S-Up>      :close<CR>
map <C-Down>    :tabnew<CR>   | map <S-Down>    :new<CR>
map <C-Right>   :tabnext<CR>  | map <S-Right>   :wincmd w<CR>
map <C-Left>    :tabprev<CR>  | map <S-Left>    :wincmd p<CR>
function! s:is_win_vert() "{{{
    return winwidth(0) < &columns
endfunction "}}}
function! s:is_vim_span() "{{{
    return &columns >= s:win_col_span2
endfunction "}}}
function! s:max_resize_win() "{{{
    resize
    if !s:is_vim_span() && s:is_win_vert()
        vertical resize
    endif
endfunction "}}}
function! s:span_vert_win(force) "{{{
    if a:force || (s:is_win_vert() && !s:is_vim_span())
        let &columns = s:win_col_span2
    endif
endfun "}}}
function! s:fold_vert_win(force) "{{{
    if a:force || (!s:is_win_vert() && s:is_vim_span())
        let &columns = s:win_col
    endif
endfun "}}}
function! s:place_vim() "{{{
    let s:win_pos = getwinposx()>=0 ? getwinposx() : s:win_pos
    if s:win_pos<=100       | let s:win_pos = 550
    elseif s:win_pos <= 600 | let s:win_pos = 1050
    else                    | let s:win_pos = 10
    endif
    exe "winpos ".s:win_pos." 0"
endfunction "}}}
function! s:split() "{{{
"check win_span and filename to decide split direction
    if empty(expand('%'))
        return
    endif
    if s:is_win_vert()
        split
    else
        let &columns = s:win_col_span2
        vsplit
    endif
endfun
"}}}
command! -bar Split call <SID>split()
" 3.3.HJKL "{{{2
set scrolloff=3 scrolljump=1
nno   H   h
nno   J   j
nno   K   k
nno   L   l

nno   j   gj
nno   k   gk
" xno: visual mode exclude select mode.
xno   j   gj
xno   k   gk

nno   <silent>   <c-h>   K
nno   <silent>   <c-l>   :let @/=''\|redraw!<CR>
nno   <silent>   <c-j>   J
ino   <silent>   <c-j>   <c-k>

vno   <c-CR>   gq
nno   <c-CR>   kJ
ino   <c-CR>   <esc>kJi
nno   <m-CR>   o
ino   <m-CR>   <esc>o
nor   <s-CR>   o<ESC>
ino   <s-CR>   <esc>O

map   <ScrollWheelUp>       3k
map   <ScrollWheelDown>     3j
map   <S-ScrollWheelUp>     <c-b>
map   <S-ScrollWheelDown>   <c-f>
nno   <C-ScrollWheelDown>   >>
nno   <C-ScrollWheelUp>     <<
vno   <C-ScrollWheelDown>   >gv
vno   <C-ScrollWheelUp>     <gv
" insert mode moving "{{{
ino <m-j> <c-o>j
ino <m-k> <c-o>k
ino <m-h> <left>
ino <m-l> <right>

ino <m-o> <c-o>o
ino <m-O> <c-o>O
ino <m-c>  <esc>

ino <c-a> <esc>^i
cno <c-a> <c-b>
ino <c-b> <esc>^i
ino <c-e><c-e> <esc>$a

ino <c-left> <c-o>B
"}}}
" 3.4.Editing_"{{{2
" Wrap text "{{{
"VimwikiWord
nno <Leader>eW BvEc[[<C-r>"]]<ESC>`[
nno <Leader>ew bvec[[<C-r>"]]<ESC>`[
" php
nno <leader>ep ciw<?php <C-r>" ?><ESC>
vno <Leader>ep c<?php <C-r>" ?><ESC>`[
"" html comment
nno <leader>e! ciw<!-- <C-r>" --><ESC>
vno <Leader>e! c<!-- <C-r>" --><ESC>`[
"}}}
" Todo text "{{{
nno <leader>et :call <SID>add_text(" TODO:")<CR>
nno <leader>ef :call <SID>add_text("FIXME:")<CR>
nno <leader>ex :call <SID>add_text("  XXX:")<CR>
nno <leader>ee :call <SID>toggle_with_T()<CR>
let s:rx_toggle = [['TODO',   'DONE'],
                \ ['FIXME',  'FIXED'],
                \ ['XXX',    'WORKRND'],
                \ ['NOTE',   'WARNING', 'CAUTION'],
                \ ]
let s:rx_timestamp = '\(\d\{6}\|\d\{4}-\d\{2}-\d\{2}\)'
let s:fm_timestamp = "%Y-%m-%d"
function! s:add_text(text) "{{{
    if &syn=="vimwiki"
        let cmnt = a:text
    else
        let cmnt = substitute(&commentstring, '%s', ' '.a:text, "")
    endif
    if getline('.')=~'^\s*$'
        exec 'normal! I' . cmnt
    else
        let fo_bak=&fo
        set fo=2
        exec 'normal! o' . cmnt
        let &fo=fo_bak
    endif
endfunction "}}}
function! s:toggle_with_T() "{{{
    let line = getline('.')
    for rx_list in s:rx_toggle
        for i in range(len(rx_list))
            let rx_lst = rx_list[i].':\='
            if line =~# rx_lst "{{{
                let r = i+1
                if i == len(rx_list)-1
                    let r = 0
                    " remove all timestamp as became list[0]
                    if line =~# rx_lst.' '.s:rx_timestamp
                        let line = substitute(line,' '.s:rx_timestamp,'','')
                    endif
                elseif i == len(rx_list)-2
                    let time = strftime(s:fm_timestamp)
                    " add timestamp as became list[-1]
                    if line =~# rx_lst.' '.s:rx_timestamp
                        let line = substitute(line,s:rx_timestamp, time,'')
                    else
                        let line = substitute(line,'\C'.rx_lst, '& '.time,'')
                    endif
                endif
                let line = substitute(line,'\C'.rx_list[i],rx_list[r],'')
                break
                break
            endif "}}}
        endfor
    endfor
    if line !=# getline('.')
        call setline('.',line)
    endif
endfunction "}}}
"}}}
" Line format  "{{{
nmap gUu :s/\v<(.)(\w*)/\u\1\L\2/g\|nohl<CR>
nmap gcw guiw~w

nno <leader>e=2 yyPVr=jyypVr=
nno <leader>e*2 yyPVr*jyypVr*
"}}}
" Pairs "{{{
vno [p <esc>`>a]<esc>`<i[<esc>lv`>l
vno {{ <esc>`>a}<esc>`<i{<esc>lv`>l
vno (( <esc>`>a)<esc>`<i(<esc>lv`>l
vno "" <esc>`>a"<esc>`<i"<esc>lv`>l
vno '' <esc>`>a'<esc>`<i'<esc>lv`>l
vno ** <esc>`>a*<esc>`<i*<esc>lv`>l
vno __ <esc>`>a_<esc>`<i_<esc>lv`>l

let pair_list = [
            \['{','}'], ['[',']'], ['(',')'], ['<','>'],
            \['"','"'], ["'","'"],
            \['"','"'], ["'","'"],
            \['｛','｝'], ['［','］'], ['（','）'], ['＜','＞'],
            \['＂','＂'], ["＇","＇"],
            \]
for [s,e] in pair_list
    " input style 1
    exec 'ino '.s.s.' '.s.e.'<left>'
    exec 'cno '.s.s.' '.s.e.'<left>'

    " input style 2
    " exec 'ino '.s.' '.s.e.'<left>'
    " exec 'ino '.s.s.' '.s
    " exec 'cno '.s.' '.s.e.'<left>'
    " exec 'cno '.s.s.' '.s

    exec 'ino '.s.'<c-a> '.s.'<esc>m`$a'.e.'<esc>``a'
    exec 'ino '.s.'<c-e> '.s.'<esc>m`ea'.e.'<esc>``a'
    exec 'ino '.s.'<c-w> '.s.'<esc>m`Ea'.e.'<esc>``a'
    if s != e
        exec "ino ".s.e." ".s.e
    endif
endfor

ino {<CR>  {<CR>}<Esc>O<tab>
ino {<c-e> {<c-o>mz<end><cr>}<c-o>`z<cr><tab>
"}}}
" 3.5.MsWin "{{{2
source $VIMRUNTIME/mswin.vim
behave xterm
"open fold while undo /redo
nor <C-Z>       uzv
ino <C-Z>       <C-O>u<C-O>zv
vno <C-Z>       <Nop>

nor <C-Y>       <C-R>zv
ino <C-Y>       <C-O><C-R><C-O>zv
vno <C-Y>       <Nop>

" Filter "+gP
nor <C-V>	    "+gp=`]
nor <S-Insert>	"+gp=`]
" Cut
vno <C-D>       "+x

" CTRL-A is Select all
noremap <C-A> ggVG
inoremap <C-A> <C-O>ggVG
cnoremap <C-A> <C-C>ggVG
onoremap <C-A> <C-C>ggVG
snoremap <C-A> <C-C>ggVG
" 3.6.Search "{{{2
set hlsearch incsearch
set ignorecase smartcase
set nowrapscan
nno   #    g* | nno   g#   *
nno   *    g# | nno   g*   #
vno   /    <ESC>/<C-\>e<SID>p(<SID>r("v"),"e")<CR>
vno   ?    <ESC>?<C-\>e<SID>p(<SID>r("v"),"e")<CR>
vno   #    <ESC>/<C-\>e<SID>p(<SID>r("v"),"e")<CR><CR><C-G>
vno   *    <ESC>?<C-\>e<SID>p(<SID>r("v"),"e")<CR><CR><C-G>
vno   n    <ESC>/<C-\>e<SID>p(<SID>r("v"),"e")<CR><CR><C-G>
vno   N    <ESC>?<C-\>e<SID>p(<SID>r("v"),"e")<CR><CR><C-G>

nno <silent> n :call <SID>wrap_scan_warn('f')<CR>
nno <silent> N :call <SID>wrap_scan_warn('b')<CR>
function! s:wrap_scan_warn(d) "{{{
    " show an warning message when hit end of file.
    try
        if (a:d=='f' && v:searchforward == 1)
            \ || (a:d=='b' && v:searchforward == 0)
            //
        else
            ??
        endif
    catch /^Vim\%((\a\+)\)\=:E38[45]/
        echohl Warningmsg
        if v:searchforward ==1
            echon 'Hit the END-Of-File.press n/N to go on'
        else
            echon 'Hit the TOP-Of-File.press n/N to go on'
        endif
        let c = nr2char(getchar())
        echohl Modemsg | echon "[".c."]" | echohl Moremsg
        if c==?"n" && v:searchforward == 1
            call search(@/,'w')
            echon 'Wrap scan to TOP'
        elseif c==?"n" && v:searchforward == 0
            call search(@/,'wb')
            echon 'Wrap scan to END'
        else
            echohl Errormsg | echon 'Stoped scan'
        endif
        echohl Normal
    endtry
endfunction "}}}
function! s:p(p,mode) "{{{
    if a:mode =~ "s"
        let re_txt =  '[]*'
    elseif a:mode =~ "e"
        let re_txt =  '/~.$\'
    elseif a:mode =~ "r"
        let re_txt =  '&'
    endif
    return escape(a:p,re_txt)
endfunction "}}}
function! s:r(mode) "{{{
    if a:mode=~#"v"
        normal gv"yy
        let w = @y
    endif
    return w
endfunction "}}}
function! s:w(s,mode) "{{{
    let rs = a:s
    if a:mode =~ "b"
        let ss = "\\<".s:p(a:s,"s")."\\>"
    else
        let ss = s:p(a:s,"s")
    endif
    return 's/'.ss."/".s:p(rs,"r")."/gc"
endfunction "}}}
" 3.7.F1-F12 "{{{2
"{{{3 F1 Help
set keywordprg=":help"
set helplang=en,cn
cab H helpg
nor   <F1>     K
nno   <S-F1>   :Pydoc <C-R><C-F><CR>
"{{{3 F2 Replace reg/
nno   <F2>     :%<C-R>=<SID>w(@/,"")<CR><Left><Left><Left>
vno   <F2>     :<C-R>=<SID>w(@/,"")<CR><Left><Left><Left>
nno   <S-F2>   :%<C-R>=<SID>w(expand('<cword>'),"b")<CR><Left><Left><Left>
vno   <S-F2>   :<C-R>=<SID>w(expand('<cword>'),"b")<CR><Left><Left><Left>
"{{{3 F3 Ack-grep http://better-than-grep.com
nor   <F3>     :Ack <C-R><C-F> %<CR>
vno   <F3>     y:Ack <C-R>" %<CR>
nor   <S-F3>   :Ack <C-R><C-F><CR>
vno   <S-F3>   y:Ack <C-R>"<CR>
"{{{3 F4 Folder
nno   <F4>     :Ex<CR>
nno   <S-F4>   :CtrlP<CR>
"{{{3 F5 Execute
nno <silent> <F5> :call <SID>exe("n")<CR>
vno <silent> <F5> :call <SID>exe("v")<CR>
function! s:exe(mode) "{{{
    update
    let bang="!"
    if has("unix")
        let browser = "firefox "
        let runner="xdg-open "
        let err_log=" 2>&1 | tee /tmp/.vim_exe.tmp"
        let term = "gnome-terminal "
    else
        let browser ="firefox.lnk "
        let runner="start "
        let err_log=" "
        let term = "cmd "
    endif

    if !exists("&syn")
        exec bang.runner.file
        return
    else
        let syn=&syn
    endif

    if a:mode=="n"
        let file=' "'.expand('%:p').'"'
        if    syn=="python"
            let    L=getline(1)
            if     L=~'python3' | exec bang."python3 -d ".file.err_log
            elsei  L=~'pypy'    | exec bang."pypy -d ".file.err_log
            else                | exec bang."python2 -d ".file.err_log
            endif
        elsei syn=="ruby"       | exec bang."ruby -d ".file.err_log
        elsei syn=="perl"       | exec bang."perl -D ".file.err_log
        elsei syn=='vim'        | exec "so %"
        elsei syn=~'html'       | exec bang.browser.file
        elsei syn=~'^coffee$'   | exec "CoffeeRun"
        elsei syn=="vimwiki"    | exec "Vimwiki2HTMLBrowse"
        elsei syn=='bat'        | exec "w !cmd"
        elsei syn=='haskell'    | exec "!ghc %" | exec "!./%:t:r"
        elsei syn=='c'          | exec "!gcc %" | exec "!./a.out"
        elsei syn=='cpp'        | exec "!g++ %" | exec "!./a.out"
        elsei syn=~'^\(sh\|expect\|bash\)$'     | exec "w !sh"
        else                    | exec bang.runner.file
        endif
    elseif a:mode=="v"
        if     syn=="python"    | exec "py ".getline('.')
        elseif syn=="ruby"      | exec "ruby ".getline('.')
        elseif syn=='vim'       | exec getline('.')
        elseif syn=~'^\(sh\|expect\|bash\)$'    | exec ".w !sh"
        endif
    endif
endfunction "}}}
"}}}3
nor   <F6>   :TagbarToggle<CR>
nor   <F7>   :GundoToggle<CR>
"{{{3 F8 File Manager
nor   <silent><F8>     :call <SID>file_man("")<CR>
nor   <silent><S-F8>     :call <SID>file_man("sudo ")<CR>
function! s:file_man(mode) "{{{
    if has("win32") | exec "!start explorer '%:p:h'"
    else            | exec "!".a:mode."nautilus '%:p:h' "
    endif
endfunction "}}}
"{{{3 F9 Termnial
nor   <silent><F9>   :call <SID>terminal()<CR>
function! s:terminal() "{{{
    if has("win32") | exec "!start cmd '%:p:h'"
    else            | exec "!gnome-terminal --working-directory=%:p:h &"
    endif
endfunction "}}}
"}}}3
nor   <F10>   :options<CR>
nor   <F11>   :script<CR>
"{{{3 F12 Session
set sessionoptions=blank,curdir,help,tabpages,winpos,winsize,resize
nma <F12> :Hex! ~/.vim/sessions<CR>
nma <S-F12> :call SaveSession()<CR>
nma <C-F12> :call SaveSession("name")<CR>
function! SaveSession(...) "{{{
    wall
    let ses_dir = expand('~/.vim/sessions')
    call s:auto_mkdir(ses_dir,1)
    let time=strftime("%y%m%d_%H%M%S")
    if exists("a:1") && a:1=="name"
        if input("Please Input your session name:")
            let sesname = time."_".ses
        else
            echo "Invalid Input name. Stop!"
            return
        endif
    else
        let sesname = time
    endif

    try
        exe "mksession! "."~/.vim/sessions/".sesname
        echom "mks success! session file : ".sesname
    catch /^vim\%((\a\+)\)\=:/
        echoe "mks failure! error: " .v:exception
    endtry
endfunction "}}}
" 4.Plugins "{{{1
" Netrw "{{{2
let g:netrw_preview        = 1
let g:netrw_liststyle      = 3
let g:netrw_winsize        = 30
let g:netrw_browse_split   = 0
let g:netrw_cursor         = 3
let g:netrw_banner         = 0
let g:netrw_mousemaps      = 0
let g:netrw_special_syntax = 1
let g:netrw_timefmt        = "%y-%m-%d  %H-%M-%S"
function! s:netrw_my_set() "{{{
    nor   <buffer>qq               :close<CR>
    map   <buffer><2-leftmouse>    <CR>
    map   <buffer><space><space>   mf
endfunction "}}}
"Neocomplcache "{{{2
let g:acp_enableAtStartup                      = 0
let g:neocomplcache_enable_at_startup          = 1
let g:neocomplcache_enable_smart_case          = 1
let g:neocomplcache_enable_ignore_case         = 0
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length          = 2
let g:neocomplcache_lock_buffer_name_pattern   = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_disable_caching_file_path_pattern="fuf"

let g:neocomplcache_quick_match_patterns={'default':'`'}
let g:neocomplcache_quick_match_table = {
            \'1' : 0, '2' : 1, '3' : 2, '4' : 3, '5' : 4, '6' : 5, '7' : 6, '8' : 7, '9' : 8, '0' : 9,
            \}

ino <expr><C-h>   neocomplcache#smart_close_popup()."\<left>"
ino <expr><C-l>   neocomplcache#smart_close_popup()."\<right>"
ino <expr><Space> neocomplcache#smart_close_popup()."\<Space>"
ino <expr><CR>    neocomplcache#smart_close_popup()."\<CR>"
ino <expr><BS>    neocomplcache#smart_close_popup()."\<BS>"
ino <expr><C-y>   neocomplcache#close_popup()

"{{{ omni comp
aug neocomp_omni_compl "{{{
    au! neocomp_omni_compl
    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
aug END "}}}
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"}}}

" neocompl cache snippets_complete
ino <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
ino <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<s-TAB>"

imap <C-k>  <Plug>(neocomplcache_snippets_expand)
smap <C-k>  <Plug>(neocomplcache_snippets_expand)
nmap <c-k> a<c-k><esc>

let g:neocomplcache_snippets_dir="~/.vim/my_snips/snippets_complete/"
map <leader>se :sp\|NeoComplCacheEditSnippets<cr>
map <leader>sr :sp\|NeoComplCacheEditRuntimeSnippets<cr>
map <leader>s_ :sp\|e ~/.vim/my_snips/snippets_complete/_.snip <cr>

"Vimwiki "{{{2
map <Leader>ww <Plug>VimwikiIndex

let wiki_1 = {}
if &term=='cygwin'
    let wiki_1.path      = '/d/Dropbox/vimwiki'
    let wiki_1.path_html = '/d/Documents/vimwiki_html'
else
    let wiki_1.path      = '~/Dropbox/Vimwiki'
    let wiki_1.path_html = '~/Documents/vimwiki_html'
endif
let wiki_1.maxhi = 0
let wiki_1.ext   = '.vwk'
let wiki_1.diary_index   = 'index'
let wiki_1.diary_rel_path   = 'Writing/Diary/'
let wiki_1.css_name = 'style.css'
let wiki_1.nested_syntaxes = { 'python': 'python',
            \'cpp': 'cpp', 'c': 'c','vim': 'vim', 'sh': 'sh',
            \'html': 'html'}
let g:vimwiki_list = [wiki_1]

let g:vimwiki_file_exts='pdf,txt,doc,rtf,xls,zip,rar,7z,gz
            \,py,sh,rb,pl,lua,go,hs,conf,j,vim,vba,vwk
            \,c,cpp,h,java,xml
            \,js,css,html,php,coffee'
let g:vimwiki_menu          = ""
let g:vimwiki_dir_link      = 'index'
let g:vimwiki_browsers      = ['firefox']
let g:vimwiki_conceallevel  = 2
let g:vimwiki_lower         = "a-z0-9\u0430-\u044f"
let g:vimwiki_url_mingain   = 99                " url Conceal length
let g:vimwiki_use_mouse     = 1
let g:vimwiki_folding       = 1
let g:vimwiki_fold_lists    = 0
let g:vimwiki_hl_cb_checked = 1
function! s:sub_list(sym) "{{{
    let line=getline('.')
    let m=substitute(line,'^\(\s*\)\%([*#-]\s\|\%(\d\.\)\+\s\)\=\ze.*',
                \'\1'.a:sym.' ','')
    call setline(line('.'),m)
endfunction "}}}
function! s:vimwiki_my_set() "{{{

    silent! syn clear VimwikiTimeStamp
    syn match VimwikiTimeStamp /\%(\d\{4}-\d\{2}-\d\{2}\|\d\{6}_\d\{4}\|\d\{6}\)/

    " syn clear VimwikiPre
    " execute 'syntax region VimwikiInPre matchgroup=VimwikiPre'
    "             \.' start=/^\s*'.g:vimwiki_rxPreStart.'/'
    "             \.' end=/^\s*'.g:vimwiki_rxPreEnd.'\s*$/'
    "             \.' contains=@Spell'
    hi link VimwikiInPre String
    hi link VimwikiPre SpecialComment

    silent! syn clear vimwikiList
    let rxListBullet = '^\s*\zs\%(\*\|-\|#\)\ze\s'
    execut 'syn match VimwikiList /'.rxListBullet.'/'
    silent! syn clear vimwiki_rx_list_num
    syn match vimwiki_rx_list_num /^\s*\(\d\+\.\)\+\ze\s/
    hi default link vimwiki_rx_list_num VimwikiList

    for i in range(1,6)
        let g:vimwiki_rxH{i} = '^\s*=\{'.i.'}[^=]\+.*[^=]\+=\{'.i.'}\s*$'
        silent! exe 'syn clear VimwikiHeader'.i
        exe 'syn match VimwikiHeader'.i.' /'.g:vimwiki_rxH{i}.'/ contains=VimwikiTodo,VimwikiNoExistsLink,VimwikiLink,@Spell'
    endfor

    let g:vimwiki_rxListBullet = '^\s*\%(\*\|-\|#\)\s'
    let g:vimwiki_rxListNumber = '^\s*\(%\d\+[\.)]\)\+\s'
    syn clear VimwikiList
    execute 'syntax match VimwikiList /'.g:vimwiki_rxListBullet.'/'
    execute 'syntax match VimwikiList /'.g:vimwiki_rxListNumber.'/'
    hi link VimwikiList Keyword
    hi link VimwikiTimeStamp SpecialComment
    
    hi VimwikiBold NONE
    hi link VimwikiBold Title

    if g:vimwiki_hl_cb_checked
        syn clear VimwikiCheckBoxDone
        execute 'syntax match VimwikiCheckBoxDone /'.
                    \ g:vimwiki_rxListBullet.'\s*\['.g:vimwiki_listsyms[4].'\].*$/'.
                    \ ' contains=VimwikiNoExistsLink,VimwikiLink'
        execute 'syntax match VimwikiCheckBoxDone /'.
                    \ g:vimwiki_rxListNumber.'\s*\['.g:vimwiki_listsyms[4].'\].*$/'.
                    \ ' contains=VimwikiNoExistsLink,VimwikiLink'
    endif

    map <buffer><leader>ee <Plug>VimwikiToggleListItem
    nma <buffer><leader>e1 :call <SID>sub_list('1.')<cr>
    nma <buffer><leader>e2 :call <SID>sub_list('*')<cr>
    nma <buffer><leader>e3 :call <SID>sub_list('#')<cr>
    nma <buffer><leader>e4 :call <SID>sub_list('-')<cr>

    map <buffer><leader>wg <Plug>VimwikiGenerateLinks
    map <buffer><Leader>wr <Plug>VimwikiRenameLink
    map <buffer><Leader>wd <Plug>VimwikiDeleteLink

    map <buffer><Leader>wt :VimwikiTable<CR>

    map <buffer><Leader>w2h :Vimwiki2HTML<CR>

    map <buffer><c-s-Up> :VimwikiDiaryPrevDay<CR>
    map <buffer><c-s-Down> :VimwikiDiaryNextDay<CR>
    map <buffer><c-up> :tabclose<CR>
    map <buffer><c-down> :tabnew<CR>

    map <buffer><expr> <rightmouse><leftmouse> "<Plug>VimwikiGoBackLink"
    ima <buffer><expr> <rightmouse><leftmouse> "<Plug>VimwikiGoBackLink"

    imap <buffer><expr><TAB> 
    \ pumvisible() ? "\<C-n>" :  vimwiki#tbl#kbd_tab()
    imap <buffer><expr><S-TAB> 
    \ pumvisible() ? "\<C-p>" :  vimwiki#tbl#kbd_shift_tab()

    setl shiftwidth=4 softtabstop=4
    setl cms=%%%%\ %s
    setl foldmethod=expr
    setl foldexpr=VimwikiFoldLevel(v:lnum)
endfun "}}}
"Git "{{{2
nmap  <leader>ga :call <SID>git_add()<cr>
nmap  <leader>gc :Gcommit<cr>
nmap  <leader>gp :Git push<cr>
nmap  <leader>gd :Gsdiff<CR>
nmap  <leader>gb :Git branch -r<CR>
nmap  <leader>gs :Git diff --stat<CR>
nmap  <leader>gk :Git checkout
nmap  <leader>gr :Git branch
function! s:git_add() "{{{
    LastUpdate | update! | redraw
    try
        exec "Git add %"
    catch /^Vim\%((\a\+)\)\=:E492/
        echohl WarningMsg
        echo "[Warning]Not a git repo..."
        echohl Normal
    endtry
endfunction "}}}
"Django "{{{2
nmap <leader>js :!python2 manage.py syncdb<cr>
" Misc Plugins"{{{2
let g:vimsyn_noerror = 1

nor <leader>cc :TComment<cr>
nor \\ :TComment<cr>


nma <leader>cA :ColorVsuball<CR>

vma <leader>ft :Tab /
nma <leader>ft :.Tab /
"}}}1
" vim:tw=0 sw=4 ts=4 sts=4 fdm=marker fdls=0 :
