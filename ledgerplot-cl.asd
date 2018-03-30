;;;; ledgerplot-cl.asd

(asdf:defsystem #:ledgerplot-cl
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
               (:file "ledgerplot-cl" :depends-on ("package"))
               ))

