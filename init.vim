"    )         )            (       *     
" ( /(      ( /(            )\ )  (  `    
" )\()) (   )\())   (   (  (()/(  )\))(   
"((_)\  )\ ((_)\    )\  )\  /(_))((_)()\  
" _((_)((_)  ((_)  ((_)((_)(_))  (_()((_) 
"| \| || __|/ _ \  \ \ / / |_ _| |  \/  |	author: g4br-4d3v
"| .` || _|| (_) |  \ V /   | |  | |\/| | 	role: Developer
"|_|\_||___|\___/    \_/   |___| |_|  |_|	datetime: 06-2020	                                           


" =-=-=-=-=-=-=-=-=-=-=-=-=-=
"
" Plugins
" 
" =-=-=-=-=-=-=-=-=-=-=-=-=-=

call 	        plug#begin()

"Nerdtree, Devicons and Git
Plug 	        'preservim/nerdtree'
Plug 	        'ryanoasis/vim-devicons'
Plug            'Xuyuanp/nerdtree-git-plugin'

"Vim Powerline (and themes)
Plug 	        'vim-airline/vim-airline'
Plug 	        'vim-airline/vim-airline-themes'

"OneDark Theme
Plug            'joshdick/onedark.vim'

"JavaScript & TypeScript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

"Auto Pairs
Plug            'jiangmiao/auto-pairs'

"Emmet HTML
Plug 'mattn/emmet-vim'

"Emmet Blade
Plug 'jwalton512/vim-blade'
Plug 'jvanja/vim-bootstrap4-snippets'

" Preview colors css
Plug 'gko/vim-coloresque'

"Coc nvim
Plug            'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

call 	        plug#end()


" =-=-=-=-=-=-=-=-=-=-=-=-=-=
"
" Visual settings
" 
" =-=-=-=-=-=-=-=-=-=-=-=-=-=

" OneDark Theme
set             termguicolors
set             background=dark
syntax          on
colorscheme     onedark

"Default themes configuration (Disabled)
"hi              Normal ctermbg=NONE guibg=NONE
"hi              LineNr ctermbg=NONE guibg=NONE
"hi              SignColumn ctermbg=NONE guibg=NONE

" Vim Airline
let             g:airline_theme = "onedark"


" =-=-=-=-=-=-=-=-=-=-=-=-=-=
"
" Editor settings
" 
" =-=-=-=-=-=-=-=-=-=-=-=-=-=

set 		cursorline
set 		hidden
set 		number
set 		relativenumber
set 		inccommand=split
let 		g:airline_powerline_fonts=1
set 		modifiable
set             tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Keybinds/Macros config
let 		mapleader="\\"
nnoremap 	<leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap 	<leader>es :source ~/.config/nvim/init.vim<cr>
imap            <leader>ll <esc>$i<right>
imap            <leader>hh <esc>0i
imap            <leader><CR> <esc>$i<right><CR>
nnoremap        <leader>; <esc>$i<right>;<ESC>
vmap            <leader>d "_di
nno             yyd yyP<down>
nno             cc 0i<DEL><DEL>//<ESC> $
let             g:user_emmet_leader_key=','


" Nerdtree configuration
nnoremap 	      <Leader>f :NERDTreeToggle<Enter> 
let 		        NERDTreeQuitOnOpen = 1
let 		        NERDTreeAutoDeleteBuffer = 1


" =-=-=-=-=-=-=-=-=-=-=-=-=-=
"
" Coc (autocomplete) settings
" 
" =-=-=-=-=-=-=-=-=-=-=-=-=-=

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" (ignore)
set             hidden

set             nobackup
set             nowritebackup

set             cmdheight=2

set             updatetime=300

set             shortmess+=c

set             signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR> 

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
