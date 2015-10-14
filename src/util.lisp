(cl:in-package #:multipart-stream)

(defvar +crlf+ #.(format nil "~C~C" #\return #\linefeed))

;;; from: https://github.com/fukamachi/dexador/blob/master/src/util.lisp
(defun make-boundary (&optional (length 12))
  (declare (optimize (speed 3) (safety 0) (space 0) (compilation-speed 0))
           (type fixnum length))
  (let ((result (make-string length)))
    (declare (type simple-string result))
    (dotimes (i length result)
      (setf (aref result i)
            (ecase (random 5)
              ((0 1) (code-char (+ #.(char-code #\a) (random 26))))
              ((2 3) (code-char (+ #.(char-code #\A) (random 26))))
              ((4) (code-char (+ #.(char-code #\0) (random 10)))))))))

(defun boundary-separator (boundary)
  (declare (optimize (speed 3) (safety 0) (space 0) (compilation-speed 0))
           (type fixnum boundary))
    (make-string-input-stream (format nil "--~A~A" boundary +crlf+)))

(defun boundary-tail (boundary)
  (declare (optimize (speed 3) (safety 0) (space 0) (compilation-speed 0))
           (type fixnum boundary))
    (make-string-input-stream (format nil "--~A--" boundary)))
