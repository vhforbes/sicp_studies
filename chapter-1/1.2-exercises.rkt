#lang simply-scheme

; Exercise 1.9

; (define (plusV1 a b)
;   (if (= a 0)
;       b
;       (inc (plusV1 (dec a) b))))

; Executing using substitution model

; (plusV1 4 3)
; (inc (plusV1 3 3))
; (inc (inc (plusV1 2 3)))
; (inc (inc (inc (plusV1 1 3))))
; (inc (inc (inc (inc (plusV1 0 3)))))
; (inc (inc (inc (inc (3)))))
; (inc (inc (inc 4)))
; (inc (inc 5))
; (inc 6)
; 7

; This is a linear recursion or a recursive processs
; It stores operations to do latter
; Theres a bunch of `inc` stored for it to do
; Hidden information


; (define (plusV2 a b)
;   if (= a 0)
;   b
;   (plusV2 (dec a) (inc b)))



; Executing using substitution model
; (plusV2 4 3)
; (plusV2 (dec 4) (inc 3))
; (plusV2 3 4)
; (plusV2 (dec 3) (inc 4))
; (plusV2 2 5)
; (plusV2 (dec 3) (inc 4))
; (plusV2 1 6)
; (plusV2 (dec 1) (inc 6))
; (plusV2 0 7)
; 7

; ; This is a iterative process or iteration.
; ; You can resume the operation at any stage given the state variables
; ; and it will resume the process
; It doesent get bigger on the X axys even if you change the
; initial parameters
; It only changes the execution time other than the amount of
; information to be stored.


(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(trace A)

(A 1 10)
; ; (A (- 1 1) (A 1 (- 10 1)))
; ; (A 0 (A 1 9))
; ; (A 0 (A (- 1 1) (A 1 (- 9 1))))
; ; (A 0 (A 0 (A 1 8)))
; ; (A 0 (A 0 (A (- 1 1) (A 1 (- 8 1)))))
; ; (A 0 (A 0 (A 0 (A 1 7))))
; ; (A 0 (A 0 (A 0 (A (- 1 1) (A 1 (- 7 1))))))
; ; ....... this is gonna be a fking huge recurssion!

(A 2 4)
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 (A 0 (A 1 1))))
; (A 1 (A 1 (A 0 2)))
; (A 1 (A 1 8))
; (A 1 (A 1 8))
; ; ....... this aswell...

; I dont know what the point is, maybe to see how huge these
; linear recurssions can be?





























