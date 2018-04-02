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
  (multiple-histograms-plot "income-vs-expenses.png"))

(defun multiple-histograms-plot (output)
  (eazy-gnuplot::with-plots
    (*standard-output* :debug nil)
    (gp-setup
      :output output
      :terminal '(pngcairo enhanced)
      :title "multiple histograms"
      :key '(invert reverse left outside)
      :key '(autotitle columnheader)
      :style '(data histogram)
      :style '(histogram rowstacked)
      :style '(fill solid border -1))
    (gp :set :size (list "800,600"))
    (plot
     (lambda ()
       (loop for r in '((8.01 1 5 1) (8.02 3 5 1) (8.03 4 4 1) (8.04 3 4 1)
                        (8.05 1 2 1))
             do (format t "~&~{~^~a ~}" r)))
     :using '(2 "xtic(1)") :title "col0" :using 2 :title "col1" :using 3 :title
     "col2" :using 4 :title "col3"))
  output)
