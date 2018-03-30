;;;; ledgerplot.asd

(asdf:defsystem #:ledgerplot
  :description "Common lisp application to create charts from ledger data."
  :author "Andy Nagels"
  :license "MIT License, see LICENSE.txt"
  :depends-on (#:quicklisp
               #:split-sequence
               #:inferior-shell
               #:clgplot
	       #:utils-cl)
  :serial t
  :components ((:file "package")
               (:file "plots/income-vs-expenses")
               (:file "ledgerplot" :depends-on ("package" "plots/income-vs-expenses"))
               ))

