#lang simply-scheme

; HIGHER ORDER PROCEDURES
; Sums the NEXT of TERM
;; NEXT => The incrementation
;; TERM => The procedure to be applied

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; SUM OF CUBES

(define (cube x) (* x x x))

(define (inc n) (+ n 1))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)

;; SUM OF INTEGERS

; In the sum of integers, we are not apliyng a
; procedure that alters them, but only returning themselves

(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))

(sum-integers 1 10)

;; PI-SUM

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  
  (define (pi-next x)
    (+ x 4))

  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000))


;:DEFINITE INTERAL

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
          dx))


(integral cube 0 1 0.01)

; 1.30 SUM Iterative

(define (sumI term a next b)
  ;; Defines the iter function
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(sumI identity 0 inc 10)

; 1.31 PRODUCT HOF

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (iter-product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (product-integers a b)
  (iter-product identity a inc b))

(product-integers 1 3)

(define (factorial n)
  (product identity 1 inc n))

(factorial 5)

;; Wallis Formula

(define (wallis n)
  (define (term n)
  (* (/ (* 2 n) (- (* 2 n) 1))
     (/ (* 2 n) (+ (* 2 n) 1))
     ))
  (* 2 (product term 1.0 inc n)))

(wallis 10)










 
