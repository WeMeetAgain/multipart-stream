(cl:in-package #:cl-user)

(defpackage #:multipart-stream
  (:use #:cl #:trivial-gray-streams)
  (:export #:multipart-headers
           #:multipart-stream
	   #:multipart-use-headers-p
           #:multipart-headers-stream
           #:make-multipart-stream
           #:make-boundary))
