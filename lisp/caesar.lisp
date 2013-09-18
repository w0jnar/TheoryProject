;;;; Thomas Wojnar

(defun encrypt (enstr offset)
	(loop for i from 0 to (-(length enstr) 1) do 
	(if (and (>= (char-code(char enstr i)) (char-code #\A)) (<= (char-code(char enstr i)) (char-code #\Z)))
		(if (>(+(char-code(char enstr i)) (mod offset 26)) (char-code #\Z)) 
			(setf (aref enstr i) (code-char(-(+(char-code(schar enstr i)) (mod offset 26)) 26)))
			(setf (aref enstr i) (code-char(+(char-code(schar enstr i)) (mod offset 26)))))
		(setf (aref enstr i) (char enstr i)))) 
	(print enstr))
	
(defun decrypt (enstr offset)
	(loop for i from 0 to (-(length enstr) 1) do 
	(if (and (>= (char-code(char enstr i)) (char-code #\A)) (<= (char-code(char enstr i)) (char-code #\Z)))
		(if (<(-(char-code(char enstr i)) (mod offset 26)) (char-code #\A)) 
			(setf (aref enstr i) (code-char(+(-(char-code(schar enstr i)) (mod offset 26)) 26)))
			(setf (aref enstr i) (code-char(-(char-code(schar enstr i)) (mod offset 26)))))
		(setf (aref enstr i) (char enstr i)))) 
	(print enstr))
	
(defun solve (enstr maxoff) 
	(let ((enstr (loop for i from 0 to (-(length enstr) 1) do
		(if (and (>= (char-code(char enstr i)) (char-code #\A)) (<= (char-code(char enstr i)) (char-code #\Z)))
			(if (>(+(char-code(char enstr i)) 1) (char-code #\Z)) 
				(setf (aref enstr i) (code-char(-(+(char-code(schar enstr i)) 1) 26)))
				(setf (aref enstr i) (code-char(+(char-code(schar enstr i)) 1))))
			(setf (aref enstr i) (char enstr i)))))))
			
	(loop for j from 0 to maxoff do
		(progn
		(loop for i from 0 to (-(length enstr) 1) do
		(if (and (>= (char-code(char enstr i)) (char-code #\A)) (<= (char-code(char enstr i)) (char-code #\Z)))
			(if (<(-(char-code(char enstr i)) 1) (char-code #\A)) 
				(setf (aref enstr i) (code-char(+(-(char-code(schar enstr i)) 1) 26)))
				(setf (aref enstr i) (code-char(-(char-code(schar enstr i)) 1))))
			(setf (aref enstr i) (char enstr i))))
		(if (< j 10) 
			(format t "Caesar 0~S: ~S~%" j enstr) 
			(format t "Caesar ~S: ~S~%" j enstr)))))