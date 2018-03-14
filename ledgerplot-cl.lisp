;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ledgerplot-cl.lisp:
;;;; See LICENSE.txt for license information.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Global variables
(defparameter clgp:*gnuplot-path* "gnuplot")
(defparameter clgp:*tmp-dat-file* "/tmp/clgplot-tmp.dat")
(defparameter clgp:*tmp-gp-file* "/tmp/clgplot-tmp.gp")

;;; Functions

(defun run-command (a-command-pipe)
  "This function runs a shell command, via inferior-shell."
  (inferior-shell:run/ss `(inferior-shell:pipe (,a-command-pipe))))

;;; Application specific functions.
(defun usage ()
  "Print usage info."
  (format t "Usage: ledgerplot-cl \"path/to/ledger.dat\"~%~%")
  (format t "Options:~%")
  (format t "~4tpath/to/ledger.dat: main ledger.dat file to create charts for~%"))

(defun plot-income-vs-expenses ()
  "Plot income-vs-expenses."
  (progn
    (prepare-plot-income-vs-expenses)
    (generate-plot-income-vs-expenses)))

(defun prepare-plot-income-vs-expenses ()
  "Prepare the data to use in the income-vs-expenses plot."
  (format t "Preparing data... TBD.~%"))

(defun generate-plot-income-vs-expenses ()
  "Generate the plot income-vs-expenses."
  ; TODO: the below is just a dummy example.
  (defparameter *x-list* (loop for i from (- pi) to pi by 0.1 collect i))
  (clgp:splot (lambda (x y) (+ (sin x) (cos y)))
               *x-list* ; x
               *x-list* ; y
               :view-point '(20 45) :z-scale 1.5))

(defun process-ledger-file (a-ledger-file-str)
  "Process ledger file, for creating charts."
  ; TODO: Add other charts.
  (plot-income-vs-expenses))

(defun main ()
  "Main code processing.
Note: sbcl --noinform --script ledger.dat
That makes for 4 arguments. But sbcl --noinform --script counts as 1 whole.
So that leaves 2 arguments to be checked for..."
  (cond
    ((eq (length sb-ext:*posix-argv*) 2)
      (process-ledger-file (nth 1 sb-ext:*posix-argv*)))
    (T (usage))))

;;; Main entry point, to start the code.
(main)
