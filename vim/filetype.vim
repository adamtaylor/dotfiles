if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    " tt2 syntax files
    au BufNewFile,BufRead *.tt2 setf tt2html
    au BufNewFile,BufRead *.tt setf tt2html
augroup END
