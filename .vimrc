" vim:tw=0 sw=4 ts=4 sts=4 fdm=marker fdls=0 :
"""""""""""""""""""""""""""""""""""""""""""""""""
"vimrc Index "{{{
"1.General_Settings
"  1.1.guifonts_color_and_term
"  1.2.Misc_Settings
"2.AutoCmd_Group
"3.Commands_And_Abbreviations
"4.Key_Mapping_General
"  4.1.Leader_Mapping
"  4.2.Window_control_mapping
"  4.3.move_around_mapping
"  4.4.Edit_and_formatting
"  4.5.win_behave_settings
"5.Plugins_settings
"6.Function_And_Key_Mapping
"7.Other_Stuffs
"  Author: Rykka.Krin <Rykka10@gmail.com>
"  Update: 2012-02-09
"  "Tough time Goes , Tough People Stay." "}}}
"""""""""""""""""""""""""""""""""""""""""""""""""
" 1.General_Settings{{{1
"{{{2 1.0. bundles load
if !exists("g:bundles_loaded") || g:bundles_loaded != 1
    let g:bundles_loaded = 1

    set nocompatible               " be iMproved
    filetype off                   " required!
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
"{{{ Vundles
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/sudo.vim'
Bundle 'vim-scripts/fcitx.vim'
Bundle 'kien/ctrlp.vim'
let g:ctrlp_dotfiles = 0
let g:ctrlp_max_depth = 10

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'tungd/unite-session'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
let g:vimshell_user_prompt = 'getcwd()'
let g:vimshell_prompt = $USER.'> '

Bundle 'mattn/calendar-vim'

Bundle 'majutsushi/tagbar'
let g:tagbar_compact = 1
let g:tagbar_width = 30

Bundle 'mattn/zencoding-vim'
let g:user_zen_leader_key = '<c-e>'
let g:user_zen_settings = { 'indentation' : '    '}

let g:user_zen_expandabbr_key = '<c-e>e'    "e
let g:user_zen_expandword_key = '<C-E>E'    "e
    "'user_zen_balancetaginward_key'         d
    "'user_zen_balancetagoutward_key'        D
let g:user_zen_next_key='<c-e>j'            "n
let g:user_zen_prev_key='<c-e>k'            "p
    "'user_zen_imagesize_key'                i
    "'user_zen_togglecomment_key'            /
    "'user_zen_splitjointag_key'             j
let g:user_zen_removetag_key='<c-e>d'       "k
    "'user_zen_anchorizeurl_key'             a
    "'user_zen_anchorizesummary_key'         A

Bundle 'sjl/gundo.vim'
let g:gundo_preview_bottom = 1
let g:gundo_width=30
let g:gundo_right = 1

Bundle 'tomtom/tcomment_vim'

Bundle 'scrooloose/nerdtree'

Bundle 'lilydjwg/csspretty.vim'
Bundle 'matchit.zip'
Bundle 'kchmck/vim-coffee-script'

Bundle 'fs111/pydoc.vim'

