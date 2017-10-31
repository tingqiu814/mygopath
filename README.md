# mygopath
安装：
```
# tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
# export GOROOT=/usr/local/go
# export PATH=$PATH:$GOROOT/bin
# mkdir /home/dev/project/gopath && cd /home/dev/project/gopath && mkdir src pkg bin
# export GOPATH=/home/dev/project/gopath
```

go-vim install 
.vimrc
```
Plugin 'fatih/vim-go’

" Some Linux distributions set filetype in /etc/vimrc.  
" Clear filetype flags before changing runtimepath to force Vim to reload them.  
if exists("g:did_load_filetypes")  
  filetype off  
  filetype plugin indent off  
endif  
set runtimepath+=$GOROOT/misc/vim " replace $GOROOT with the output of: go env GOROOT  
filetype plugin indent on  
syntax on  
```

Vim Tag list for Go
这个插件列出go文件中得变量、类型、函数等，并支持跳转。
需要安装tagbar插件，本身这个插件依赖于Exuberant ctags，但是它不支持go，需要通过gotags。


安装tagbar
ubuntu :
sudo apt-get install exuberant-ctags
```
"文件侦查启动,用以检测文件的后缀
filetyp on
"安装tagbar插件
Bundle 'majutsushi/tagbar'
"设置tagbar使用的ctags的插件,必须要设置对
let g:tagbar_ctags_bin='/usr/bin/ctags'
"设置tagbar的窗口宽度
let g:tagbar_width=30
"设置tagbar的窗口显示的位置,为左边
let g:tagbar_left=1
"打开文件自动 打开tagbar
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"映射tagbar的快捷键
map <F8> :TagbarToggle<CR>
```
 安装gotags


代码提示
go get -u github.com/nsf/gocode
然后cd到gocode/vim下，执行./update.sh，实际就是把vim插件拷贝到~/.vim/下。

