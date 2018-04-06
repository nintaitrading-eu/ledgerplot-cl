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
    (eazy-gnuplot::gp-setup
      :output output
      :terminal '(pngcairo enhanced font "Liberation Mono,10")
      :title "multiple histograms"
      ;:key '(invert reverse left outside)
      ;:key '(autotitle columnheader)
      :style '(data histogram)
      :style '(histogram clustered gap 1)
      :style '(fill transparent solid noborder)
      ;:ytics '("add ('' 0) scale 0")
      )
    ;(eazy-gnuplot::gp :set :size (list "800,600"))
    ;(eazy-gnuplot::gp :set :border 1)
    ;(eazy-gnuplot::gp :set :xtics (list "nomirror scale 0 center"))
    ;(eazy-gnuplot::gp :set :ytics (list "axis nomirror"))
    ;(eazy-gnuplot::gp :grid :ytics)
    (eazy-gnuplot::plot
      ; TODO: Plot this command:
      ; plot "ledgeroutput1.tmp" using 2:xticlabels(strftime('%Y', strptime('%Y-%m-%d', strcol(1)))) title "Income" linecolor rgb "light-green", '' using 0:2:2 with labels left font "Courier,8" rotate by 45 offset -4,0.5 textcolor linestyle 0 notitle, "ledgeroutput2.tmp" using 2 title "Expenses" linecolor rgb "light-salmon", '' using 0:2:2 with labels left font "Courier,8" rotate by 45 offset 0,0.5 textcolor linestyle 0 notitl
      ;(lambda ()
      ;  (loop for r in '(("2014-01-01" 513.1)
      ;                   ("2015-01-01" -235.3)
      ;                   ("2016-01-01" 600.4))
      ;        do (format t "~&~{~^~a ~}" r)))
      ;#P"/var/tmp/ledgeroutput1.tmp"
      #P"ledgeroutput1.tmp"
      ;:using '(2 "xticlabels(strftime('%Y', strptime('%Y-%m-%d', strcol(1))))")
      :using '(1 3 "xtic(2)")
      ;:title "Income"
      :with '(boxes)
      ;:using '(0 2 2)
      ;:with '(:labels left "rotate by 45" "offset -4,0.5")
      ;:notitle
      ;#P"/var/tmp/ledgeroutput2.tmp"
      ))
  output)
