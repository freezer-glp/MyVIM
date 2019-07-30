augroup filetype
 autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end

set nu " 显示行数
syntax enable
syntax on " 语法高亮
set ruler " 设置标尺
set noeb " 设置关闭提示音
set vb t_vb= " 设置关闭闪屏
set ic " 设置忽略大小写查找
set t_Co=256 " 设置256色支持airline
set ttyfast " 加快光标上下移动速度
hi Search term=reverse ctermfg=0 ctermbg=40 guibg=Grey40 " 设置查找反色为绿色
filetype indent on " 自适应缩进
set ts=2  " 设置tab为4个空格
set shiftwidth=2
set softtabstop=2
set expandtab " 设置替换所有tab
set cursorline " 突出显示当前行
set cc=90 " 第90列高亮
" set cursorcolumn " 突出显示当前列
set hlsearch " 高亮查找结果
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
" set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
set guifont=YaHei\ Consolas\ Hybrid\ 15 " 设置字体
set nocompatible " 去掉vi一致性
set backspace=indent,eol,start " 设置退格键可以合并两行
let mapleader=";" " 设置<leader>为;
let g:NERDSpaceDelims=1 " 设置自动注释带空格
" let g:Powerline_colorscheme='solarized256'
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" 按键映射
" <Esc>代表Escape键:<CR>代表Enter键；<D>代表Command键。
" Alt键可以使用<M-key>或<A-key>来表示。<C>代表Ctrl.
" 对于组合键，可以用<C-Esc>代表Ctrl-Esc；使用<S-F1>表示Shift-F1.
" 一键编辑vimrc
" f10一键编辑vimrc
map <F10> :vsp $HOME/.vimrc<CR>
" fd = find 用来ctags 查找
map <Leader>fd g]
" ;ww来保存，;wq来保存退出
map <Leader>ww :w<CR>
map <Leader>wq :wq<CR>
map <Leader>qq :q<CR>
map <Leader>qa :qa<CR>
" 关闭buffer
map <Leader>bd :bd<CR>
" 0号剪贴板
map <Leader>pp "0p

"###################    set file head start  #########################
""autocmd创建新文件自动调用setfilehead()函数
autocmd BufNewFile *.cpp,*.c,*.cc,*.h exec ":call Setfilehead()"
func Setfilehead()
    call append(0, '/*')
    call append(1, ' * Copyright (c) '.strftime("%Y").'  Inc.')
    call append(2, ' * All rights reserved.' )
    call append(3, ' *')
    call append(4, ' * Author: <>')
    call append(5, ' * Date: '.strftime("%Y-%m-%d"))
    call append(6, ' * Brief: ')
    call append(7, ' */')
    call append(8, '')
    exec "normal 7gg"
    "exec "normal A"
endfunc
"    "映射F2快捷键，生成后跳转至第7行，然后使用o进入vim的插入模式
    "map <F12> :call Setfilehead()<CR>:7<CR>o
    map <F12> :call Setfilehead()<CR>A
"###################    set file head end ##########################
"
"doxydentookit 用于自动生成函数注释
let g:DoxygenToolkit_briefTag_funcName = "no"
" for C++ style, change the '@' to '\'
" let g:DoxygenToolkit_commentType = "C++"
" let s:licenseTag = "Copyright (c)017 Alibaba Inc. "
" let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_templateParamTag_pre = "@tparam "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag = "@return "
let g:DoxygenToolkit_throwTag_pre = "@throw " " @exception is also valid
let g:DoxygenToolkit_fileTag = "file "
let g:DoxygenToolkit_dateTag = "date "
let g:DoxygenToolkit_authorTag = "author "
" let g:DoxygenToolkit_versionTag = "version "
let g:DoxygenToolkit_blockTag = "name "
let g:DoxygenToolkit_classTag = "class "
let g:DoxygenToolkit_authorName = "linpu<lingpu.glp@alibaba-inc.com>"
let g:doxygen_enhanced_color = 1
"let g:load_doxygen_syntax= 1
nmap <Leader>m :Dox<CR>

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" au VimEnter * NERDTree

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <Leader>tt :bn<cr>
map <Leader>rr :bp<CR>

" 快捷键生成ctags的tag，ct=create tags
map <Leader>ct :!ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++ .<CR>
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
" 返回结果列表
nmap <Leader>ts :tselect<CR>

set vb " stop vim bell
set autochdir
" set tags=/home/lingpu.glp/uts/tags;
" set tags=/home/lingpu.glp/online-engine/tags;
" set tags=/home/lingpu.glp/dmp_ums_erpc/tags;
" set tags=home/lingpu.glp/dmp_um/tags;
" 下面这种设置方式可以逐级查找tags文件
set tags=tags;/

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
" let NERDTreeWinPos="right"
 let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 修改文件间隔符，修复首字母丢失问题
let NERDTreeNodeDelimiter = "\t"

" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_right=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>tb :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

"" 配置indent guides(目前关闭，使用indentline替代)
" 配置default修复启动时normal colorscheme报错
" colorscheme default
" let g:indent_guides_enable_on_vim_startup=1 " 随vim启动
" let g:indent_guides_start_level=2
" let g:indent_guides_guide_size=1
" 取消自动配色，手动配置
" let g:indent_guides_auto_colors = 0
 "hi IndentGuidesOdd  guibg=red   ctermbg=3
 "hi IndentGuidesEven guibg=green ctermbg=4
