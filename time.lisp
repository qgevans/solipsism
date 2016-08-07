(in-package :solipsism)

(defun print-pretty-date (stream)
  (declare (type (or stream boolean) stream))
  (multiple-value-bind (seconds minutes hours day month year day-of-week dst tz) (get-decoded-time)
      (format stream "~[Monday~;Tuesday~;Wednesday~;Thursday~;Friday~;Saturday~;Sunday~] ~
the ~A~[th~;st~;nd~;rd~:;th~] ~
of ~[World's End~;January~;February~;March~;April~;May~;June~;July~;August~;September~;October~;November~;December~] ~
~A ~
~A:~A:~A ~
UTC~C~A~@[ (DST active)~*~]~%"
	      day-of-week
	      day (second (multiple-value-list (truncate day 10)))
	      month
	      year
	      hours minutes seconds
	      (if (< tz 0) #\+ #\-) tz dst)))
