#lang simply-scheme

(define a 3)
(define b (+ a 1))
(define c 6)

(if (and (> b a) (< b (* a b)))
    b
    a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

;1.2
(/ (+ 5
      4
      (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7))
   )

;1.3
(define (square a) (* a a))

(define (largest a b c)
  (cond ((and (> a b) (> a c)) a)
        ((and (> b a) (> b c)) b)
        ((and (> c a) (> c b)) c)
        )
  )

(largest a b c)



