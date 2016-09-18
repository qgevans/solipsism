(in-package :solipsism)

(defstruct queue
  (waitqueue (make-waitqueue))
  (lock (make-mutex))
  (queue nil))

(defun queue-send (queue item)
  (with-mutex ((queue-lock queue))
    (if (queue-queue queue)
	(nconc (queue-queue queue) (cons item nil))
	(setf (queue-queue queue) (cons item nil)))
    (condition-notify (queue-waitqueue queue))))

(defun queue-receive (queue)
  (with-mutex ((queue-lock queue))
    (loop
       (condition-wait (queue-waitqueue queue) (queue-lock queue))
       (let ((raw-queue (queue-queue queue)))
	(unless (emptyp raw-queue)
	  (let ((item (first raw-queue)))
	       (setf (queue-queue queue) (rest raw-queue))
	       (return item)))))))
