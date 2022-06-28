syntax enable

set background=dark
set termguicolors

let &t_ut=''

set path+=**
set wildmenu
set wildoptions=tagfile
set wildignore+=*/node_modules/*
set wildignore+=*/.git/*
set wildignore+=*/.next/*
set wildignore+=*/include/*

set ignorecase

set scrolloff=4
set laststatus=2
set number

set wrap
set textwidth=140
set linebreak
set breakindent
set breakindentopt=shift:2

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set hidden
set lazyredraw
set noswapfile
set autoread
set nobackup

function XClipPaste()
  let @c=system("xclip -o -sel clip") 
  :normal "cp<CR>
endfunction

" Paste
nnoremap <silent> <C-v> <cmd>call XClipPaste()<CR>
inoremap <silent> <C-v> <cmd>call XClipPaste()<CR>
vnoremap <silent> <C-v> <cmd>call XClipPaste()<CR>

" Copy
vnoremap <silent> <C-c> "cy <bar> :call system('xclip -sel clipboard', @c)<CR>h
xnoremap <silent> <C-c> "cy <bar> :call system('xclip -sel clipboard', @c)<CR>h

" Find files
nnoremap <C-p> :find 

" Toggle highlight
nnoremap \ :set invhlsearch<CR>

" Block Selection
nnoremap <C-b> <C-v>

" Search for selected text 
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>N:set hlsearch<CR>

" Vertical Scrolling
nnoremap <C-d> 2<C-e>
nnoremap <C-u> 2<C-y>

" Start / End of line
nnoremap <C-h> ^
nnoremap <C-l> $

function! NetrwMappings()
  noremap <silent> <leader>f :call ToggleNetrw()<CR>
  noremap <buffer> <C-v> :call OpenToRight()<CR>
  noremap <buffer> <C-x> :call OpenBelow()<CR>
  noremap <buffer> T :call OpenTab()<CR>
endfunction

function! OpenToRight()
	:normal v
	let g:path=expand('%:p')
	execute 'q!'
	execute 'belowright vnew' g:path
	:normal <C-w>l
endfunction

function! OpenBelow()
	:normal v
	let g:path=expand('%:p')
	execute 'q!'
	execute 'belowright new' g:path
	:normal <C-w>l
endfunction

" Allow for netrw to be toggled
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr('$')
        while (i >= 1)
            if (getbufvar(i, '&filetype') ==# 'netrw')
                silent exe 'bwipeout ' . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Check before opening buffer on any file
function! NetrwOnBufferOpen()
    if exists('b:noNetrw')
        return
    endif
    call ToggleNetrw()
endfun

let g:NetrwIsOpen=0

augroup Netrw
" Close Netrw if it's the only buffer open
  autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
autocmd filetype netrw call NetrwMappings()

noremap <silent> <C-n> :call ToggleNetrw()<CR>

let g:netrw_banner=0 
let g:netrw_winsize = 28
let g:netrw_liststyle=3

