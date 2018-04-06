;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ledgerplot.lisp:
;;;; Chart plotting application for ledger-cli data.
;;;;
;;;; See LICENSE.txt for license information.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Global variables

;(defparameter clgp:*gnuplot-path* "gnuplot")
;(defparameter clgp:*tmp-dat-file* "/tmp/clgplot-tmp.dat")
;(defparameter clgp:*tmp-gp-file* "/tmp/clgplot-tmp.gp")

;;; Functions
; Nothing here for now

;;; Application specific functions.

(defun usage ()
  "Print usage info."
  (format t "Usage: ledgerplot \"path/to/ledger.dat\"~%~%")
  (format t "Options:~%")
  (format t "~4tpath/to/ledger.dat: main ledger.dat file to create charts for~%"))

(defun process-ledger-file (a-ledger-file-str)
  "Process ledger file, for creating charts."
  ; TODO: Add other charts.
  (ledgerplot::plot-income-vs-expenses))

(defun main ()
  "Main code processing.
Note: sbcl --noinform --script ledger.dat
That makes for 4 arguments. But sbcl --noinform --script counts as 1 whole.
So that leaves 2 arguments to be checked for..."
  ;(cond
  ;  ((eq (length sb-ext:*posix-argv*) 2)
  ;    (process-ledger-file (nth 1 sb-ext:*posix-argv*)))
  ;  (T (usage)))
  (ledgerplot::plot-income-vs-expenses) 
  )

;;; Main entry point, to start the code.

(main)
