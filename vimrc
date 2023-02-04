" =========================================================================
" Basic setup
" =========================================================================

" Disable compatibility with vi which can cause issues
:set nocompatible


" Enable filetype detection 
:filetype on


" Enable plugins and load plugin for the detected file type.
:filetype plugin on


" Load an indent file for the detected file type.
:filetype indent on


" Set encoding
:set encoding=utf-8


" =========================================================================
" Plugins
" =========================================================================

" call plug#begin('~/.vim/plugged')
        
"         Plug 'detectindent'
       
" call plug#end()


" =========================================================================
" Colorschemes and Syntax highlighting
" =========================================================================

" Set up colorscheme
set t_Co=256 
set background=light
:colorscheme turbo_mod1


" Enable syntax highlighting
:syntax on


" Disable syntax highlighting
":syntax off


" Highlight current line/row
":hi CursorLineNr term=bold cterm=bold gui=bold
":hi CursorLine cterm=NONE ctermbg=16
":set cursorline


" Set the color of the cursor
:highlight Cursor guifg=white ctermfg=white


" Set font style
:set guifont=Monospace\ Bold\ 12


" =========================================================================
" Backup files
" =========================================================================

" Do not save backup files.
set nobackup


" =========================================================================
" Scrolloff
" =========================================================================

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10


" =========================================================================
" Line numbers
" =========================================================================

" Enable line numbers
:set number


" Disable line numbers
":set nonumber


" =========================================================================
" Indentation and Whitespaces
" =========================================================================

" Set tab width to 4 columns.
:set tabstop=4


" Set shift width to 4 spaces.
:set shiftwidth=4


" Expand tabs to spaces
":set expandtab


" Enable autoindent
:set autoindent


" Assign characters to whitespaces
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣


" Enable whitespace rendering
":set list


" Disable whitespace rendering
:set nolist


" =========================================================================
" Enabling wrapping
" =========================================================================

" Enable softwrap
:set wrap


" Disable softwrap
":set nowrap


" Enable hardwrap if the length of the line is greater than 80 characters
:set textwidth=80


" =========================================================================
" Key mappings
" =========================================================================

" Mappings for using arrow keys to move up, down, left and right in all modes
:

" Enable backspace
:set backspace=indent,eol,start


" Mappings for tabs
" for command mode
:nnoremap <S-Tab> <<

" for insert mode
:inoremap <S-Tab> <C-d>

" for visual mode
:vnoremap <Tab> >gv
:vnoremap <S-Tab> <gv

" For mapping Undo, Redo, Copy, Cut, Paste
" Use system clipboard
:set clipboard=unnamed

" Make VIM use MS Windows keybindings
:source $VIMRUNTIME/mswin.vim
:behave mswin

" =========================================================================
" Enable mouse
" =========================================================================

:set mouse=a


" =========================================================================
" Show Status bar
" =========================================================================
" Clear status line when vimrc is reloaded.
:set statusline=

" Status line left side.
:set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
:set statusline+=%=

" Status line right side.
:set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
:set laststatus=2

" =========================================================================
" Start from previous cursor position
" =========================================================================
:source $VIMRUNTIME/vimrc_example.vim



" =========================================================================
" Vim as a hex-editor
" =========================================================================
" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END
