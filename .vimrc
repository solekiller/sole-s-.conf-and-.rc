syntax on
let g:allml_global_maps = 1
set sw=2
set ts=2
set showmatch " show matching brackets
set laststatus=2 " always show the status line
set ai " autoindent
set si " smartindent
map     <C-E>    <ESC>:setlocal spell! spelllang=en_us<CR>
imap    <C-E>    <ESC>:setlocal spell! spelllang=en_us<CR>i
" map     <C-A>    <ESC>:set ft=ruby<CR>i

"Hebrew:
" :set invrl - change keyborad to hebrew and vice versa
" F9 key for right to left writing in command mode
map <F9> <Esc>:set invrl<CR>a
"F9 key for right to keft writing in insert mode
imap <F9> <Esc>:set invrl<CR>a


"Spelling:
:highlight clear SpellBad
:highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
:highlight clear SpellCap
:highlight SpellCap term=underline cterm=underline
:highlight clear SpellRare
:highlight SpellRare term=underline cterm=underline
:highlight clear SpellLocal
:highlight SpellLocal term=underline cterm=underline
"Supertab:
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabMappingTabLiteral = '<C-A>'
"set background=light
"set background=dark
"Python shit:
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"colorscheme 
colorscheme torte 