" hi IndentGuidesOdd ctermbg=236
" hi IndentGuidesEven ctermbg=237
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=darkgrey ctermbg=252
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=251
set list
" 设置tag，尾空格的显示形式
set listchars=tab:>-,trail:-,extends:>,precedes:<
" nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"" 配置indent line
nmap <silent> <Leader>i :IndentLinesToggle<cr>
let g:indentLine_enabled = 0

"" 配置fast-switch
nmap <silent> <Leader>sw :FSHere<cr>
" let b:fswitchdst  = 'cc,c,cpp'
augroup mycppfiles
 au!
 au BufEnter *.h let b:fswitchdst  = 'cpp,cc,C'
 au BufEnter *.cc let b:fswitchdst  = 'h'
 "au BufEnter *.h let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/'
augroup END

"" 配置ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"map <leader>f :CtrlPMRU<CR>
map <leader>f :CtrlPMixed<CR>
let g:ctrlp_working_path_mode = 'ra' " 默认工作目录为当前或有.git的目录
" let g:ctrlp_working_path_mode = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.svn/*     " MacOSX/Linux
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"" 配置ctrlp funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

"" 配置syntastic
"设置error和warning的标志
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_enable_signs = 1
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='►'
""总是打开Location List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
"let g:syntastic_always_populate_loc_list = 1
""自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
"let g:syntastic_auto_loc_list = 1
""修改Locaton List窗口高度
"let g:syntastic_loc_list_height = 5
""打开文件时自动进行检查
"let g:syntastic_check_on_open = 1
""自动跳转到发现的第一个错误或警告处
""let g:syntastic_auto_jump = 1
""进行实时检查，如果觉得卡顿，将下面的选项置为1
"let g:syntastic_check_on_wq = 0
""高亮错误
""let g:syntastic_enable_highlighting=1
""让syntastic支持C++11
""let g:syntastic_cpp_compiler = 'clang++'
""let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
""let g:syntastic_cpp_checkers = ['gcc']
""let g:syntastic_cpp_compiler = 'gcc'
""let g:syntastic_cpp_compiler_options = '-std=c++11'
"""设置pyflakes为默认的python语法检查工具
""let g:syntastic_python_checkers = ['pyflakes']
""修复syntastic使用:lnext和:lprev出现的跳转问题，同时修改键盘映射使用sn和sp进行跳转
"function! <SID>LocationPrevious()                       
"  try                                                   
"    lprev                                               
"  catch /^Vim\%((\a\+)\)\=:E553/                        
"    llast                                               
"  endtry                                                
"endfunction                                             
"function! <SID>LocationNext()                           
"  try                                                   
"    lnext                                               
"  catch /^Vim\%((\a\+)\)\=:E553/                        
"   lfirst                                              
"  endtry                                                
"endfunction                                             
"nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>          
"nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
"nmap <silent> sp    <Plug>LocationPrevious              
"nmap <silent> sn    <Plug>LocationNext
"关闭syntastic语法检查, 鼠标复制代码时用到, 防止把错误标志给复制了
"nnoremap <silent> <Leader>ec :SyntasticToggleMode<CR>
"function! ToggleErrors()
"    let old_last_winnr = winnr('$')
"    lclose
"    if old_last_winnr == winnr('$')
"        " Nothing was closed, open syntastic error location panel
"        Errors
"    endif
"endfunction

" 配置multi_cursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-l>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"" 配置wildfire
" This selects the next closest text object.
map <SPACE> <Plug>(wildfire-fuel)
 " This selects the previous closest text object.
vmap <Leader><SPACE> <Plug>(wildfire-water)

" 配置gundo
nnoremap <leader>h :GundoToggle<CR>

" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

"--------------------------------------------------------------------------
""vim-airline
"--------------------------------------------------------------------------
"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1 
let g:airline_inactive_collapse = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_c="%f"
let g:airline_section_x="%y"
"let g:airline#extensions#branch#enabled=0
"let g:airline#extensions#tabline#buffer_nr_show = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='luna' 
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" vundle 环境设置
" 安装命令：
" :Plugin<Install|Clean|Search>
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'tomasr/molokai'
" Plugin 'vim-scripts/phd'
" Plugin 'Lokaltog/vim-powerline'
" Plugin 'octol/vim-cpp-enhanced-highlight'
" Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
Plugin 'derekwyatt/vim-fswitch'
" Plugin 'kshenoy/vim-signature'
" Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
" Plugin 'vim-scripts/indexer.tar.gz'
" Plugin 'vim-scripts/DfrankUtil'
" Plugin 'vim-scripts/vimprj'
" Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
" Plunipsin 'vim-scripts/DrawIt'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
" Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
" Plugin 'sjl/gundo.vim'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'suan/vim-instant-markdown'
" Plugin 'lilydjwg/fcitx.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'yonchu/accelerated-smooth-scroll'
" 插件列表结束
call vundle#end()
filetype plugin indent on
