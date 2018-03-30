;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; income-vs-expenses.lisp:
;;;; File, related to the income vs expenses plot.
;;;;
;;;; See LICENSE.txt for license information.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package :ledgerplot)

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
