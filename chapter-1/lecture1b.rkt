#lang simply-scheme

(define (factorial-recursive n)
  (if (= n 1)
      1
      (* n (factorial-recursive (- n 1)))))

; (factorial 6)

; The Linear Recurssion Process

; (* 6 (factorial 5))

; (* 6 (* 5 (factorial 4)))

; (* 6 (* 5 (* 4 (factorial 3))))

; (* 6 (* 5 (* 4 (* 3 (factorial 2)))))

; (* 6 (* 5 (* 4 (* 3 (* 2 (factorial 1))))))

; (* 6 (* 5 (* 4 (* 3 (* 2 1)))))

; (* 6 (* 5 (* 4 (* 3 2))))

; (* 6 (* 5 (* 4 6)))

; (* 6 (* 5 24))

; (* 6 120)

; (720)

(define (factorial-iterative n) (iter 1 1 n))

(define (iter product counter max-count)
  ; I was putting a = sign why was it not working ?
  ; Becase it will stop before the last needed multiplication. S (factorial 6) would actually be counted only until 5
  (if (= counter max-count)
      product
      (iter (* product counter) (+ counter 1) max-count)) ; Here we just make the calculation calling the inter with the new number
  )

(factorial-iterative 6)

; (iter 1 1 6)

; (iter 1 2 6)

; (iter 2 3 6)

; (iter 6 4 6)

; (iter 24 5 6)

; (iter 120 6 6)

; 720






























