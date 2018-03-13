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


(defun main ()
  "Main entry point to the application."
  (progn
(defparameter *x-list* (loop for i from (- pi) to pi by 0.1 collect i))
(clgp:splot (lambda (x y) (+ (sin x) (cos y)))
  *x-list* ; x
  *x-list* ; y
  :view-point '(20 45) :z-scale 1.5)
    (format t "TBD...")))

(main)
