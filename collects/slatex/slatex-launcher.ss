
(module slatex-launcher mzscheme
  (require "slatex-wrapper.ss")

  (define argv (current-command-line-arguments))
  
  (case (system-type)
    [(macos)
     
     ;; set up drag and drop
     (current-load slatex)
     
     (for-each slatex (vector->list argv))]
    [(windows unix macosx)
     (when (eq? (vector) argv)
       (error 'slatex "expected a file on the command line~n"))
     (parameterize ([error-escape-handler exit])
       (slatex (vector-ref argv 0)))
     (exit)]))
