#lang simply-scheme
; Will return bool to say if is close enough


(define (square a) (* a a))

(define (average x y)
  (/ (+ x y ) 2))


; Here we see the procedures inside the procedure itself
(define (sqrt x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.0000000001))

  (define (improved-good-enough? previous-guess guess)
    (< (abs (/ (- guess previous-guess) guess)) 0.000000001))

  (define (improve guess x)
    (average guess (/ x guess)))

  (define (sqrt-iter guess x)
    (if (improved-good-enough? guess (improve guess x))
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x)
  )

; butttt, we see that the x has the same meaning and is beign passed trough arguments a
; bunch of times!
; Theres no need for that!

(define (sqrt-lexical x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.0000000001))

  (define (improved-good-enough? previous-guess guess)
    (< (abs (/ (- guess previous-guess) guess)) 0.000000001))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (sqrt-iter guess)
    (if (improved-good-enough? guess (improve guess x))
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x)
  )

; Since X was defined in the sqrt-lexical procedure, the procedures inside
; also have access to the x.
; So we can make them FREE VARIABLES inside the definitions of the subprocedures
