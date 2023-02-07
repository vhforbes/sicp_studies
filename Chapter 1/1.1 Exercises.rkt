#lang simply-scheme


(define a 3)
(define b (+ a 1))

(+ a b (* a b))

(< a b)

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


(/ (+ 5
      4
      (- 2 (- 3 (+ 6 (/ 4 5)))))
      (* 3
         (- 6 2)
         (- 2 7)))

(define (largest a b c)
  (cond ((and (> a b) (> a c) a))
        ((and (> b a) (> b c) b))
        ((and (> c a) (> c b) c))
        ))

(define (second-largest a b c)
  (cond ((and (> a b) (> c a) a))
        ((and (> b a) (> c b) b))
        ((and (> c a) (> b c) c))
        ))

(define (square n)
  (* n n))

(define (square-two-largest a b c)
  (+ (square (largest a b c)) (square (second-largest a b c))))

(square-two-largest 1 2 3)


(define (a-plus-abs-b a b) ((if (> b 0) + -) a b))
;; Will define b as positive if it is negative

;(define (p) (p))
;(define (test x y)
; (if (= x 0) 0 y))

;(test 5 (p))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))


(new-if (= 2 3) 0 5)


;Square root newtons method
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))


(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.00000000001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.9)

;1.6
;It enter an infinite loop
;new-if is a procedure, in applicative order evaluation, all the procedure
;argumentes are FULLY EVALUATED before the procedure runs.

(define (cube x) (* x x x))

(define (good-enough-cube? guess x)
  (< (abs (- (cube guess) x)) 0.00000000001))

(define (cube-root-iter guess x)
  (if (good-enough-cube? guess x)
      guess
      (cube-root-iter (improve-cube guess x) x)))

(define (improve-cube guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 8)


