" " " " " " " " " " " " 
" BASIC KEY BINDINGS  "
" " " " " " " " " " " "
" \ -> Leader key
"
" <C-w> + arrow -> Change buffer
"
" :new, :vnew, :edit <filename> -> buffers
"
" :buffers -> list buffers
"
" :buffer, :sbuffer, :b<number> -> set active buffer
"
" :bd <number> -> delete buffer
"
" <C-w> + z -> Close preview window
"
" " " " " " " " " " " " 


" " " " " "
" PLUGINS "
" " " " " "
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin()
" plugin path -> ~/.local/share/nvim/plugged

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'ap/vim-buftabline'
Plug 'rakr/vim-one'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ycm-core/YouCompleteMe'

call plug#end()

" True color support
"Credit joshdick
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

" " " " " " " "
" BOTTOM BAR  "
" " " " " " " "
lua << END
require('lualine').setup {
	options = {
		theme = "ayu_dark",
	},

	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename" },
		lualine_c = { "g:coc_status" },
		lualine_x = { "branch" },
		lualine_y = { "encoding" },
		lualine_z = { "location" }
	}
}
END

" " " " " " "
" VI CONFIG "
" " " " " " "
set number
set encoding=UTF-8
set tabstop=2
set shiftwidth=4
set expandtab

" " " " " " "
" TELESCOPE "
" " " " " " "
nmap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" " " " " " "
" NERDTREE  "
" " " " " " "
" Press M inside the tree to manipulate files
"
 let g:NERDTreeWinSize=40
 nmap <leader>nt :NERDTreeToggle<CR>
 nmap <C-f> :NERDTreeFind<CR>

" " " " " " " "
" BUFFER TAB  "
" " " " " " " "
set hidden
nmap <C-N> :bnext<CR>
nmap <C-P> :bprev<CR>


" " " " "
" Theme "
" " " " "
set background=dark
colorscheme one

" " " " " " " " "
" YouCompleteMe "
" " " " " " " " "
" nmap <silent> <Leader>h <Plug>(YCMToggleInlayHints)
" <C-space> trigger completion
 nmap <Leader>g :YcmCompleter GoTo<CR>
" <C-O> to jump back & <C-I> to jump forward
