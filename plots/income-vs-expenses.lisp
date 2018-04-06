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
      ; begin output setup
      :output output
      :terminal '(pngcairo enhanced font "Liberation Mono,10")
      ;:terminal '(pngcairo enhanced font "Liberation Mono,10" size 800 #\, 600)
      :style '(data histogram)
      :style '(histogram clustered gap 1)
      :style '(fill transparent solid noborder)
      ;:border '(1 front linetype -1 linewidth 1.0)
      :border '(0)
      :key '(bmargin center horizontal reverse noenhanced autotitles columnhead nobox)
      ; end output setup
      ; begin titles/labels
      :title "Income vs expenses per year"
      :xlabel "Year"
      :ylabel "Value (EUR)"
      ; end titles/labels
      ; begin grid/axis
      :xtics '("border in scale 0,0 nomirror rotate by -45 offset character 0, 0, 0 autojustify")
      :ytics '("border in scale 0,0 nomirror rotate by -45 offset character 0, 0, 0 autojustify")
      :ztics '("border in scale 0,0 nomirror rotate by -45 offset character 0, 0, 0 autojustify")
      :cbtics '("border in scale 0,0 nomirror rotate by -45 offset character 0, 0, 0 autojustify")
      :rtics '("axis in scale 0,0 nomirror rotate by -45 offset character 0, 0, 0 autojustify")
      :grid '(nopolar xtics nomxtics ytics nomytics noztics nomztics nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics)
      :xzeroaxis '(linetype -1 linewidth 1.0)
      ;:yzeroaxis '(linetype 0 linewidth 1.0)
      ;:zzeroaxis '(linetype 0 linewidth 1.0)
      ; end grid/axis
    )
    ; Income data
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
      :notitle)
    ; Expenses data
    (eazy-gnuplot::plot
      ;#P"/var/tmp/ledgeroutput2.tmp"  
      #P"ledgeroutput2.tmp"
      :using '(2)
      :title "Expenses"
      :linecolor '(rgb "light-salmon"))
    (eazy-gnuplot::plot
      "''"
      :using '(0 2 2)
      :with '(labels left rotate by 45 offset "0,0.5")
      :textcolor
      :linestyle 0
      :notitle)
    )
  output)
