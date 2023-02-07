#lang simply-scheme
(define (sum FN a b)
  (if (> a b)
      0
      (+ (FN a) (sum FN (+ a 1) b))))

; Wont work because its trying to multiply x
; (sum (* x x) 3 5)

(define (square x) (* x x))

(sum square 3 5)
; Square is not begin invoked!
; It is passed down as a argument so the SUM
; can use it.

(define (evens nums)
  (cond ((empty? nums) '())
        ((= (remainder (first nums) 2) 0)
         (se (first nums) (evens (bf nums))))
        (else (evens (bf nums)))))

(evens '(1 2))
                     