" Last modified: 2017年10 31
" vundle管理插件
set nocompatible " be iMproved filetype off " required!

set rtp+=~/.vim/bundle/vundle/
" set rtp+=~/.vim/bundle/nerdtree/
call vundle#rc()
" let Vundle manage Vundle required!
Bundle 'gmarik/vundle'
" My Bundles here:/* 插件配置格式 */
" 
" original repos on github
" (Github网站上非vim-scripts仓库的插件，按下面格式填写) Bundle
" 'tpope/vim-fugitive'
" Bundle 'scrooloose/nerdtree'
" vim-scripts repos (vim-scripts仓库里的，按下面格式填写)
" Bundle 'phpmanual'
Bundle 'The-NERD-tree'
Bundle 'snipMate'
" Bundle 'easymosion'
Bundle 'fatih/vim-go'
" Bundle 'nerdtree-ack' non github repos （非上面两种情况的，按下面格式填写）
" Bundle 'git://git.wincent.com/command-t.git'
filetype plugin indent on " required! /* vimrc文件配置结束 */
let mapleader='-'
nmap <Leader>' ^i" <Esc>
nmap <Leader>/ ^i// <Esc>
imap <Leader>/ <Esc>0i// <Esc>
nmap <Leader>s :w<CR> 
nmap <Leader>q :q<CR> 
nmap <Leader>ee :e $MYVIMRC<CR>
nmap <Leader>d yyp
imap <Leader>d <esc>yypA
nmap <Leader>x dd
imap <Leader>x <esc>dd
nmap <Leader>h <c-w>h
nmap <Leader>j <c-w>j
nmap <Leader>k <c-w>k
nmap <Leader>l <c-w>l

" 无编辑文件时打开nerdtree
autocmd vimenter * if !argc(  )   | NERDTree | endif
let NERDTreeIgnore=['CVS']
let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
noremap <silent> <Leader>n :NERDTreeToggle<CR>
" These prevent accidentally loading files while in the
" NERDTree panel
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>


set shiftwidth=4 softtabstop=4 expandtab "设置tab4个空格
set ts=4
set ff=unix
set nu
" set expandtab
set history=200

set background=dark
"set cursorline              " 突出显示当前行
"set ruler                   " 打开状态栏标尺
"set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set noerrorbells            " 关闭错误信息响铃
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2             " 短暂跳转到匹配括号的时间
"set autoindent    
set is                      " 设置搜索预览
set hls    "高亮搜索内容
set hid     "设置不用保存当前文件也能打开新文件a
"开启自带插件
set nocompatible      
filetype plugin on

syntax on  " 自动语法高亮
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'     "将:edit %%转换成%:h
"将方向键禁用
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>
"nnoremap <C-Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
nnoremap <F5> :!ctags -R<CR>
map <F10> :NERDTreeToggle<CR>
" source /usr/share/vim/vim73/autoload/php-doc.vim
inoremap <C-P> <ESC>:ccall PhpDocSingle()<CR>i
nnoremap <C-p> :call PhpDocSingle()<CR>
vnoremap <C-p> :call PhpDocSingle()<CR>
let g:neocomplcache_enable_at_startup = 1
""""""""""""""""
" Tag list(ctags)
""""""""""""""""
"if MySys() == "windows"
"    let Tlist_Ctags_cmd='ctags'
"elseif MySys() == "linux"
    let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"endif

let Tlist_Show_One_File=1  "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1  "在右侧窗口中显示taglist窗口

autocmd! bufwritepost .vimrc source %
function! CheckSyntax()
    if &filetype!="php"
        echohl WarningMsg | echo "Fail to check syntax! Please select the
        right file!" | echohl None
        return
    endif
    if &filetype=="php"
        " Check php syntax
        setlocal makeprg=\"php\"\ -l\ -n\ -d\ html_errors=off
        " Set shellpipe
        setlocal shellpipe=>
        " Use error format for parsing PHP error output
        setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    endif
    execute "silent make %"
    set makeprg=make
    execute "normal :"
    execute "copen"
endfunction
map <F6> :call CheckSyntax()<CR>
map j gj
map k gk
" set fdm=indent
set hidden
" color molokai
set laststatus=2
set statusline=%f[Line:%l/%L,Column:%c][%p%%]
" set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)  

" inoremap jj <ESC>
command! JsonFormat :execute '%!python -m json.tool'

" autocmd BufWritePre,FileWritePre .vimrc   ks|call LastMod()|'s
" fun LastMod()
"     if line("$")>20
"         let l=20
"     else
"         let l=line("$")
"     endif
"     exe "1," . l . "g/Last modified: /s/Last modified: .*/Last modified: ".strftime("%Y年%b %d") 
" endfun
inoremap ,` <esc>:s/alert/console.log/g<cr>ji

" Some Linux distributions set filetype in /etc/vimrc.  
" Clear filetype flags before changing runtimepath to force Vim to reload them.  
if exists("g:did_load_filetypes")  
  filetype off  
  filetype plugin indent off  
endif  
set runtimepath+=$GOROOT/misc/vim " replace $GOROOT with the output of: go env GOROOT  
filetype plugin indent on
syntax on  " 自动语法高亮
Bundle 'majutsushi/tagbar'
Bundle 'vim-syntastic/syntastic'
set backspace=indent,eol,start
