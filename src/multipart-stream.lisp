(cl:in-package :multipart-stream)

(defgeneric multipart-headers (object))

(defgeneric multipart-stream (object))

(defgeneric multipart-use-headers-p (object))

(defgeneric multipart-headers-stream (object))

(defmethod multipart-headers-stream (object)
  (make-instance 'fast-io:fast-input-stream
		 :vector (babel:string-to-octets
			  (with-output-to-string (stream)
			    (loop for (key . value) in (multipart-headers object)
			       do (format stream "~A: ~A~A" key value +crlf+))
			    (format stream "~A" +crlf+)))))

(defun make-multipart-stream (boundary &rest objects)
  (apply #'make-concatenated-stream
         (if (null objects)
	     (list (boundary-tail boundary))
           (loop for object in objects
	      collect (boundary-separator boundary) into streams
	      if (multipart-use-headers-p object)
	      collect (multipart-headers-stream object) into streams
	      collect (multipart-stream object) into streams
	      finally (return (nconc streams (list (boundary-tail boundary))))))))
