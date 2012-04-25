"""""""""""""""""""""""""""""""""""""""""""""""""
"  Script: Rykka's Vimrc
"  Author: Rykka <Rykka10(at)gmail.com>
"  Update: 2012-04-26
"  License: WTFPL v2.0
"""""""""""""""""""""""""""""""""""""""""""""""""
" 1.Settings "{{{1
" 1.0.Bundles "{{{2 
if !exists("g:bundles_loaded") || g:bundles_loaded != 1
    let g:bundles_loaded = 1
    set nocompatible               " be iMproved
    filetype off                   " required!
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    " Vundles {{{
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
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_max_depth = 20



    Bundle 'vim-scripts/sudo.vim'
    Bundle 'tpope/vim-fugitive'

    Bundle 'mattn/zencoding-vim'
    let g:user_zen_settings       = { 'indentation' : '    '}
    let g:user_zen_leader_key     = '<c-e>'
    let g:user_zen_expandabbr_key = '<c-e>e'    "e
    let g:user_zen_expandword_key = '<c-e>E'    "e
    let g:user_zen_next_key       = '<c-e>j'    "n
    let g:user_zen_prev_key       = '<c-e>k'    "p
    let g:user_zen_removetag_key  = '<c-e>d'    "k
    Bundle 'lilydjwg/csspretty.vim'
    Bundle 'kchmck/vim-coffee-script'

    Bundle 'mattn/calendar-vim'
    " syntax check
    Bundle 'scrooloose/syntastic'

    "python "{{{
    " Bundle 'klen/python-mode'
    " let g:pymode_folding = 0
    " let g:pymode_rope_vim_completion=0
    " XXX: <c-space> could not be used.
    " au! FileType python inoremap <buffer> <c-space> <Nop>
    
    Bundle 'ode79/pythonfolding'
    let g:python_fold_block = "all"
    " Bundle 'alfredodeza/pytest.vim'
    Bundle 'sontek/rope-vim'
    let g:ropevim_guess_project=1
    "}}}
    "
    Bundle 'mileszs/ack.vim'

    " Bundle 'Lokaltog/vim-powerline'

    Bundle 'vim-scripts/fcitx.vim'
    "Bundle 'vim-scripts/vimwiki.vim'

    Bundle 'Rykka/ColorV'
    Bundle 'Rykka/vim-galaxy'
    Bundle 'Rykka/easydigraph.vim'
    Bundle 'Rykka/lastbuf.vim'
    " let g:galaxy_auto_statusline = 0
    " let g:galaxy_statusline_blink = 0
    " let g:galaxy_visual_hl_fg =1
    " let g:galaxy_indent_hl_pos = 'end'
    " let g:load_syn_dict = 0
    " let g:load_syn_tuning = 0
    "}}}
    set nocompatible
    syntax on
    filetype plugin indent on     " required!
endif
set rtp+=~/Dropbox/vim/
set rtp+=~/.vim/bundle/zendjango.vim/
" 1.1.Basic "{{{2
let s:win_col       = 80
let s:win_row       = 42
let s:win_col_span2 = 2 * s:win_col + 1
let s:win_pos       = exists("s:win_pos") ? s:win_pos : 550
let mapleader       = "\<space>"
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
" set iskeyword+=$,@ 
" set iskeyword-=#
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
" 1.3.UI fonts colors "{{{2
" Guifont
if has("gui_running") "{{{
    if has ("win32") || has ("win64")
        " set gfw=Microsoft_YaHei:h13:cGB2312
        set guifont=Dejavu_Sans_Mono:h14:cANSI
        set gfw=Wenquanyi_Micro_Hei_Mono:h14:cANSI
    elseif has("gui_mac")
        set guifont=Monaco:h14
    elseif has("gui_gtk2") || has("gui_gnome")
        " the underscore is not showing with dejavu 14
        " set guifont=Dejavu\ Sans\ Mono\ 14,WenQuanYi\ Micro\ Hei\ 14
        set guifont=Monaco\ 14,Wenquanyi\ Micro\ Hei\ Mono\ 14
        set gfw=Wenquanyi\ Micro\ Hei\ Mono\ 14,WenQuanYi\ Zen\ Hei\ 14
    endif
endif "}}}
" colorscheme
let $colorscheme_n="galaxy"
" let g:galaxy_hl_visual_fg=1
colorscheme $colorscheme_n
" menu
if has("win32") || has("win64")
    source $VIMRUNTIME/delmenu.vim
    set langmenu=zh_CN.utf-8
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif
set winaltkeys=no                       " no ALT key for menus
let did_install_default_menus = 1       " no default menus
let did_install_syntax_menu = 1         " no syntax menus
" tabline
set showtabline=1 tabpagemax=15
" statusline
set ruler "column and line number even no status line
set rulerformat=%15(%c%V\ %p%%%)
set laststatus=2
" set statusline=%1*%02n.%*\ %03l:%02c\ %<%F%1*%m%r%*\%=\ %{&enc}\ %P
" set statusline=
"             \%*%2{mode()}\ %1*%(\ %M\%R\ %)%2*\ %Y\ %3*\ %{&enc}\ %(%k%)
"             \%5*\ %n:%<%F%=
"             \%6*%(\ %{&ff}\ %)%7*\ %03l\ %8*\ %03c\ \ %9*\ %P\ 
            " \%6*[%M%R%7*%(,%{&ff}%)%(,%k%)%8*,%{&enc}%9*%Y]

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

set mouse=a                 " Enable terminal mouse in all mode
set mousehide  " rightmouse in extend mode work wrong

set nolazyredraw
set visualbell t_vb=
" 1.4.vim version"{{{2
if v:version >= 703 "{{{
    " let &colorcolumn=s:win_col-1

    call s:auto_mkdir(expand('~/.vim_undo'),1)
    set undofile undodir=~/.vim_undo/   " persistent undo

    set conceallevel=0                
    set concealcursor=vni              " n Normal v Visual i Insert c Command
endif "}}}
" 2.Commands {{{1
" 2.1.Autocmds {{{2
aug au_GuiEnter "{{{
    au!
    au GuiEnter * set t_vb=
    exe "au GuiEnter * winpos ".s:win_pos." 0"
    exe "au GuiEnter * set columns=".s:win_col." lines=".s:win_row
aug END "}}}
aug au_Vimrc "{{{
    au!
    au SourcePre ~/.vimrc redraw | echohl WarningMsg
                \|echo "Reloading .vimrc"|echohl Normal
    au BufWritePost,FileWritePost ~/.vimrc redraw | echohl WarningMsg
                \|echo "Writing .vimrc"|echohl Normal
    au BufWritePost,FileWritePost ~/.vimrc so ~/.vimrc
    au SessionLoadPost * so ~/.vimrc
    au BufRead */.vimrc map <buffer> <F5> :silent so %<CR>
aug END "}}}
aug au_Buffer "{{{
    au!
    au BufEnter,BufNew,BufReadPost * silent! lcd %:p:h:gs/ /\\ /
    " to the line when file last opened
    au BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe  "normal! g`\"" | endif
aug END "}}}
" 2.2.Commands "{{{2
command! -nargs=0 Write w sudo:%
command! -nargs=0 AutoMkdir call <SID>auto_mkdir(expand('%:p:h'),0)
command! -nargs=1 TmpEdit    exe "edit ~/Desktop/".localtime().".".<q-args>

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
    exec "saveas ".a:name
    call s:delete(f)
    exec "edit ".a:name
endfunction "}}}
command! -nargs=0 Delete call <SID>delete(expand("%:p"))
command! -nargs=1 Rename call <SID>rename(<q-args>)

command! CopyName let @+ = expand('%:p:t')
command! CopyPath let @+ = expand('%:p:h')
command! CopyFull let @+ = expand('%:p')

command! SubFullWhite %s/　/  /g
command! TrimWhite %s/\s\+$//
command! TrimCtrlM %s//\r/
command! TrimCtrl0 %s/ //g
command! TrimDoubleLine %s/\n\n\n/\r/

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

" Compiles
com! GccGtk !gcc `pkg-config --cflags --libs gtk+-2.0` -o %:t:r %
com! Grr !./%:t:r


" 2.3.Insert Abbrevation "{{{2 
iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi.
" 2.4.Digraphs "{{{2 
" v- ǖ    v' ǘ    v< ǚ    v` ǜ
digraphs v- 470 v' 472 v< 474 v` 476
" XO ⊕  ns ₙ ms ₘ
digraphs XO 8853 ns 8345 ms 8344
" redefine DOWN-ARROW ↓ to '|v' which was '-v'
digraphs \|v 8595 \|^ 8593

" keymap
map <leader>mb :sp /usr/share/vim/vim73/keymap/<CR>
map <leader>mm :sp ~/.vim/keymap/mathematica.vim<CR>
map <leader>mk :set keymap=mathematica<CR>
map <leader>mn :set keymap=<CR>


" 3.Mappings "{{{1
" 3.1.Leader_Mapping "{{{2
" Single Key "{{{
nno   <leader>   <Nop>
vno   <leader>   <Nop>
nno   s          <Nop>
nno   S          <Nop>
nno   Q          <Nop>
" similar with D
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
nor <rightmouse><leftmouse> <c-o>
ino <rightmouse><leftmouse> <c-o><c-o>

"}}}
" Dotfiles "{{{
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
set diffopt=filler,vertical,foldcolumn:1,iwhite,context:4
nma <leader>da :1,$+1diffget<cr>
nma <leader>d1 :1,.diffget<cr>
nma <leader>d$ :.,$+1diffget<cr>
map <silent> <leader>dd :call <SID>toggle_diff()<CR>
map <silent> <leader>do :call <SID>diff_this()<CR>
function! s:toggle_diff() "{{{
    if &diff
        diffoff
        let &foldmethod = exists("b:foldmethod") ? b:foldmethod : "marker"
        set foldenable foldcolumn=0
        echoh ModeMsg    | ec "diffmode Off" | echoh None
    else
        let b:foldmethod=&foldmethod
        diffthis
        set foldcolumn=0
        echoh WarningMsg | ec "diffmode On"  | echoh None
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
" Toggle Fold "{{{
set foldtext=MyFoldText()
set foldenable foldmethod=marker 
set foldcolumn=0
set foldlevel=0 foldlevelstart=0
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldclose=
nno <silent> zf :set opfunc=MyFoldMarker<CR>g@
vno <silent> zf :<C-U>call MyFoldMarker(visualmode(), 1)<CR>zv
nno <silent> zz @=(&foldlevel?'zM':'zR')<CR>
nno <silent> <leader>zz @=(&foldlevel?'zM':'zR')<CR>
nno <silent> <leader><leader> @=(foldclosed('.')>0?'zv':'zc')<CR>
vno <silent> <leader><leader> <ESC>@=(foldclosed('.')>0?'zv':'zc')<CR>gv
nor <2-rightmouse> @=(foldclosed('.')>0?'zv':'zc')<CR>
vno <2-rightmouse> <ESC>@=(foldclosed('.')>0?'zv':'zc')<CR>gv
nor <silent> <leader>ff :setl fdm=<C-R>=&fdm=~'mar'?'indent'
            \:&fdm=~'ind'?'syntax'
            \:&fdm=~'syn'?'expr':'marker'<CR><BAR>ec &fdm<CR>
function! MyFoldText() "{{{
    let markers = split(&foldmarker, ",")
    let cmtmakrer = substitute(&commentstring, "%s", markers[0], "")
    let sub = markers[0].'\d\=\|'.cmtmakrer.'\d\='
    let line = substitute(getline(v:foldstart), sub, '', 'g')
    let pre_white= matchstr(line,'^\s*')
    if len(line)<=50 
        let line = line."  ".repeat('-',50) 
    else
        " trim preceding whitespace to 50
        if len(pre_white)>=50
            let line = substitute(line,'^\s*',repeat(' ',40),'')
        endif
    endif
    let line = printf("%-50.50s",line)
    let dash = printf("%-4s",repeat("+",v:foldlevel))
    let num = printf("%4s",(v:foldend-v:foldstart))
    return line."[".num.dash."]"
    " return "+-" . v:folddashes.printf("%3d",(v:foldend-v:foldstart)).
    "     \ " lines: " . line
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
"}}}
" Toggle Option "{{{
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

" aegimrLtT
" set go-=aeimrLT       " XXX: NO effect
set go=Agt
nor <m-1> :set <C-R>=&go=~#'m' ? 'go-=m' : 'go+=m'<CR><CR>
nor <m-2> :set <C-R>=&go=~#'r' ? 'go-=rL': 'go+=rL'<CR><CR>
nor <m-3> :set <C-R>=&go=~#'T' ? 'go-=T' : 'go+=T'<CR><CR>

nma <leader>12 :filetype detect \| syntax enable <CR>
nma <leader>11  :syn sync maxlines=200<CR>
nma <leader>1m  :emenu Syntax.
nma <leader>1v  :exe "sp $VIMRUNTIME/syntax/".&syntax.".vim"<CR>
nma <leader>1d  :exe "sp ~/Dropbox/vim/syntax/".&syntax.".vim"<CR>
nma <silent><leader>1s :call <SID>SynStack()<CR>
function! s:SynStack() "{{{
    if exists("*synstack")
        for id in synstack(line("."), col("."))
            echon " ".synIDattr(id, "name")
            exe "echoh ".synIDattr(id, "name")
            echon "[".synIDattr(synIDtrans(id), "name")."]"
            echoh None
        endfor
    endif
endfunc "}}}
"}}}
" 3.2.Switch Window "{{{2
set winheight=5 winwidth=5          " current window minimum width/height
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

map <C-Up>      :tabclose<CR>
map <S-Up>      :close<CR>
map <C-Down>    :tabnew<CR>
map <S-Down>    :new<CR>

map <C-Right>   :tabnext<CR>
map <S-Right>   :wincmd w<CR>
map <C-Left>    :tabprev<CR>
map <S-Left>    :wincmd p<CR>
function! s:is_win_vert() "{{{
    return winwidth(0) < &columns
endfunction "}}}
function! s:is_vim_span() "{{{
    return &columns >= s:win_col_span2
endfunction "}}}
function! s:max_resize_win() "{{{
    resize +15
    if &lines != s:win_row
        let &lines=s:win_row
    endif
    if !s:is_vim_span() && s:is_win_vert()
        vertical resize
    endif
endfunction "}}}
function! s:span_vert_win(force) "{{{
    if a:force || (s:is_win_vert() && !s:is_vim_span())
        if has("gui_running")
            let &columns = s:win_col_span2
        endif
    endif
endfun "}}}
function! s:fold_vert_win(force) "{{{
    if &lines != s:win_row
        let &lines=s:win_row
    endif
    if a:force || (!s:is_win_vert() && s:is_vim_span())
        if has("gui_running")
            let &columns = s:win_col
        endif
        exe "winpos ".s:win_pos." 0"
    endif
endfun "}}}
function! s:place_vim() "{{{
    let s:win_pos = getwinposx()>=0 ? getwinposx() : s:win_pos
    if     s:win_pos <= 100 | let s:win_pos = 550
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
        if has("gui_running")
            let &columns = s:win_col_span2
        endif
        vsplit
    endif
endfun
"}}}
command! -bar Split call <SID>split()
" 3.3.HJKL "{{{2
set scrolloff=1 scrolljump=1
nno   H   h
nno   L   l
nno   J   j
nno   K   k

nno   j   gj
nno   k   gk
" xno: visual mode exclude select mode.
xno   j   gj
xno   k   gk

nno   <silent>   <c-h>   K
nno   <silent>   <c-l>   :let @/=''\|redraw!<CR>
nno   <silent>   <c-j>   J
ino   <silent>   <c-j>   <c-k>
ino   <silent>   <c-f>   <c-k>

vno   <c-CR>   gq
nno   <c-CR>   kJ
ino   <c-CR>   <esc>kJi
vno <c-kEnter>   gq
nno <c-kEnter>   kJ
ino <c-kEnter>   <esc>kJi
nno   <m-CR>   o
ino   <m-CR>   <esc>o
nor   <s-CR>   o<ESC>
ino   <s-CR>   <esc>O

"X11 only
map   <ScrollWheelUp>       3k
map   <ScrollWheelDown>     3j
map   <S-ScrollWheelUp>     <c-b>
map   <S-ScrollWheelDown>   <c-f>
nno   <C-ScrollWheelDown>   >>
nno   <C-ScrollWheelUp>     <<
vno   <C-ScrollWheelDown>   >gv
vno   <C-ScrollWheelUp>     <gv
" insert mode moving "{{{
ino <m-j> <c-o>gj
ino <m-k> <c-o>gk
ino <m-h> <left>
ino <m-l> <right>
ino <m-s-h> <s-left>
ino <m-s-l> <s-right>
cno <m-h> <left>
cno <m-l> <right>
cno <m-s-h> <s-left>
cno <m-s-l> <s-right>

ino <m-o> <c-o>o
ino <m-O> <c-o>O
ino <m-c>  <esc>

nor <m-x> <c-a>
ino <c-a> <esc>^i
cno <c-a> <c-b>
ino <c-b> <esc>^i
ino <c-e><c-e> <esc>$a

ino <c-left> <c-o>B
"}}}
" 3.4.Editing "{{{2
" Wrap text "{{{
" VimwikiWord
nno <Leader>eW BvEc[[<C-r>"]]<ESC>`[
nno <Leader>ew bvec[[<C-r>"]]<ESC>`[
nno <Leader>el ^vg_c_*<C-r>"*_<ESC>`[
nno <Leader>e* BvEc*<C-r>"*<ESC>`[

" php
nno <leader>ep ciw<?php <C-r>" ?><ESC>
vno <Leader>ep c<?php <C-r>" ?><ESC>`[
" html comment
nno <leader>e! ciw<!-- <C-r>" --><ESC>
vno <Leader>e! c<!-- <C-r>" --><ESC>`[
"}}}
" Todo text "{{{
nno <leader>et :call <SID>insert_t(" TODO:")<CR>
nno <leader>ef :call <SID>insert_t("FIXME:")<CR>
nno <leader>en :call <SID>insert_t(" NOTE:")<CR>
nno <leader>ee :call <SID>toggle_with_T()<CR>
" TODO:
"FIXED: 2012-04-24
" NOTE:
let s:rx_toggle = [['TODO',   'DONE'],
                \ ['FIXME',   'XXX',  'WKRND', 'WNTFX', 'FIXED'],
                \ ['NOTE',    'WARNING'],
                \ ]
let s:rx_timestamp = '\(\d\{6}\|\d\{4}-\d\{2}-\d\{2}\)'
let s:fm_timestamp = "%Y-%m-%d"
function! s:insert_t(text) "{{{
    if &syn=="vimwiki"
        let cmnt = a:text
    else
        let cmnt = substitute(&commentstring, '%s', a:text, "")
    endif
    if getline('.')=~'^\s*$'
        exec 'normal! I' . cmnt
    else
        let fo=&fo
        set fo=2
        exec 'normal! o' . cmnt
        let &fo=fo
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
                    " remove all timestamp when idx is list[0]
                    if line =~# rx_lst.' '.s:rx_timestamp
                        let line = substitute(line,' '.s:rx_timestamp,'','')
                    endif
                elseif i == len(rx_list)-2
                    let time = strftime(s:fm_timestamp)
                    " add timestamp when idx is list[-1]
                    if line =~# rx_lst.' '.s:rx_timestamp
                        let line = substitute(line,s:rx_timestamp, time,'')
                    else
                        let line = substitute(line,'\C'.rx_lst, '& '.time,'')
                    endif
                endif
                let rx_list[r]=printf("%".len(rx_list[i])."s", rx_list[r])
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
" Line format "{{{
nmap gUu :s/\v<(.)(\w*)/\u\1\L\2/g\|nohl<CR>
nmap gcw guiw~w

function! s:insert_num(num,mode) range "{{{
    let num = a:num
    " XXX: Could not receive "" as argument.
    let mode = a:mode == "" ? "" : a:mode
    let col_f = col("'<")
    let col_l = col("'>")
    let col_n = abs(col_l-col_f+1)
    for i in range(a:firstline,a:lastline)
        let num_s = printf("%".mode.col_n."d", num)
        let line = getline(i)
        let line = substitute(line, '\%>'.(col_f-1).'c.\{'.col_n.'}', num_s, '')
        call setline(i, line)
        let num += 1
    endfor
endfunction "}}}
map <leader>i0  :call <SID>insert_num(1,"0")<CR>
map <leader>in  :call <SID>insert_num(1," ")<CR>
map <leader>i-  :call <SID>insert_num(1,"-")<CR>

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
            \['｛','｝'], ['［','］'], ['（','）'], ['＜','＞'],
            \['＂','＂'], ["＇","＇"],
            \]
for [s,e] in pair_list
    " input style 1 : 
    exec 'ino '.s.  ' '.s
    exec 'ino '.s.s.' '.s.e.'<left>'
    exec 'cno '.s.s.' '.s.e.'<left>'
    exec 'cno '.s.  ' '.s

    " " input style 2 : 
    " " easier to inpu a single s , but often mistake for two quote
    " exec 'ino '.s.' '.s.e.'<left>'
    " exec 'ino '.s.'<esc> '.s
    " exec 'ino '.s.s.' '.s
    " exec 'cno '.s.' '.s.e.'<left>'
    " exec 'cno '.s.s.' '.s
    " exec 'cno '.s.'<esc> '.s

    exec 'ino '.e.'<c-a> '.e.'<esc>m`^i'.s.'<esc>``a'
    exec 'ino '.e.'<c-b> '.e.'<esc>m`Bi'.s.'<esc>``a'
    exec 'cno '.e.'<c-a> '.e.'<home>'.s
    exec 'cno '.e.'<c-b> '.e.'<s-left>'.s
    exec 'ino '.s.'<c-e> '.s.'<esc>m`$a'.e.'<esc>``a'
    exec 'ino '.s.'<c-w> '.s.'<esc>m`Ea'.e.'<esc>``a'
    exec 'cno '.s.'<c-e> '.s.'<end>'.e
    exec 'cno '.s.'<c-w> '.s.'<s-right>'.e
    if s != e
        exec "ino ".s.e." ".s.e
    endif
    unlet s
    unlet e
endfor
ino {<CR>  {<CR>}<Esc>O<tab>
ino {<c-e> {<c-o>mz<end><cr>}<c-o>`z<cr><tab>
"}}}
" 3.5.MsWin "{{{2
source $VIMRUNTIME/mswin.vim
behave xterm
set mousemodel=popup " rightmouse in extend mode work wrong
"open fold while undo /redo
nor <C-Z>       uzv
ino <C-Z>       <C-O>u<C-O>zv
vno <C-Z>       <Nop>

nor <C-Y>       <C-R>zv
ino <C-Y>       <C-O><C-R><C-O>zv
vno <C-Y>       <Nop>

" Filter "+gP
nor <C-V>	    "+gp
nor <S-Insert>	"+gp
" Cut
" vno <C-D>       "+x

" CTRL-A is Select all
noremap <C-A> ggVG
inoremap <C-A> <C-O>^
cnoremap <C-A> <C-C>ggVG
onoremap <C-A> <C-C>ggVG
snoremap <C-A> <C-C>ggVG
" 3.6.Search "{{{2
set hlsearch incsearch
set ignorecase smartcase
set nowrapscan
nno   #    g* | nno   g#   *
nno   *    g# | nno   g*   #
vno   /    <ESC>/<C-\>e<SID>p(<SID>r(),"e")<CR>
vno   ?    <ESC>?<C-\>e<SID>p(<SID>r(),"e")<CR>
vno   #    <ESC>/<C-\>e<SID>p(<SID>r(),"e")<CR><CR><C-G>
vno   *    <ESC>?<C-\>e<SID>p(<SID>r(),"e")<CR><CR><C-G>
vno   n    <ESC>/<C-\>e<SID>p(<SID>r(),"e")<CR><CR><C-G>
vno   N    <ESC>?<C-\>e<SID>p(<SID>r(),"e")<CR><CR><C-G>
function! s:p(p,mode) "{{{
    if a:mode =~ "s"
        let re_txt =  ''
    elseif a:mode =~ "e"
        let re_txt =  '*[]/~.$\'
    elseif a:mode =~ "r"
        let re_txt =  '&'
    endif
    return escape(a:p,re_txt)
endfunction "}}}
function! s:r() "{{{
    normal gv"yy
    let w = @y
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

nno <silent> n :call <SID>wrapscan_warn('f')<CR>
nno <silent> N :call <SID>wrapscan_warn('b')<CR>
function! s:wrapscan_warn(d) "{{{
    " show an warning message when hit end of file.
    try
        if (a:d=='f' && v:searchforward == 1)
            \ || (a:d=='b' && v:searchforward == 0)
            //
        else
            ??
        endif
    catch /^Vim\%((\a\+)\)\=:E38[45]/
        echohl Comment
        echon ' Searching of '
        echohl Warningmsg
        if v:searchforward ==1
            echon @/[:15]
            echohl Comment
            echon ' hit END-Of-File.'
        else
            echon @/[:15]
            echohl Comment
            echon ' hit TOP-Of-File.'
        endif
        let c = nr2char(getchar(1))
        if  v:searchforward == 0
            call search(@/,'wb')
            echon ' Wrapscan to END'
        elseif v:searchforward == 1
            call search(@/,'w')
            echon ' Wrapscan to TOP'
        endif
        echohl Normal
    endtry
endfunction "}}}
" 3.7.F1-F12 "{{{2
"{{{3 F1 Help
set keywordprg=":help"
set helplang=en
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
        elsei syn=="lua"        | exec "luafile %"
        elsei syn=='vim'        | exec "so %"
        elsei syn=~'html'       | exec bang.browser.file
        elsei syn=~'^coffee$'   | exec "CoffeeRun"
        elsei syn=="vimwiki"    | exec "Vimwiki2HTMLBrowse"
        elsei syn=='bat'        | exec "w !cmd"
        elsei syn=='go'         | exec "!go run %"
        elsei syn=='make'       | make
        elsei syn=='haskell'    | exec "!ghc %" | exec "!./%:t:r"
        elsei syn=='cpp' || syn=='c' | call s:gcp()  | exec "!./%:t:r"
        elsei syn=~'^\(sh\|expect\|bash\)$'     | exec "w !sh"
        else                    | exec bang.runner.file
        endif
    elseif a:mode=="v"
        if     syn=="python"    | exec "py ".getline('.')
        elseif syn=="ruby"      | exec "ruby ".getline('.')
        elseif syn=="lua"       | exec "lua".getline('.')
        elseif syn=='vim'       | exec getline('.')
        elseif syn=~'^\(sh\|expect\|bash\)$'    | exec ".w !sh"
        endif
    endif
endfunction "}}}
function! s:gcp() "{{{
    let lf = ''
    for l in getline(1,10)
        if l =~ 'gtk\|gdk'
            let lf .= 'g'
        endif
        if l =~ 'math'
            let lf .= 'm'
        endif
    endfor
    let lib=''
    if lf =~ 'g' 
        let lib .=' `pkg-config --cflags --libs gtk+-2.0` '
    endif
    if lf =~ 'm'
        let lib .= ' -lm '
    endif
    exec "!gcc -Wall " . lib . " -o %:t:r %"
endfunction "}}}
"}}}3
nor   <F6>   :TagbarToggle<CR>
nor   <F7>   :GundoToggle<CR>
"{{{3 F8 File Manager
nor   <F8>   :call <SID>file_man("")<CR>
nor   <S-F8> :call <SID>file_man("sudo ")<CR>
function! s:file_man(mode) "{{{
    if has("win32") || has("win64") | exec "!start explorer '%:p:h'"
    else            | exec "!".a:mode."nautilus '%:p:h' "
    endif
endfunction "}}}
"{{{3 F9 Termnial
nor   <silent><F9>   :call <SID>terminal()<CR>
function! s:terminal() "{{{
    if has("win32") || has("win64") | exec "!start cmd '%:p:h'"
    else            | exec "!gnome-terminal --working-directory=%:p:h &"
    endif
endfunction "}}}
"}}}3
nor   <F10>   :options<CR>
nor   <F11>   :script<CR>
"{{{3 F12 Session
set sessionoptions=blank,curdir,help,tabpages,winpos,winsize,resize
if has("unix")
    nma <F12> :Hex! ~/.vim/sessions<CR>G$mfms
    nma <M-F12> :Hex! ~/.vim/sessions<CR>
else
    nma <F12> :Hex $HOME\.vim\sessions<CR>G$mfms
    nma <M-F12> :Hex $HOME\.vim\sessions<CR>
endif
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
aug au_Plugins "{{{
    au!
    au colorscheme *.vwk call s:vimwiki_my_set()
    au FileType,Syntax vimwiki  call s:vimwiki_my_set()
    au FileType netrw    call s:netrw_my_set()
aug END "}}}
" Netrw "{{{2
let g:netrw_keepdir= 0
" let g:netrw_preview        = 0
let g:netrw_liststyle      = 0
let g:netrw_browse_split   = 0
let g:netrw_cursor         = 3
let g:netrw_banner         = 0
let g:netrw_mousemaps      = 0
let g:netrw_special_syntax = 1
let g:netrw_timefmt        = "%y-%m-%d  %H-%M-%S"
let g:netrw_list_hide      = '^[.]\w\|.*\.swp$'
let g:netrw_cursor         = 0
let g:netrw_errorlvl       = 1
let g:netrw_home           = expand('~/.vim')

function! s:netrw_my_set() "{{{
    nor   <buffer>qq               :close<CR>
    map   <buffer><2-leftmouse>    <CR>
    map   <buffer><space><space>   mf
endfunction "}}}
" Neocomplcache "{{{2
nno <leader>nt :NeoComplCacheToggle<CR>
nno <leader>nb :NeoComplCacheCachingBuffer<CR>
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
ino <expr>.   pumvisible() ? "." : "."
ino <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
ino <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<s-TAB>"

imap <C-k>  <Plug>(neocomplcache_snippets_expand)
smap <C-k>  <Plug>(neocomplcache_snippets_expand)
nmap <c-k> a<c-k><esc>

let g:neocomplcache_snippets_dir="~/Dropbox/vim/my_snips/snippets_complete/"
map <leader>se :sp\|NeoComplCacheEditSnippets<cr>
map <leader>sr :sp\|NeoComplCacheEditRuntimeSnippets<cr>
map <leader>s_ :sp\|e ~/Dropbox/vim/my_snips/snippets_complete/_.snip <cr>

" Vimwiki "{{{2
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
let g:vimwiki_camel_case    = 0
let g:vimwiki_menu          = ""
let g:vimwiki_dir_link      = 'index'
if has("unix")
    let g:vimwiki_browsers      = ['firefox']
else
    let g:vimwiki_browsers      = ['d:\SoftWareD\Browser\firefox4\firefox.exe']
endif
let g:vimwiki_conceallevel  = 0
let g:vimwiki_lower         = "a-z0-9\u0430-\u044f"
let g:vimwiki_list_ignore_newline =0
let g:vimwiki_url_mingain   = 99                " url Conceal length
let g:vimwiki_use_mouse     = 1
let g:vimwiki_folding       = 1
let g:vimwiki_fold_lists    = 0
let g:vimwiki_hl_cb_checked = 1
function! s:sub_list(sym) "{{{
    let line=getline('.')
    if a:sym != " "
        let sym = a:sym
    else
        let sym = ""
    endif
    let m=substitute(line,'^\(\s*\)\%([*#-]\s\|\%(\d\.\)\+\s\)\=\ze.*',
                \'\1'.sym.' ','')
    if a:sym == " "
        let m =substitute(m,'^\s','','')
    endif
    call setline(line('.'),m)
endfunction "}}}
function! s:vimwiki_my_set() "{{{

    hi VimwikiBold NONE
    hi link VimwikiBold Title
    hi VimwikiItalic NONE
    hi link VimwikiItalic Character
    hi VimwikiItalicBold NONE
    hi link VimwikiItalicBold Exception
    hi VimwikiBoldItalic NONE
    hi link VimwikiBoldItalic Exception
    hi VimwikiStrikeOut NONE

    silent! syn clear VimwikiTimeStamp
    syn match VimwikiTimeStamp /\%(\d\{4}-\d\{2}-\d\{2}\|\d\{6}_\d\{4}\)/

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
    hi link VimwikiList Label
    hi link VimwikiTimeStamp SpecialComment
    

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
    map <buffer><leader>e1 :call <SID>sub_list('1.')<cr>
    map <buffer><leader>e2 :call <SID>sub_list('*')<cr>
    map <buffer><leader>e3 :call <SID>sub_list('#')<cr>
    map <buffer><leader>e4 :call <SID>sub_list('-')<cr>
    map <buffer><leader>e5 :call <SID>sub_list(' ')<cr>


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

    vno <buffer><c-CR>   gq
    nno <buffer><c-CR>   kJ
    ino <buffer><c-CR>   <esc>kJi
    vno <buffer><c-kEnter>   gq
    nno <buffer><c-kEnter>   kJ
    ino <buffer><c-kEnter>   <esc>kJi
    nor <buffer><s-CR>   o<ESC>
    ino <buffer><s-CR>   <esc>O
    setl shiftwidth=4 softtabstop=4
    setl cms=%%%%\ %s
    setl foldmethod=expr
    setl foldexpr=VimwikiFoldLevel(v:lnum)
endfun "}}}
" Git "{{{2
nmap  <leader>ga :call <SID>git_add()<cr>
nmap  <leader>gc :Gcommit<cr>
nmap  <leader>gp :Git push<cr>
nmap  <leader>gd :Gsdiff<CR>
nmap  <leader>gb :Git branch -r<CR>
nmap  <leader>gs :Git diff --stat<CR>
nmap  <leader>gk :Git checkout
nmap  <leader>gr :Git branch
nmap  <leader>wc :bot cw<CR>
function! s:git_add() "{{{
    LastUpdate | update! | redraw
    try
        Git add %
    catch /^Vim\%((\a\+)\)\=:E492/
        echohl WarningMsg
        echo "[Warning]Not a git repo..."
        echohl Normal
    endtry
endfunction "}}}
" Python "{{{2
" " Execute the tests
" nmap <silent><Leader>tf <Esc>:Pytest file<CR>    
" nmap <silent><Leader>tc <Esc>:Pytest class<CR>   
" nmap <silent><Leader>tm <Esc>:Pytest method<CR>  
" " cycle through test errors 
" nmap <silent><Leader>tn <Esc>:Pytest next<CR>     
" nmap <silent><Leader>tp <Esc>:Pytest previous<CR> 
" nmap <silent><Leader>te <Esc>:Pytest error<CR>    





" " Add the virtualenv's site-packages to vim path
" py << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF


" Syntasic "{{{2
let g:syntastic_python_checker = 'pyflakes'
nmap <leader>ln :lne<CR>
nmap <leader>lp :lpr<CR>

" Misc Plugins "{{{2

nor <leader>cc :TComment<cr>
nor \\ :TComment<cr>

nma <leader>cE :ColorVEditAll<CR>

vma <leader>ft :Tab /
nma <leader>ft :.Tab /
" 5.FileTypes "{{{1
aug au_Filetypes "{{{
    au!
    au BufRead,BufNewFile *.j,*.wct setf jass
    au BufRead,BufNewFile *.mako    setf mako
    au BufRead,BufNewFile *.conf    setf conf
    au BufRead,BufNewFile tmux.conf setf tmux
    au FileType c,cpp    setl fdm=syntax
    au FileType jass     setl wrap fdm=syntax
    au FileType jass     nor <buffer> gD :call <SID>jass_goDef()<CR>
    au FileType javascript call <SID>js_fold()
    au FileType css call <SID>css_fold()
    au FileType python map <buffer> <F1> :Pydoc <C-R><C-W><CR>
    au FileType python map <buffer> K k
    au FileType python setl foldtext=MyFoldText()
    " au FileType javascript setl fdm=syntax
    au Filetype php,html,xhtml,xml setl shiftwidth=4 softtabstop=4
    au Filetype php,html,xhtml,xml setl foldmethod=indent
    au FileType help setl isk+=-,:
    au FileType help    call <SID>hlp_fold()
    au FileType vim setl isk+=:
aug END "}}}
" PHP "{{{2
let php_sql_query = 1
let php_folding=2
let php_htmlInStrings = 1
let php_parent_error_close = 1
" Help "{{{2
function! s:hlp_fold() "{{{
    setl foldmethod=syntax
    setl foldtext=MyHlpFoldText()
    syn region foldBraces start=/[-=]\{50,}/
                \ end=#\ze[-=]\{50,}# transparent fold keepend
endfunction "}}}
function! MyHlpFoldText() "{{{
    let dash = getline(v:foldstart)[0]
    let line = getline(v:foldstart+1)
    let num = printf("%4s",(v:foldend-v:foldstart))
    let line = substitute(line, '\%>44c\%<53c', '['.dash.num.']', '')
    return line
endfunction "}}}
" JavaScript {{{2
function! s:js_fold() "{{{
    setl foldmethod=syntax
    syn region foldBraces start=/{/ skip=#/\%([^/]\|\/\)*/\|'[^']*'\|"[^"]*"#
                \ end=/}/ transparent fold keepend extend 
endfunction "}}}
" Css {{{2
function! s:css_fold() "{{{
    setl foldmethod=syntax
    syn region foldBraces start=/{/ skip=#/[^/]*/\|'[^']*'\|"[^"]*"#
                \ end=/}/ transparent fold keepend extend
endfunction "}}}
" Vim "{{{2
let g:vimsyn_noerror = 1
" let g:vimsyn_folding = 'afPr'
" Jass "{{{2
function! s:jass_goDef() "{{{
    let @/ = expand('<cword>')
    let cj = expand("~/Dropbox/Vimwiki/Project/Game/common.j")
    let bj = expand("~/Dropbox/Vimwiki/Project/Game/blizzard.j")
    for f in [cj,bj]
        let bufnr = bufnr(f,1)
        exe "sbuffer ".bufnr
        setl ro
        call search(@/,'w')
    endfor
endfunction "}}}
" MarkDown "{{{2

aug au_blog_MARKDOWN "{{{
    au!
    au! BufRead,BufNewFile */Rykka.github.com/**.md    call <SID>blog_setup()
aug END
function! s:blog_setup() "{{{
    set ft=markdown 
    map <silent><buffer> <leader>mp  :!rake post title=""<left>
    map <silent><buffer> <leader>mg  "!rake page name="pages/"<left>
endfunction "}}}
"}}}1
" Test
" vim:tw=0 sw=4 ts=4 sts=4 fdm=marker fdls=0 :
