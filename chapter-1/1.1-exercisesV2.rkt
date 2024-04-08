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

(define (sum_of_squares a b) (+ (square a) (square b)))

(define (largest a b c)
  (cond
    ((and (> a b) (> a c)) a)
    ((and (> b a) (> b c)) b)
    ((and (> c a) (> c b)) c)
    )
  )

(largest 5 7 3)

(define (second_largest a b c)
  (cond
    ((or (and (> a b) (> a c)) (and (> a c) (< a b))) a)
    ((or (and (> b a) (> c b)) (and (> b c) (< b a))) b)
    ((or (and (> c a) (> b c)) (and (> c b) (< c a))) c)
    )
  )

(second_largest 5 7 3)



(define (sum_square_two_largests a b c)
  (+ (sum_of_squares (largest a b c) (second_largest a b c)))
  )

(sum_square_two_largests 5 7 3)





