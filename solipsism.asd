(in-package :asdf-user)

(defsystem "solipsism"
  :description "solipsism: Some crappy NIHed library routines"
  :version "0.0.1"
  :author "Quinn Evans <yoshizuki@gmail.com>"
  :license "2-clause BSD"
  :depends-on (#:alexandria)
  :components ((:file "package")
	       (:file "sequence" :depends-on ("package"))
	       (:file "time" :depends-on ("package"))
	       #+sb-thread (:file "queue" :depends-on ("package"))))
