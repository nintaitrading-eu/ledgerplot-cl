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
      ;:terminal '(pngcairo enhanced font "Liberation Mono,10" size 800 #\, 600)
      :title "Income vs expenses per year"
      :style '(data histogram)
      :style '(histogram clustered gap 1)
      :style '(fill transparent solid noborder)
      :xtics '("nomirror scale 0 center")
      ;:ytics '("add ('' 0) scale 0")
      :ytics '("add ('' 0) axis nomirror scale 0")
      :grid '(ytics)
      :border 1
      :key '(bmargin center horizontal reverse noenhanced autotitles columnhead nobox)
    )
    (eazy-gnuplot::plot
      ;#P"/var/tmp/ledgeroutput1.tmp"
      #P"ledgeroutput1.tmp"
      :using '(2 "xticlabels(strftime('%Y', strptime('%Y-%m-%d', strcol(1))))")
      :title "Income"
      :linecolor '(rgb "light-green"))
    (eazy-gnuplot::plot
      "''"
      :using '(0 2 2)
      :with '(labels left rotate by 45 offset "-4,0.5")
      :textcolor
      :linestyle 0
      :notitle
    )
    (eazy-gnuplot::plot
      ;#P"/var/tmp/ledgeroutput2.tmp"  
      #P"ledgeroutput2.tmp"
      :using '(2)
      :title "Expenses"
      :linecolor '(rgb "light-salmon")
     )
    (eazy-gnuplot::plot
      "''"
      :using '(0 2 2)
      :with '(labels left rotate by 45 offset "0,0.5")
      :textcolor
      :linestyle 0
      :notitle
    )
    )
  output)
