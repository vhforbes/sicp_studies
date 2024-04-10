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


;1.4
(define (a-plus-abs-b a b) ((if (> b 0) + -) a b))

(a-plus-abs-b 5 -3)

((if (> -3 0) + -) 5 -3)

; Lisp Expression
(- 5 -3)
; Mathematical expression
; (5 -(-3))
; 8

;1.5 Normal vs Applicative Order

(define (p) (p))
; This a recursive call of p

(define (test x y)
  (if (= x 0)
      0
      y))
; This test, would not evaluate y in a normal order if x = 0
; ; But in a applicative order, it first evaluates the arguments
; So calling p as the second argument, the function gets stuck in the
; recurssive call p loop and never reaches the if

;1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; When you call a prodecure it evaluates the arguments of it.
; So when the person calls the new-if it tries to evaluate the
; srt-iter before checking if it should or not, causing a
; inifite loop

(define (sqrt-iter guess x)
  (if (improved-good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

; Will return bool to say if is close enough
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0000000001))

(define (improved-good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.000000001))


(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y ) 2))

(define (sqrt x) (sqrt-iter 1.0 x))

;1.7
; The important logic here is in the improve of guess.
; The first good-enough is comparing the guess to the square,
; but squaring large or small number comes with imprecision
; To solve this, instead of comparing the guess with the square (desired),
; we check to see if the (new-guess - previous-guess) / (new-guess) is a
; number small enough that is acceptable to consider it beign the square.

;1.8
(define (improve-cube guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))

(define (sqrt-iter2 guess x)
  (if (improved-good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (cube-iter guess x)
  (if (improved-good-enough? guess (improve-cube guess x))
      guess
      (cube-iter (improve-cube guess x) x)))

(cube-iter 1.0 8)













