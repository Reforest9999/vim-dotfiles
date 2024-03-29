" basic functionality 
filetype indent on
set showmatch
set encoding=UTF-8
set cursorline
let &t_ut='' " color erase

" basic styling
syntax on
set expandtab
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set number
set nuw=4
set background=light
colorscheme gruvbox
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" tab buffer
nnoremap  <silent> <C-left>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>

"Debuggin(gdb)
:nnoremap <silent><C-b>":bo term<CR>
:nnoremap  <silent> <F5> :Termdebug<CR>
:noremap <silent><C-t> :vert term<CR>
tnoremap <C-h>ghci <CR>
tnoremap <C-e>exit <CR>
:packadd termdebug
let g:termdebug_wide = 1
autocmd Bufnew, Buffread *.asm set ft=nasm
