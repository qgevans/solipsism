(defpackage solipsism
  (:use #:common-lisp #:alexandria
	#+sb-thread #:sb-thread)
  (:export #:seqsep #:print-pretty-date)
  #+sb-thread (:export #:queue #:make-queue #:queue-send #:queue-receive))
