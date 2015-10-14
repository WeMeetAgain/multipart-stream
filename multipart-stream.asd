(cl:in-package #:asdf-user)

(defsystem :multipart-stream
  :version "0.1.0"
  :description "A simple multipart stream."
  :author "Cayman Nava"
  :license "MIT"
  :components ((:module "src"
        :serial t
		:components
		((:file "package")
         (:file "util")
		 (:file "multipart-stream"))))
  :long-description #.(uiop:read-file-string
		       (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op multipart-stream-test))))
		 
