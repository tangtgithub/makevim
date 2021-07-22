

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 代码折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax " 用语法高亮来定义折叠

set foldlevel=100 " 启动vim时不要自动折叠代码

set foldcolumn=1 " 设置折叠栏宽度"

set nu


if has("cscope")
    """"""""""""" Standard cscope/vim boilerplate
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag
    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0
    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
        " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    " show msg when any other cscope db added
    set cscopeverbose  
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> 
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> 

    map <F6> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
    imap <F6> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
endif

map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags  tags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags;
map <F8> :tfirst<CR>
map <F1> :tprevious<CR>
map <F2> :tnext<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏"
let Tlist_Process_File_Always=1
let Tlist_Use_Right_Window=1
let Tlist_GainFocus_On_ToggleOpen=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let NERDTreeShowBookmarks=1

map <F3> :NERDTreeToggle<CR>
nnoremap <silent> <F4> :TlistToggle<CR>





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Only run linting when saving the file
"let g:ale_lint_on_text_changed = 'never'
"异步语法检查
" ale-setting {{{
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
 
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>h :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['gcc'],
\   'c': ['gcc'],
\   'python': ['pylint'],
\}
"}}}
let g:ale_cpp_cc_options="-std=c++14 -Wall -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/cleaning/inc -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/componentLib/database/inc -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/componentLib/http/inc -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/componentLib/mapTaskModule/inc -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/componentLib/inc -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/componentLib/mqttClient/business/inc -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/componentLib/mqttClient/framework/inc -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/componentLib/navicat/inc -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/componentLib/taskManage/inc -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/componentLib/websocketServer/inc -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/cphu/inc -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/globalinclude/common/ -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/globalinclude/commonFunc -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/globalinclude/protobuf -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/globalinclude/public -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/globalinclude/sdkCallback -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/globalinclude/speRobotDefine -I/home/tangt/code/RV_POS/Cpp/robotself_new/src/globalinclude/thirdparty -I/usr/local/ffmpeg/include -I/home/tangt/code/RV_POS/Cpp/robotself_new/depend/depend_lib_src/json_so/"

