
" Don't try to be vi compatible
set nocompatible

" show line number
set number

" Show file stats
set ruler

" Turn on syntax highlighting
syntax on

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" center cursor - https://vi.stackexchange.com/a/26055/7593
augroup KeepCentered
  autocmd!
  autocmd CursorMoved * normal! zz
augroup END
inoremap <CR> <C-\><C-O><C-E><CR>
inoremap <BS> <BS><C-O>zz
nnoremap o <C-E>o

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL
