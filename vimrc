" ======================
" === Enhance Editor ===
" ======================
" 禁用撤消文件和备份文件的创建
set noundofile
set nobackup

" " 颜色和主题的设置
" syntax on
" set t_Co=256
" colorscheme desert

" 字体设置为 Courier New，高度为 9 点
set guifont=Courier_new:h9

" 打开行号 设置行号
set nu
set relativenumber
set cursorline
set wrap
set wildmenu
" 保证下面有5行可见
set scrolloff=5

" 缩进设置
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" 括号自动补全
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O

" 搜索高亮设置
set hlsearch
exec "nohlsearch"
set incsearch
set smartcase
let mapleader= "\<space>"
noremap <LEADER><CR> :nohlsearch<CR>

" 分屏配置
map gl :set splitright<CR>:vsplit<CR>
map gh :set nosplitright<CR>:vsplit<CR>
map gj :set splitbelow<CR>:split<CR>
map gk :set nosplitbelow<CR>:split<CR>

map <LEADER>l <c-w>l
map <LEADER>h <c-w>h
map <LEADER>j <c-w>j
map <LEADER>k <c-w>k

" 标签页配置
map ty :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

" ====== 开始抄作业 ======
" 设置不与vi兼容
set nocompatible
" 识别文件
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" 看到一些不可见的符号
set list
set listchars=tab:>~,trail:.

" 设置退格键的行为
set backspace=indent,eol,start

" " 设置不同模式下的光标
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ======    结束    ======

" ======================
" === plugins  begin ===
" ======================
call plug#begin('~/.vim/plugged')
  " file explorer
  Plug 'scrooloose/nerdtree'
  
  " air-line
  Plug 'vim-airline/vim-airline'

  " file finder
  Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}

  " hightlight
  Plug 'joshdick/onedark.vim'
  Plug 'jackguo380/vim-lsp-cxx-highlight'

  " lsp
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " debug
  Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-rust --enable-python'}
  
  " terminal
  Plug 'skywind3000/vim-terminal-help'
call plug#end()

" === scrooloose/nerdtree ===
nnoremap <LEADER>e :NERDTreeToggle<CR>

" === Yggdroot/LeaderF ===
let g:Lf_WindowPosition='right'
let g:Lf_PreviewInPopup=1
" let g:Lf_CommandMap = {
" \ '<C-p>':['<C-k>'],
" \ '<C-k>':['<C-p>'],
" \ '<C-j>':['<C-n>']
" \}
nmap <leader>f :Leaderf file<CR>
nmap <leader>b :Leaderf! buffer<CR>
nmap <leader>F :Leaderf rg<CR>
let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"

" === joshdick/onedark.vim ===
set termguicolors
colorscheme onedark

" === jackguo380/vim-lsp-cxx-highlight === "
" 定义必要的高亮组
" 函数高亮
highlight cxxFunction guifg=#7AA6DA ctermfg=LightBlue
" 函数参数高亮
highlight cxxParameter guifg=#A4BDDD ctermfg=LightCyan
" 静态文件变量高亮
highlight cxxFileVariableStatic guifg=#C8C594 ctermfg=DarkYellow
" 结构体高亮
highlight cxxStruct guifg=#70B8A1 ctermfg=DarkCyan
" 结构体字段高亮
highlight cxxStructField guifg=#B4A070 ctermfg=Yellow
" 类型别名高亮
highlight cxxTypeAlias guifg=#9E93B5 ctermfg=Magenta
" 枚举高亮
highlight cxxEnum guifg=#8FBC8B ctermfg=LightGreen
" 枚举成员高亮
highlight cxxEnumMember guifg=#B08D86 ctermfg=DarkRed
" 变量高亮
highlight cxxVariable guifg=#A4BDDD ctermfg=LightCyan
" 宏定义高亮
highlight cxxMacro guifg=#B87070 ctermfg=DarkRed
" 类字段高亮
highlight cxxStructField guifg=#B4A070 ctermfg=Yellow

hi default link LspCxxHlSymFunction cxxFunction
hi default link LspCxxHlSymFunctionParameter cxxParameter
hi default link LspCxxHlSymFileVariableStatic cxxFileVariableStatic
hi default link LspCxxHlSymStruct cxxStruct
hi default link LspCxxHlSymStructField cxxStructField
hi default link LspCxxHlSymFileTypeAlias cxxTypeAlias
hi default link LspCxxHlSymClassField cxxStructField
hi default link LspCxxHlSymEnum cxxEnum
hi default link LspCxxHlSymVariableExtern cxxFileVariableStatic
hi default link LspCxxHlSymVariable cxxVariable
hi default link LspCxxHlSymMacro cxxMacro
hi default link LspCxxHlSymEnumMember cxxEnumMember
hi default link LspCxxHlSymParameter cxxParameter
hi default link LspCxxHlSymClass cxxTypeAlias


" === neoclide/coc.nvim ===
" =========================
" === need:             ===
" === 1. nodejs         ===
" === 2. yarn           ===
" =========================
" coc extensions
let g:coc_global_extensions = [
                        \ 'coc-vimlsp',
                        \ 'coc-cmake',
                        \ 'coc-highlight',
                        \ 'coc-json',
                        \ 'coc-pyright',
                        \ ]

set signcolumn=number

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8

" " Use <Tab> and <S-Tab> to navigate the completion list
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" rename
nmap <LEADER>rn <Plug>(coc-rename)

" 格式化
xmap <LEADER>f <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocAction('format')

" 错误信息跳转 以及修复
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<CR>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nmap <LEADER>qf <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
 nnoremap <silent><nowait><expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) :"\<C-f>"
 nnoremap <silent><nowait><expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) :"\<C-b>"
 inoremap <silent><nowait><expr><C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
 inoremap <silent><nowait><expr><C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
 vnoremap <silent><nowait><expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
 vnoremap <silent><nowait><expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" GoTo code navigation.
" 跳转到定义
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
" 跳转到类型定义
nmap <silent> gy <Plug>(coc-type-definition)
" 跳转到实现
nmap <silent> gi <Plug>(coc-implementation)
" 跳转到引用
nmap <silent> gr <Plug>(coc-references)

" 使用:Gcmake来生成path
function! s:generate_compile_commands()
  if empty(glob('CMakeLists.txt'))
    echo "Can't find CMakeLists.txt"
    return
  endif
  if empty(glob('.vscode'))
    execute 'silent !mkdir .vscode'
  endif
  execute '!cmake -DCMAKE_BUILD_TYPE=debug
    \ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B .vscode'
endfunction
command! -nargs=0 Gcmake :call s:generate_compile_commands()

" 调试
" === puremourning/vimspector ===
let g:vimspector_enable_mappings = 'HUMAN'

function! s:generate_vimspector_conf()
  if empty(glob('.vimspector.json'))
    if &filetype == 'c' || &filetype == 'cpp'
      !cp ~/.vim/vimspector_conf/c.json ./.vimspector.json
    elseif &filetype == 'python'
      !cp ~/.vim/vimspector_conf/python.json ./.vimspector.json
    endif
  endif
  e .vimspector.json
endfunction

command! -nargs=0 Gvimspector :call s:generate_vimspector_conf()

nmap <Leader>v <Plug>VimspectorBalloonEval
xmap <Leader>v <Plug>vimspectorBalloonEval


