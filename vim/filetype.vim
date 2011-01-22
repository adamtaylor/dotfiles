if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " tt2 syntax files 
    au BufNewFile,BufRead *.tt2
      \ if ( getline(1) . getline(2) . getline(3) =~ '<\chtml' |
      \           && getline(1) . getline(2) . getline(3) !~ '<[%?]' ) |
      \   || getline(1) =~ '<!DOCTYPE HTML' |
      \   setf tt2html |
      \ else |
      \   setf tt2 |
      \ endif
augroup END
