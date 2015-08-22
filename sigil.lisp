(require :parenscript)

(defparameter *include-paths* ())

;; add 'load' to parenscript compiler
(ps:defpsmacro load (file)
  ;;(format *error-output* "~A~%" *include-paths*)
  (let (code)
      (catch 'found
        (dolist (include-path *include-paths*)
          (let ((path (concatenate 'string (directory-namestring include-path) file)))
            ;;(format *error-output* "Searching: ~A~%" path)
            (when (probe-file path)
              (with-open-file (f path)
                ;;(format *error-output* "Found: ~A~%" path)
                (do
                 ((form (read f nil) (read f nil)))
                 ((not form))
                  (push form code)))
              (throw 'found (cons 'progn (nreverse code))))))
          (format *error-output* "ps2js: Cannot find load file: ~A~%" file))
      ))

(defun ps2js (f)
  (in-package :ps)
  (do
   ((form (read f nil) (read f nil)))
   ((not form))
    ;(format t  "/* ~A */~%" form)
    (format t "~A~%" (ps:ps* form))))

(defmacro while (test &body body)
  `(loop
      (when (not ,test)
        (return))
      ,@body))

(defun repl ()
  (loop
     (format t "> ")
     (force-output)
     (handler-case
         (let ((form (read)))
           (format t "~A~%" (ps:ps* form)))
       (sb-sys:interactive-interrupt () (sb-ext:exit))
       (end-of-file () (sb-ext:exit))
       )))

(defun main (argv)
  (push (probe-file ".") *include-paths*)
  (if (cdr argv)
      (progn
        (pop argv)
        (while argv
          (let ((arg (pop argv)))
            (cond 
              ((string= arg "-I")
               (let ((dir (pop argv)))
                 (push (probe-file dir) *include-paths*)))
              ((string= arg "-i") (repl))
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
               (let ((probe-results (probe-file arg)))
                 (when probe-results
                   ;; Add current file directory to include paths so they can relative load properly
                   (push (directory-namestring probe-results) *include-paths*)
                   
                   (setf *include-paths* (reverse *include-paths*))
                   (with-open-file (f arg)
                     (handler-bind
                         ((error
                           (lambda (e) 
                             (format *error-output* "~A~%" e)
                             (sb-ext:exit :code 1))))
                       (ps2js f))))))))))
      (repl)))
