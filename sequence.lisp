(in-package :solipsism)

(defun seqsep (item sequence &rest args)
  (let* ((position (apply #'position (concatenate 'list
						  (list item sequence)
						  args)))
	 (subseq (subseq sequence 0 position))
	 (next (when position
		 (apply #'seqsep (concatenate 'list
					      (list item (subseq sequence (+ position 1)))
					      args)))))
    (if (emptyp subseq)
	next
	(cons subseq next))))
