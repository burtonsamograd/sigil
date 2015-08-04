(require :parenscript)

;; add 'load' to parenscript compiler
(ps:defpsmacro load (file)
  (let (code)
    (with-open-file (f file)
      (do
       ((form (read f nil) (read f nil)))
       ((not form))
        (push form code)))
    (cons 'progn (nreverse code))))

(defun ps2js (f)
  (in-package :ps)
  (do
   ((form (read f nil) (read f nil)))
   ((not form))
    (format t  "/* ~A */~%" form)
    (format t "~A~%" (ps:ps* form))))

(defmacro while (test &body body)
  `(loop
      (when (not ,test)
        (return))
      ,@body))

(defun main (argv)
  (if (cdr argv)
      (progn
        (pop argv)
        (while argv
          (let ((arg (pop argv)))
            (cond 
              ((string= arg "--eval")
               (let ((code (pop argv)))
                 (format t "/* --eval ~A~% */" (read-from-string code))
                 (in-package :ps)
                 (eval (read-from-string code))))
              ((string= arg "--pseval")
               (let ((code (pop argv)))
                 (format t "/* --pseval ~A~% */" (read-from-string code))
                 (ps:ps* (read-from-string code))))
              (t
               (with-open-file (f arg)
                 (handler-bind
                     ((error
                       (lambda (e) 
                         (format *error-output* "~A~%" e)
                         (sb-ext:exit :code 1))))
                   (ps2js f))))))))
      (ps2js *standard-input*)))
