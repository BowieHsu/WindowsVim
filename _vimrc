set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=D:/Vim/vimfiles/bundle/Vundle.vim
call vundle#begin('D:/Vim/vimfiles/bundle/')

" let Vundle manage Vundle, require
Plugin 'gmarik/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'klen/python-mode'
"Plugin 'python-mode/python-mode'
"Plugin 'scrooloose/syntastic'
"Plugin 'kevinw/pyflakes-vim'       
"Plugin 'tell-k/vim-autopep8'
"Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nu!            "设置行号

"colorscheme deep-space    "设置配色方案
colorscheme solarized "设置配色方案

syntax on         "语法高亮
syntax enable  
set background=dark
let g:solarized_termcolors=256

set noundofile      "不生成undofile"
set nobackup        "不生成备份文件
set showmatch        "设置匹配模式

set smartindent        "设置只能对齐
set ai!            "设置自动缩进
set fileencodings=utf-8,gbk

set ambiwidth=double    "设置中文支持
set guifont=consolas:h14 "设置字体及大小

let tabstop=2                " 设置Tab键的宽度        [等同的空格个数]
let softtabstop=2
set shiftwidth=4
:syntax on

set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set ignorecase
set mouse=a        "启用鼠标

"取消自动备份及产生swp文件"
set nobackup
set nowb
set noswapfile

"规定显示窗口的长宽"
"set columns=180
"set lines=60
"自动最大化窗口"
au GUIEnter * simalt ~x

"nerdtree 插件命令"
"打开vim时自动打开nerdtree"
autocmd vimenter *  NERDTree 
"如果窗口除了NERDTree没有其他文件时，自动关闭，可以减少多次按:q
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"noremap <silent> <Leader>f :NERDTreeFind<cr> "打开NERDTree,定位到当前文件
"let NERDTreeQuitOnOpen=1 "NERDTree中打开文件后自动关闭NERDTree窗口

"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>

"显示行号"
let NERDTreeShowLineNumbers=1
"自动定位中心"
let NERDTreeAutoCenter=1
let NERDTreeChDirMode=1
""显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
""窗口大小"
let NERDTreeWinSize=35

"==========================设置YouCompleteMe插件选项================================="
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = 'D:\Vim\vimfiles\bundle\YouCompleteMe\third_party\ycmd\cpp\ycm\.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径"
let g:ycm_path_to_python_interpreter='D:\Anaconda3x64\python'

""是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1

"是否在注释中也开启补全"
let g:ycm_complete_in_comments=0

let g:ycm_collect_identifiers_from_comments_and_strings = 0

""开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=1

"补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1

"" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0

"字符串中也开启补全"
let g:ycm_complete_in_strings = 0

"设置在下面几种文件中屏蔽YCM"
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}

""离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项"
"inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '\<CR>'     
""上下左右键行为"
inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>  
"let python_highlight_all = 1 
"===================================Syntastic插件配置============================="
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"===================================一键执行python代码============================="
" <F5>运行python程序
let g:pymode_python = 'python3'
let g:pymode_run_bind = "<C-f5>"
"不开启检测"
let g:pymode_rope=0

"修改mapleader键"
let mapleader = ';'
