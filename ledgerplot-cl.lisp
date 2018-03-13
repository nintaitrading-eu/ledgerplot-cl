;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ledgerplot-cl.lisp:
;;;; See LICENSE.txt for license information.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Global variables

;;; Functions

(defun run-command (a-command-pipe)
  "This function runs a shell command, via inferior-shell."
  (inferior-shell:run/ss `(inferior-shell:pipe (,a-command-pipe))))


(defun main ()
  "Main entry point to the application."
  (format t "TBD..."))

(main)