Bundle 'vim-scripts/sketch.vim'
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
"Basic Setting "{{{2
function! s:auto_mkdir(dir, force) "{{{
    if !isdirectory(a:dir) && (a:force ||
                \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
endfunction "}}}
set history=255
set viminfo='100,\"30,:30,s10,!

set autoread
" set autowrite

set nolazyredraw

set browsedir=buffer
set hidden bufhidden=hide switchbuf=useopen

set noequalalways
set splitbelow splitright

set scrolloff=3 scrolljump=1

set visualbell t_vb=

set virtualedit=block

set shortmess+=As           " no swap exists 'ATTENTION'
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set report=0                " : commands always print changed line count.

set showmatch               " show matchpairs

set foldenable foldmethod=marker foldcolumn=1
set foldlevel=0 foldlevelstart=0
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldclose=

set expandtab tabstop=4  smarttab
set softtabstop=4 shiftwidth=4
set shiftround              " rounds indent to a multiple of shiftwidth
set autoindent
set copyindent              " copy the previous indentation on autoindenting

set mouse=a                 " Enable terminal mouse in all mode
set mousemodel=popup mousehide

set isfname-==
set iskeyword+=_,$,@
set iskeyword-=#

set backup
call s:auto_mkdir(expand('~/.vim_backups'),1)
set backupdir=~/.vim_backups/

set noswapfile
call s:auto_mkdir(expand('~/.vim_swaps'),1)
set directory=~/.vim_swaps/

set completeopt=menuone
set pumheight=10            " Keep a small completion window

set cscopetag               " When using :tag, <C-]>, or "vim -t", try cscope:
set cscopetagorder=0        " try ":cscope find g foo" and then ":tselect foo"

set cryptmethod = "blowfish"

set nopaste
set pastetoggle=<F2>

set comments=n://,fb:-,n:>,fb:*

set formatlistpat="^\s*[(\d)*#-]\+[\]:.)}\t ]\s*"
set formatoptions+=1on2mMq
" set formatoptions-=r      " Do not automatically insert a comment
" set formatoptions-=t      " Do no auto-wrap text using textwidth
if has("unix")
    set shell=sh
endif

if has('unnamedplus') "{{{
    set clipboard+=unnamedplus "All system
else
    if has("unix")
        set clipboard+=unnamed "System clipboard
    else
        set clipboard=
    endif
endif "}}}
"{{{2 Multi_Byte
set fileformats=unix,dos
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,latin-1
if has("win32")
    set langmenu=en_US
    language messages zh_CN.utf-8
endif
if has("multi_byte")
    "language messages zh_CN.utf-8
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
    set encoding=utf-8
endif
if has('arabic')
    set noarabicshape
endif
" 1.1.ui fonts colors "{{{2
"{{{ Guifont And Color
if has("gui_running")
    if has ("win32") ||  has ("win64")
        set guifont=Dejavu_Sans_Mono:h14:cANSI
        " set gfw=Microsoft_YaHei:h13:cGB2312
        set gfw=Wenquanyi_Micro_Hei_Mono:h14:cANSI
    elseif has("gui_mac")
        set guifont=Monaco:h14
        " set gfw=Wenquanyi\ Micro\ Hei\ Mono\ 13,WenQuanYi\ Zen\ Hei\ 13
    elseif has("gui_gtk2") || has("gui_gnome")
        set guifont=Dejavu\ Sans\ Mono\ 14,WenQuanYi\ Micro\ Hei\ 14
        set gfw=Wenquanyi\ Micro\ Hei\ Mono\ 14,WenQuanYi\ Zen\ Hei\ 14
    endif
endif "}}}
" menu
set winaltkeys=no           " no ALT key for menus
if has("gui_running") "{{{
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "Always show file types in menu
    let do_syntax_sel_menu=1
endif "}}}
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
" 1.2.vimrc s:var "{{{2
let s:win_col = 80
let s:win_col_span2 = 2 * s:win_col + 1
let s:win_pos = 550
" 1.3.vim version"{{{2
if v:version >= 703 "{{{
    let &colorcolumn=s:win_col-1

    call s:auto_mkdir(expand('~/.vim_undo'),1)
    set undofile undodir=~/.vim_undo/   " persistent undo

    set conceallevel=2              " always SHOW conceal text
    set concealcursor=c             " n Normal v Visual i Insert c Command
endif "}}}
" 2.AutoCmd_Group{{{1
aug au_GuiEnter "{{{
    au!
    au GuiEnter * set t_vb=
    exe "au GuiEnter * winpos ".s:win_pos." 0"
    exe "au GuiEnter * winsize ".s:win_col." 45"
    au GuiEnter * silent! normal! V<ctrl-c>
aug END "}}}
aug au_vimrc "{{{
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
    " lcd
    au BufEnter,BufNew,BufReadPost * silent! lcd %:p:h:gs/ /\\ /
    " to the line last open
    au BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe  "normal! g`\"" | endif
aug END "}}}
aug au_Filetypes "{{{
    au!
    au BufRead,BufNew,BufNewFile *.j setl ft=jass
    au BufRead,BufNew,BufNewFile *.mako setl ft=mako
    au BufRead,BufNew,BufNewFile *.conf setl ft=conf
    au BufRead,BufNew,BufNewFile tmux.conf setl ft=tmux
aug END "}}}
aug au_htmls "{{{
    au!
    " Autoclose tags on html, xml, etc
    au FileType php,html,xhtml,xml imap <buffer> <C-m-b> </<C-X><C-O>
    au Filetype php,html,xhtml,xml set shiftwidth=4 softtabstop=4
    au Filetype php,html,xhtml,xml set foldmethod=indent
aug END "}}}
aug au_colors "{{{
    au!
    au! FileType vimwiki call Vimwiki_color()
    au! colorscheme *.vwk call Vimwiki_color()
fun! Vimwiki_color() "{{{
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

    for i in range(1,9)
        exe 'syn match Vimwiki_Posit'.i.' /\S\@<!\(+'.i.'\|\[+'.i.'\]\)\S\@!/'
        exe 'syn match Vimwiki_minus'.i.' /\S\@<!\(-'.i.'\|\[-'.i.'\]\)\S\@!/'
    endfor
    syn match Vimwiki_Posit0 /\(^\s*\|.*\s\)\(+0\|\[+0\]\)\(\s*$\|\s.*\)/
    syn match Vimwiki_minus0 /\(^\s*\|.*\s\)\(-0\|\[-0\]\)\(\s*$\|\s.*\)/

endfun "}}}
aug END "}}}
" 3.Commands_And_Abbreviations {{{1
" Commands "{{{2
command! -nargs=1 Print echo <args>
command! -nargs=0 W exec "w sudo:% "
command! -nargs=0 Mkdir call <SID>auto_mkdir(expand('%:p:h'),0)

function! s:delete_this() "{{{
    let f = expand('%:p')
    if input('Delete '.f.' ?(y/N)') =~? '^y\%[es]$'
        if !delete(f)
            echom f."deleted successfully!"
            Explore
        else
            echom f."delete faiure!"
        endif
    endif
endfunction "}}}
command! Delete call <SID>delete_this()
function! s:rename(name) "{{{
    let f = expand('%:p')
    saveas a:name
    if input('Delete '.f.' ?(y/N)') =~? '^y\%[es]$'
        if !delete(f)
            echom f."deleted successfully!"
            Explore
        else
            echom f."delete faiure!"
        endif
    endif
endfunction "}}}
command! -nargs=1 Rename call <SID>rename(<q-args>)
command! CopyFileName let @+ = expand('%:p:t')
command! CopyFilePath let @+ = expand('%:p:h')
command! CopyFileFull let @+ = expand('%:p')
"trim whitespace
command! TrimWhiteSpace %s/\s\+$//
command! TrimCtrlM %s//\r/
function! s:last_update() "{{{
    let rx_str_upd='\%(Change\|Update\|Updated\|Modified\)'
    for i in range(1,30)
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
command! -nargs=0 LastUpdate call <SID>last_update()

command! Gcc !gcc `pkg-config --cflags --libs gtk+-2.0` '%:p' -o %:t:r.o -lm
command! Gco call <SID>gco()
function! s:gco() "{{{
    !gcc `pkg-config --cflags --libs gtk+-2.0`  -c -fpic % -o %:t:r.o
    !gcc -shared -lc  -o %:t:r.so  %:t:r.o
endfunction "}}}
command! -nargs=1 Lbs call <SID>libc_it("str",<f-args>)
command! -nargs=1 Lbi call <SID>libc_it("int",<f-args>)
function! s:libc_it(type,func,para) "{{{
    let file=expand('%:p:r').".so"
    call s:gco()
    if a:type=="str"
        echo libcall(file,a:func,a:para)
    else
        echo libcallnr(file,a:func,a:para)
    endif
endfunction "}}}
command! Gcld !gcc -o %:t:r % -ldl
command! Gpp !g++ `pkg-config --cflags --libs gtk+-2.0` -c -fPIC % -o %:t:r.o
command! Gpso !g++ -shared -Wl,-soname,%:t:r.so -o  %:t:r.so  %:t:r.o
"{{{2 Insert Abbrevation
iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.
iab llorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi.
inorea &<t &lt;
inorea &>t &gt;
inorea &-> &rarr;
inorea &<- &larr;
"{{{2 Digraphs
" v- ǖ    v' ǘ    v< ǚ    v` ǜ
digraphs v- 470 v' 472 v< 474 v` 476
" redefine DOWN-ARROW ↓ to '|v' which was '-v'
digraphs \|v 8595 \|^ 8593

" 4.Key_Mapping_General{{{1
" 4.0.F1-F12 "{{{2
"{{{ F1 Help
noremap <F1> K
nnoremap <S-F1> :Pydoc <C-R>=expand("<cword>")<CR><CR>
set keywordprg=":help"
set helplang=en,cn
cabbrev H helpg
"}}}
"{{{ F2 Replace @/
nnoremap <F2> :%<C-R>=<SID>w(@/,"r")<CR><Left><Left><Left>
vnoremap <F2> :<C-R>=<SID>w(@/,"r")<CR><Left><Left><Left>
nnoremap <S-F2> :%<C-R>=<SID>w(@/,"br")<CR><Left><Left><Left>
vnoremap <S-F2> :<C-R>=<SID>w(@/,"br")<CR><Left><Left><Left>
"}}}
"{{{F3 Ack-grep
" better-than-grep.com
function! Ack(args) "{{{
    let grepprg_bak=&grepprg
    set grepprg=ack\ -H\ --nocolor\ --nogroup
    silent! execute "grep! " . a:args
    botright copen
    let &grepprg=grepprg_bak
    redraw!
endfunction "}}}
command! -nargs=* -complete=file Ack call Ack(<q-args>)
noremap <F3> :Ack <C-R><C-F> %<CR>
vnoremap <F3> y:Ack <C-R>" %<CR>
noremap <S-F3> :Ack <C-R><C-F><CR>
vnoremap <S-F3> y:Ack <C-R>"<CR>
let g:w_qf=0
noremap <C-F3> :if g:w_qf==0\|cw\|let g:w_qf=1\|else\|ccl\|
            \let g:w_qf=0\|endif<CR>
"}}}
"{{{ F4 Folder
nnoremap <F4> :CtrlP<CR>
nnoremap <S-F4> :Explore<CR>
nnoremap <C-F4> :Unite file<cr>
"}}}
"{{{ F5 Execute
nnoremap <silent> <F5> :call <SID>exe("n")<CR>
vnoremap <silent> <F5> :call <SID>exe("v")<CR>
function! s:exe(mode) range "{{{
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
        if syn=="python"
            let L=getline(1)
            if     L=~'python3' | exec bang."python3 -d ".file.err_log
            elsei  L=~'pypy'    | exec bang."pypy -d ".file.err_log
            else                | exec bang."python2 -d ".file.err_log
            endif
        elsei syn=="ruby"       | exec bang."ruby -d ".file.err_log
        elsei syn=="perl"       | exec bang."perl -D ".file.err_log
        elsei syn=='vim'        | exec "so %"
        elsei syn=='bat'      | exec "w !cmd"
        elsei syn=~'^\(sh\|expect\|bash\)$'     | exec "w !sh"
        elsei syn=~'html'       | exec bang.browser.file
        elsei syn=~'^coffee$'   | exec "CoffeeRun"
        else                    | exec bang.runner.file
        endif
    elseif a:mode=="v"
        let txt_lst=getline(a:firstline,a:lastline)
        if syn=="python"    | let l_cmd="py "
        elseif syn=="ruby"  | let l_cmd="ruby "
        elseif syn=='vim'   | let l_cmd=""
        elseif syn=~'^\(sh\|expect\|bash\|bat\)$'   | let l_cmd="!"
        endif
        for line in txt_lst
            exe l_cmd.line
        endfor
    endif
endfunction "}}}
nnoremap <C-F5> :Gcc<CR>
"}}}
noremap <F6> :TagbarToggle<CR>
noremap <F7> :GundoToggle<CR>
"{{{ F8 File Manager / Terminal
noremap <silent><F8> :call <SID>file_man()<CR>
noremap <silent><S-F8> :call <SID>terminal()<CR>
noremap <silent><C-F8> :Ch7<CR>
fun! s:file_man() "{{{
    if expand("%:p:h") != ""
        if has("win32")
            exec "!start explorer '%:p:h'"
        else
            "exec "!gnome-commander -l '%:p:h'"
            exec "!nautilus '%:p:h'"
        endif
    endif
endf "}}}
fun! s:terminal() "{{{
    if has("win32")
        exec "!start cmd '%:p:h'"
        " exec "! @d:\Dev\MSYS\bin\rxvt -tn msys -sl 3000 -fn Fixedsys -fg white -bg black -sr -e d:\Dev\MSYS\bin\bash.exe --login -i"

    else
        " exec "!xterm -hold -e 'cd %:p:h && /bin/bash' &"
        exec "!gnome-terminal --working-directory=%:p:h &"
    endif
endf "}}}
command! Ch7 !chmod 755 '%:p'
command! Ch6 !chmod 644 '%:p'
"}}}
"{{{ F9 ConqueTerm
nnoremap <F9>  :ConqueTerm bash<CR>
let g:ConqueTerm_FastMode=1
let g:ConqueTerm_TERM = 'xterm'
let g:galaxy_statusline_blink=0
let g:ConqueTerm_ExecFileKey = '<leader>cqx'
let g:ConqueTerm_SendFileKey = '<leader>cqf'
let g:ConqueTerm_SendVisKey = '<leader>cqv'
let g:ConqueTerm_PromptRegex = '^\((\w\+)\)\=[\w\+@[0-9A-Za-z_.-]\+ [0-9A-Za-z_./\~,:-]\+\$'
"}}}
nnoremap <F10>  :options<CR>
nnoremap <F11> :call ToggleSketch()<CR>
"{{{ F12 Session
nmap <F12> :Unite session<cr>
nmap <S-F12> :call SaveSession()<CR>
nmap <C-F12> :call SaveSession("name")<CR>
set sessionoptions=blank,curdir,help,tabpages,winpos,winsize,resize
function! SaveSession(...) "{{{
    wall
    let ses_dir = expand('~/.vim/sessions')
    if !isdirectory(ses_dir)
        call mkdir(ses_dir,"p")
    endif
    let time=strftime("%y%m%d_%H%M%S")
    if exists("a:1") && a:1=="name"
        let ses=input("Please Input your session name:")
        if empty(ses)
            echo "Invalid Input name. Stop!"
            return
        endif
        let sesname = time."_".ses
    else
        let sesname = time
    endif

    try
        exe "mksession! "."~/.vim/sessions/".sesname
        echomsg "mks success! session file : ".sesname
    catch /^vim\%((\a\+)\)\=:/
        echoe "mks failure! error: " .v:exception
    endtry

endfunction "}}}
"}}}
" 4.1.Leader_Mapping{{{2
"Mapleader "{{{
let mapleader = " "
let maplocalleader = ","

noremap Q gq

vnoremap . <Nop>
vnoremap , <Nop>
noremap s <Nop>
noremap S <Nop>

nnoremap <leader> <Nop>
vnoremap <leader> <Nop>

nnoremap <m-x> <c-a>
" similar with D
nnoremap Y y$

nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" repeat on every line
vnoremap . :normal .<CR>
"}}}
" Toggle Diff Mode "{{{
set diffopt=filler,vertical,foldcolumn:1
map <silent> <leader>dd :call <SID>toggle_diff()<CR>
map <silent> <leader>DD :call <SID>diffthis()<CR>
nmap <leader>da :1,$+1diffget<cr>
nmap <leader>dc :1,.diffget<cr>
nmap <leader>d$ :.,$+1diffget<cr>
map <silent> <leader>do :call <SID>diffOrigin()<CR>
fun! s:toggle_diff() "{{{
    if &diff
        diffoff
        set foldmethod=marker
        set foldcolumn=1
        echo "diffmode Off"
    else
        diffthis
        echohl WarningMsg | echo "diffmode On" | echohl None
    endif
endfun "}}}
function! s:diffthis() "{{{
    let filename=expand('%')
    let diffname = filename.'.fileBuffer'
    vsplit
    exec 'saveas! '.diffname
    diffthis
    exec 'edit '.filename
    diffthis
endfunction "}}}
function! s:diffOrigin(...) "{{{
    if exists("a:1")
        exec "sp ".a:1
    endif
    let syn=&syntax
    call s:span_vert_win()
    call s:split()
    if !exists("a:2")
        enew | setl bt=nofile  | r # | 0d_
        exec "set syn=".syn
        setl ro
    else
        exec "e ".a:2
    endif
    diffthis | wincmd p | diffthis
endfunction "}}}
"}}}
"Toggle Folding And Foldmethod  "{{{
" I want foldmarkers to be applied with space before a comment.
function! s:set_fold_markers(lnum_st, lnum_end) "{{{
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
nno <silent> zf :set opfunc=MyFoldMarker<CR>g@
vno <silent> zf :<C-U>call MyFoldMarker(visualmode(), 1)<CR>zv
nma <silent> <Leader>zz zf
vma <silent> <Leader>zz zf
nno <silent> <leader><leader> @=(foldclosed('.')>0?'zv':'zc')<CR>
vno <silent> <leader><leader> <ESC>@=(foldclosed('.')>0?'zv':'zc')<CR>gv
nno <silent> zz @=(&foldlevel?'zM':'zR')<CR>
nno <silent> zM @=(&foldlevel?'zM':'zR')<CR>
nno <silent> zR @=(&foldlevel?'zM':'zR')<CR>

nor <leader>fm :setl fdm=<C-R>= &fdm=='marker' ? 'indent'
            \ : &fdm=='indent' ? 'syntax'
            \ : &fdm=='syntax' ? 'expr'
            \ : 'marker'<CR>
            \<BAR> echo "setl fdm=".&fdm <CR>
"}}}
"Misc Option Toggle "{{{
set listchars=tab:┆\ ,trail:┄,extends:>,precedes:<
nor <Leader>li :setl list! list?<CR>

nor <leader>nn :setl <c-r>=&nu?'rnu':&rnu?'nornu':'nu'<CR><CR>

set wrap
set linebreak
let &showbreak='> '         " wrap text break string
set display=lastline        " show wraping text even it's not complete show
" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
nor <leader>wr :setl wrap! wrap?<CR>

set spelllang=en
set nospell
nor <leader>sp :setl spell!<CR>:echo "Spell:"
            \.<c-r>=&spell? "'ON'" : "'OFF'" <CR><CR>

set guioptions=gt
set guioptions-=mT
nor <m-1> :set <C-R>=&go=~#'m' ? 'go-=m' : 'go+=m'<CR><CR>
nor <m-2> :set <C-R>=&go=~#'r' ? 'go-=Rr' : 'go+=Rr'<CR><CR>
nor <m-3> :set <C-R>=&go=~#'T' ? 'go-=T' : 'go+=T'<CR><CR>
"}}}
"Syntax Quick Set "{{{
nmap <leader>11 :filetype detect \| syntax enable <CR>
nmap <leader>1m  :emenu Syntax.
"}}}
"Edit dotfiles "{{{
map <silent><leader>vv :Split \| e ~/.vimrc<CR>
map <silent><leader>vz :Split\| e ~/.zshrc<CR>
map <leader>vr :so ~/.vimrc<CR>
map <silent><leader>vdv :call <SID>diffOrigin("~/.vimrc","~/Documents/dotfiles/.vimrc")<cr>
map <leader>vi :e ~/.vim/ <CR>
if has("unix") "{{{ linux dotfiles
    map <silent><leader>vb :Split\|e ~/.bashrc<CR>
    map <silent><leader>vt :Split\|e ~/.tmux.conf<CR>
    map <silent><leader>vp :Split\|e ~/.pentadactylrc<CR>
    map <silent><leader>vc :Split\|e ~/.conkyrc<CR>
    map <silent><leader>vsp :Split\|e ~/Documents/vimwiki/Ref/ShuangPin.vwk<CR>
    map <silent><leader>vdw :call <SID>diffOrigin("~/.vimrc","/media/sda5/Documents/Variables/.vimrc")<cr>
    map <silent><leader>vwv :Split\|e /media/sda5/Documents/Variables/.vimrc<CR>
else
    map <silent><leader>vsp :Split\|e d:/Documents/vimwiki/Ref/ShuangPin.vwk<CR>
    map <silent><leader>vp :Split\| e ~/.pentadactylrc<CR>
endif "}}}
"}}}
" 4.2.switch_window_and_buffer"{{{2
set winheight=15 winwidth=35        " current window minimum col/line
set winminwidth=0 winminheight=0
nmap <C-W>1 :call <SID>max_resize_win()<CR>
nmap <C-W>2 :call <SID>span_vert_win()<CR><C-W>=
nmap <C-W>3 :call <SID>fold_vert_win()<CR>
nmap <C-W>4 :call <SID>place_vim()<CR>

nmap <c-w>- :resize -10<CR>
nmap <c-w>+ :resize +10<CR>

for c in ['p','h','j','k','l','w']
    exec 'nno <C-W>'.c.' <C-W>'.c.':call <SID>max_resize_win()<CR>'
endfor
nno <C-W>n <C-W>w:call<SID>max_resize_win()<CR>

nno <C-W><c-r> <c-^>

nma <silent> <C-W><c-q>    :close<CR>
nma <silent> <C-W>q        :close<CR>

nno <silent> <C-W><C-V> :Split<cr>gf
nno <silent> <C-W><C-S> :sp<CR>gf
nno <silent> <C-W><C-T> :tab sp<CR>gf
nno <silent> <C-W><C-F> :sp\|e <cfile><CR>

map <C-Up>      :tabclose<CR>
map <C-Down>    :tabnew<CR>
map <C-Right>   :tabnext<CR>
map <C-Left>    :tabprev<CR>
map <S-Up>      :close<CR>
map <S-Down>    :new<CR>
map <S-Right>   :bn<CR>
map <S-Left>    :bp<CR>

function! s:is_win_vert() "{{{
    return winwidth(0) < &columns
endfunction "}}}
function! s:is_vim_span() "{{{
    return &columns == s:win_col_span2
endfunction "}}}
function! s:max_resize_win() "{{{
    resize
    if !s:is_vim_span() && s:is_win_vert()
        vertical resize
    endif
endfunction "}}}
function! s:span_vert_win() "{{{
    if s:is_win_vert()
        if !s:is_vim_span()
            let &columns = s:win_col_span2
        endif
    else
        let &columns = s:win_col
    endif
endfun "}}}
function! s:fold_vert_win() "{{{
    let &columns = s:win_col
endfun "}}}
function! s:place_vim() "{{{
    if s:win_pos<=100
        let s:win_pos = 550
    elseif s:win_pos <= 600
        let s:win_pos = 1050
    else
        let s:win_pos = 10
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
" 4.3.HJKL_mapping  "{{{2
nno H h
nno J j
nno K k
nno L l

nno j gj
nno k gk
" visual mode but no select mode.
xno j gj
xno k gk

nno <silent> <c-h> K
nno <silent> <c-l> :let @/=''\|redraw!<CR>

" digraph input
ino <c-f> <c-K>
cno <c-f> <c-K>

nno <c-CR> kJ
ino <c-CR> <esc>kJi
vno <C-CR> gq
nno <m-cr> o
ino <m-CR> <esc>o
nor <S-CR> o<ESC>
ino <s-CR> <esc>O

" last insert position ; last change position '. `.
nno `, `^
nno ', '^

map <scrollwheelup> 3k
map <scrollwheeldown> 3j
map <s-scrollwheelup> 30k
map <s-scrollwheeldown> 30j
nno <c-scrollwheeldown> >>
nno <c-scrollwheelup> <<
vno <c-scrollwheeldown> >gv
vno <c-scrollwheelup> <gv
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
 "}}}
" 4.4.Edit_and_formatting "{{{2
" Easy Editing Modify "{{{
"change case <m-c>
nmap gUu :s/\v<(.)(\w*)/\u\1\L\2/g\|nohl<CR>
" capitalize word
nmap gcw guiw~w

"}}}
"Quick Wrapping "{{{
"VimwikiWord
nnoremap <Leader>eW BvEc[[<C-r>"]]<ESC>`[
nnoremap <Leader>ew bvec[[<C-r>"]]<ESC>`[
" php
nnoremap <leader>ep ciw<?php <C-r>" ?><ESC>
vnoremap <Leader>ep c<?php <C-r>" ?><ESC>`[
"" html comment
nnoremap <leader>e! ciw<!-- <C-r>" --><ESC>
vnoremap <Leader>e! c<!-- <C-r>" --><ESC>`[

"}}}
" todo text "{{{
nnoremap <leader>et :call <SID>add_text(" TODO:")<CR>
nnoremap <leader>ef :call <SID>add_text("FIXME:")<CR>
nnoremap <leader>ex :call <SID>add_text("  XXX:")<CR>
function! s:is_whiteline() "{{{
    return getline('.')=~'^\s*$'
endfunction "}}}
function! s:add_text(text) "{{{
    if &syn=="vimwiki"
        let cmnt = a:text
    else
        let cmnt = substitute(&commentstring, '%s', ' '.a:text, "")
    endif
    if s:is_whiteline()
        exec 'normal I' . cmnt
    else
        let fo_bak=&fo
        set fo=2
        exec 'normal o' . cmnt
        let &fo=fo_bak
    endif
endfunction "}}}
nnoremap <leader>ee :call <SID>toggle_with_T()<CR>
let s:rx_toggle = {
            \ 'todo' :['TODO',   'DONE'],
            \ 'fix'  :['FIXME',  'FIXED'],
            \ 'xxx'  :['XXX',    'WORKRND'],
            \ 'note' :['NOTE',   'WARNING', 'CAUTION'],
            \}
let s:rx_timestamp = '\(\d\{6}\|\d\{4}-\d\{2}-\d\{2}\)'
let s:fm_timestamp = "%Y-%m-%d"
function! s:toggle_with_T() "{{{
    let line = getline('.')
    for [rx,rx_list] in items(s:rx_toggle)
        for i in range(len(rx_list))
            if line =~# rx_list[i].':\='
                let time = strftime(s:fm_timestamp)
                if i == len(rx_list)-1
                    let r = 0
                    " remove all timestamp as became list[0]
                    if line =~# rx_list[i].':\='.' '.s:rx_timestamp
                        let line = substitute(line,' '.s:rx_timestamp,'','')
                    endif
                elseif i == len(rx_list)-2
                    let r = i+1
                    " add timestamp as became list[-1]
                    if line =~# rx_list[i].':\='.' '.s:rx_timestamp
                        let line = substitute(line,s:rx_timestamp, time,'')
                    else
                        let line = substitute(line,'\C'.rx_list[i].':\=', '& '.time,'')
                    endif
                else
                    let r = i+1
                endif
                let line = substitute(line,'\C'.rx_list[i],rx_list[r],'')
                break
                break
            endif
        endfor
    endfor
    if line !=# getline('.')
        call setline('.',line)
    endif
endfunction "}}}
"}}}
" line format  "{{{
"alignment of text
nmap <leader>el :left<CR>
nmap <leader>er :right<CR>
nmap <leader>ec :center<CR>

"make vimwiki list
nm <leader>e1 :call g:sub_list('*')<cr>
nm <leader>e2 :call g:sub_list('#')<cr>
nm <leader>e3 :call g:sub_list('-')<cr>
nm <leader>e4 :call g:sub_list('1.')<cr>
function! g:sub_list(sym)
    let line=getline('.')
    let m=substitute(line,'^\(\s*\)\%([*#-]\s\|\%(\d\.\)\+\s\)\=\ze.*','\1'.a:sym.' ','')
    call setline(line('.'),m)
endfunction

nnoremap <leader>e=2 yyPVr=jyypVr=
nnoremap <leader>e*2 yyPVr*jyypVr*
nnoremap <leader>e=1 yypVr=
nnoremap <leader>e- yypVr-
nnoremap <leader>e^ yypVr^
nnoremap <leader>e" yypVr"
"}}}
"close pairs [] {} ()"{{{
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
" 4.5.win_style_behave_settings (yank and pasting) "{{{2
nor <C-S>		:update<CR>
vno <C-S>		<C-C>:update<CR>
ino <C-S>		<C-O>:update<CR>

"open fold while undo /redo
nor <C-Z>       uzv
ino <C-Z>       <C-O>u<C-O>zv
"no action in visual mode
vno <C-Z>       <esc>

nor <C-Y>       <C-R>zv
ino <C-Y>       <C-O>U<C-O>zv
vno <C-Y>       <esc>

" Not "+gP
nor <C-V>	    "+gp=`]
nor <S-Insert>	"+gp=`]
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
cma <C-V>       <C-R>+
cma <S-Insert>  <C-R>+

" CTRL-X and SHIFT-Del are Cut
vno <c-D>       "+x
vno <C-X>       "+x
vno <S-Del>     "+x

" CTRL-C and CTRL-Insert are Copy
vno <C-C>       "+y

" backspace in Visual mode deletes selection
vno <BS>        d

" Use CTRL-Q to do what CTRL-V used to do
nor <C-Q>       <C-V>
" 4.6.Searching "{{{2
set hlsearch incsearch
set ignorecase smartcase
set nowrapscan
function! s:p(p,mode) "{{{
    if a:mode =~ "s"
        let re_txt =  '/[]~.*$\'
    elseif a:mode =~ "r"
        let re_txt =  '/&~\'
    endif
    return escape(a:p,re_txt)
endfunction "}}}
function! s:r(mode) "{{{
    if a:mode=~#"w"
        let w = expand('<cword>')
    elseif a:mode=~#"W"
        let w = expand('<cWORD>')
    elseif a:mode=~#"v"
        normal gv"yy
        let w = @y
    elseif a:mode=~#"/"
        let w = @/
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
    if a:mode =~"r"
        return 's/'.ss."/".s:p(rs,"r")."/gc"
    elseif a:mode =~"s"
        return "/".ss
    elseif a:mode =~"g"
        return "silent grep! ".rs." %"
    endif
endfunction "}}}
function! s:wrap_scan_warn(e) "{{{
    " show an warning message when hit end of file.
    try
        if (a:e=='f' && v:searchforward == 1)
                    \ || (a:e=='b' && v:searchforward == 0)
            //
        else
            ??
        endif
    catch /^Vim\%((\a\+)\)\=:E38[45]/
        echohl Modemsg
        echo '[Search]'
        echohl Warningmsg
        if v:searchforward ==1
            echon 'Hit the END-Of-File.press n/N to go on'
        else
            echon 'Hit the TOP-Of-File.press n/N to go on'
        endif
        let c = nr2char(getchar())
        echohl Modemsg
        echon " ".c." "
        echohl Moremsg
        if c==?"n" && v:searchforward == 1
            call search(@/,'w')
            echon 'Wrap scan to TOP'
        elseif c==?"n" && v:searchforward == 0
            call search(@/,'wb')
            echon 'Wrap scan to END'
        else
            echohl Errormsg
            echon 'Stoped scan'
        endif
        echohl Normal
    endtry
endfunction "}}}
"{{{ search mapping
nnoremap # g*
nnoremap * g#
nnoremap g# *
nnoremap g* #
vnoremap / <ESC>/<C-\>e<SID>p(<SID>r("v"),"s")<CR>
vnoremap ? <ESC>?<C-\>e<SID>p(<SID>r("v"),"s")<CR>
vnoremap # <ESC>/<C-\>e<SID>p(<SID>r("v"),"s")<CR>/<CR><C-G>
vnoremap * <ESC>?<C-\>e<SID>p(<SID>r("v"),"s")<CR>/<CR><C-G>
vnoremap n <ESC>/<C-\>e<SID>p(<SID>r("v"),"s")<CR>/<CR><C-G>
vnoremap N <ESC>?<C-\>e<SID>p(<SID>r("v"),"s")<CR>/<CR><C-G>
nnoremap <silent> n :call <SID>wrap_scan_warn('f')<CR>
nnoremap <silent> N :call <SID>wrap_scan_warn('b')<CR>
"}}}
        if s:win_pos<=100
            let s:win_pos = 550
        elseif s:win_pos <= 600
            let s:win_pos = 1050
        else
            let s:win_pos = 10
        endif
"5.Plugins_settings{{{1
"Unite "{{{2
let g:unite_winheight=10

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''

let g:unite_source_file_mru_time_format="(%m-%d %H:%M)"
let g:unite_source_directory_mru_time_format="(%m-%d %H:%M)"
let g:unite_enable_split_vertically=0
let g:unite_source_session_path= $HOME . "/.vim/sessions"

aug vimrc_Unite "{{{
    au! vimrc_Unite
    au FileType unite call s:unite_my_settings()
aug END

function! s:unite_my_settings()
    nmap <buffer> <ESC>                         <Plug>(unite_exit)
    nmap <buffer><expr><silent> <2-leftmouse>   unite#smart_map('l', unite#do_action(unite#get_current_unite().context.default_action))
    nmap <buffer><expr><silent> <c-e>           unite#smart_map('l', unite#do_action(unite#get_current_unite().context.default_action))
    nmap <buffer> <CR>                          <Plug>(unite_do_default_action)
endfunction "}}}

"Neocomplcache "{{{2
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1

let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_ignore_case = 0
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

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

let g:neocomplcache_quick_match_patterns={'default':'`'}
inoremap <expr><space> pumvisible() ? "\<c-n>\<c-p>\<space>" : "\<space>"
let g:neocomplcache_quick_match_table = {
            \'1' : 0, '2' : 1, '3' : 2, '4' : 3, '5' : 4, '6' : 5, '7' : 6, '8' : 7, '9' : 8, '0' : 9,
            \}
" Plugin key-mappings.
imap <expr><C-k>  pumvisible() ? neocomplcache#smart_close_popup() :
            \ "\<Plug>(neocomplcache_snippets_expand)"
smap <expr><C-k>  pumvisible() ? neocomplcache#smart_close_popup() :
            \ "\<Plug>(neocomplcache_snippets_expand)"
imap <expr><c-j>  pumvisible() ? neocomplcache#smart_close_popup() :
            \ "\<Plug>(neocomplcache_snippets_jump)"
smap <expr><c-j>  pumvisible() ? neocomplcache#smart_close_popup() :
            \ "\<Plug>(neocomplcache_snippets_jump)"

nmap <c-j> a<c-j><esc>
nmap <c-k> a<c-k><esc>

inoremap <expr><C-g>u neocomplcache#undo_completion()

inoremap <expr><CR> pumvisible() ?
            \ neocomplcache#smart_close_popup() : "\<CR>"

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<s-TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<left>"
inoremap <expr><C-l> neocomplcache#smart_close_popup()."\<right>"
inoremap <expr><BS> pumvisible() ? neocomplcache#smart_close_popup()."\<C-h>" : "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
"{{{
aug omni_compl "{{{
    au! omni_compl
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
let g:neocomplcache_disable_caching_file_path_pattern="fuf"

let g:neocomplcache_snippets_dir="~/.vim/my_snips/snippets_complete/"
map <leader>se :sp\|NeoComplCacheEditSnippets<cr>
map <leader>s- :sp\|e ~/.vim/my_snips/snippets_complete/_.snip <cr>
map <leader>s_ :sp\|e ~/.vim/my_snips/snippets_complete/_.snip <cr>

"Vimwiki "{{{2
map <Leader>ww <Plug>VimwikiIndex

let wiki_1 = {}
if &term=='cygwin'
    let wiki_1.path = '/d/Dropbox/vimwiki'
    let wiki_1.path_html = '/d/Documents/vimwiki_html'
else
    let wiki_1.path = '~/Dropbox/Vimwiki'
    let wiki_1.path_html = '~/Documents/vimwiki_html'
endif
let wiki_1.maxhi=0
let wiki_1.ext = '.vwk'
let wiki_1.nested_syntaxes = { 'python': 'python',
            \'cpp': 'cpp', 'c': 'c',
            \'vim': 'vim', 'sh':'sh',
            \'html':'html',
            \}

let g:vimwiki_list = [wiki_1]
let g:vimwiki_menu = ""
let g:vimwiki_browsers=['firefox']
let g:vimwiki_html_header_numbering = 2

let g:vimwiki_file_exts='pdf,txt,doc,rtf,xls,zip,rar,7z,gz
            \,py,sh,rb,pl,lua,go
            \,c,cpp,h,conf
            \,js,css,html,php,coffee
            \,j,java,xml
            \,vim,vba,vwk'

let g:vimwiki_conceallevel=2
let g:vimwiki_lower="a-z0-9\u0430-\u044f"
let g:vimwiki_url_mingain=99
let g:vimwiki_use_mouse =1
let g:vimwiki_folding=1
let g:vimwiki_fold_lists=0
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_rxListBullet = '^\s*\%(\*\|-\|#\)\s'
let rx_prio='\%([+-]\d\|\[[+-]\d\]\)'
let rx_num_seq='\%(\d\+[\.)]\)\+'
let g:vimwiki_rxListNumber = '^\s*\%('.rx_prio.'\|'.rx_num_seq.'\)\s'
execute 'syntax match VimwikiList /'.g:vimwiki_rxListBullet.'/'
execute 'syntax match VimwikiList /'.g:vimwiki_rxListNumber.'/'

fun! s:vimwiki_my_settings() "{{{

    if g:vimwiki_hl_cb_checked
        execute 'syntax match VimwikiCheckBoxDone /'.
                    \ g:vimwiki_rxListBullet.'\s*\['.g:vimwiki_listsyms[4].'\].*$/'.
                    \ ' contains=VimwikiNoExistsLink,VimwikiLink'
        execute 'syntax match VimwikiCheckBoxDone /'.
                    \ g:vimwiki_rxListNumber.'\s*\['.g:vimwiki_listsyms[4].'\].*$/'.
                    \ ' contains=VimwikiNoExistsLink,VimwikiLink'
    endif

    map <buffer><leader>ee <Plug>VimwikiToggleListItem
    map <buffer><leader>wg <Plug>VimwikiGenerateLinks
    map <buffer><Leader>wr <Plug>VimwikiRenameLink
    map <buffer><Leader>wd <Plug>VimwikiDeleteLink


    map <buffer><Leader>w2h :Vimwiki2HTML<CR>

    map <buffer><c-s-Up> :VimwikiDiaryPrevDay<CR>
    map <buffer><c-s-Down> :VimwikiDiaryNextDay<CR>
    map <buffer><c-up> :tabclose<CR>
    map <buffer><c-down> :tabnew<CR>

    map <buffer><expr> <rightmouse><leftmouse> "<Plug>VimwikiGoBackLink"
    ima <buffer><expr> <rightmouse><leftmouse> "<Plug>VimwikiGoBackLink"
    map <buffer><expr> <m-Home> "<Plug>VimwikiGoBackLink"
    ima <buffer><expr> <m-Home> "<Plug>VimwikiGoBackLink"
    ino <buffer><expr> <m-End> "\<c-o><c-i>"
    nor <buffer><expr> <m-End> "\<c-i>"
    nma <silent><buffer> <TAB> <Plug>VimwikiNextLink

    ino <buffer><expr><TAB> pumvisible() ? "\<c-n>" :
                \ vimwiki#tbl#kbd_tab()
    ino <buffer><expr><s-TAB> pumvisible() ? "\<c-p>" :
                \ vimwiki#tbl#kbd_shift_tab()

    setl shiftwidth=4 softtabstop=4
    setl cms=%%%%\ %s
    setl foldmethod=expr
    setl foldexpr=VimwikiFoldLevel(v:lnum)
endfun "}}}

aug vimwiki_myset "{{{
    au! vimwiki_myset
    autocmd FileType vimwiki call s:vimwiki_my_settings()
aug END

"normal buffer mapping
inoremap <expr> <rightmouse><leftmouse> "\<c-o><c-i>"
noremap <expr> <rightmouse><leftmouse> "\<c-o>"
inoremap <expr> <m-Home> "\<c-o><c-o>"
noremap <expr> <m-Home> "\<c-o>"
inoremap <expr> <m-End> "\<c-o><c-i>"
noremap <expr> <m-End> "\<c-i>"
"}}}

"Git "{{{2
function! s:git_add() "{{{
    call s:last_update()
    update!
    redraw
    try
        exec "Git add %"
    catch /^Vim\%((\a\+)\)\=:E492/
        echohl WarningMsg
        echo "[Warning]Not a git repo..."
        echohl Normal
    endtry
endfunction "}}}
nmap  <leader>ga :call <SID>git_add()<cr>
nmap  <leader>gc :Gcommit<cr>
nmap  <leader>gp :Git push<cr>
nmap  <leader>gd :Gsdiff<CR>
nmap  <leader>gb :Git branch -r<CR>
nmap  <leader>gk :Git checkout
nmap  <leader>gr :Git branch
"Django "{{{2
aug setDjango
    au!
    au Filetype python call s:setDjango()
    au Syntax djangoHtml call s:setDjangoHtml()
    autocmd BufEnter *.py call SetAppDir()
aug END
fun! s:setDjangoHtml()
    let g:surround_{char2nr("b")} = "{% block\1 \r..*\r &\1%}\r{% endblock %}"
    let g:surround_{char2nr("i")} = "{% if\1 \r..*\r &\1%}\r{% endif %}"
    let g:surround_{char2nr("w")} = "{% with\1 \r..*\r &\1%}\r{% endwith %}"
    let g:surround_{char2nr("c")} = "{% comment\1 \r..*\r &\1%}\r{% endcomment %}"
    let g:surround_{char2nr("f")} = "{% for\1 \r..*\r &\1%}\r{% endfor %}"
    let g:surround_{char2nr("v")} = "{{ \1 \r..*\r &\1\r }}"
endfun
fun! s:setDjango()
    let g:last_relative_dir = ''
    nnoremap \1 :call RelatedFile ("models.py")<cr>
    nnoremap \2 :call RelatedFile ("views.py")<cr>
    nnoremap \3 :call RelatedFile ("urls.py")<cr>
    nnoremap \4 :call RelatedFile ("admin.py")<cr>
    nnoremap \5 :call RelatedFile ("tests.py")<cr>
    nnoremap \6 :call RelatedFile ( "templates/" )<cr>
    nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
    nnoremap \8 :call RelatedFile ( "management/" )<cr>
    nnoremap \0 :e settings.py<cr>
    nnoremap \9 :e urls.py<cr>
endfun

fun! RelatedFile(file)
    #This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun! SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
nmap <leader>js :!python2 manage.py syncdb<cr>
"Misc Plugins Settings "{{{2
let g:vimsyn_noerror = 1

nno <leader>uu :GundoToggle<CR>

nor <leader>cc :TComment<cr>
nor \\ :TComment<cr>

nma <leader>cA :ColorVsuball<CR>

