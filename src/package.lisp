(cl:in-package #:cl-user)

(defpackage #:multipart-stream
  (:use #:cl #:trivial-gray-streams)
  (:import-from #:clean-composite-stream
                #:clean-composite-stream)
  (:export #:multipart-headers
           #:multipart-stream
           #:multipart-use-headers-p
           #:multipart-headers-stream
           #:make-multipart-constituent-streams
           #:make-multipart-stream
           #:make-boundary))
