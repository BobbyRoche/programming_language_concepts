;;
;; DO NOT REMOVE THESE TWO LINES
;;
#lang racket
(provide (all-defined-out))

;;
;; Problem 1
;;

(define (sigma m n)
  (if(equal? m n) m
       (+ m (sigma (+ m 1) n ))))
;;
;; Problem 2
;;
(define (log m n)
  (if(< n m)0
     (+ 1 (log m (/ n m)))))

;;
;; Problem 3
;;

(define (choose n k)
  (if(equal? k 0)1
     (if(equal? k n)1
     (+(choose(- n 1) (- k 1))(choose(- n 1)k)))))
     

;;
;; Problem 4
;;

(define (binary n)
  (if (equal? n 0)0
      (+ (remainder  n 2)(* 10 (binary (quotient n 2))))))

;;
;; Problem 5
;;

(define (scan f z l)
  (if(null? l) (cons z '())
     (cons z (scan f (f z (first l))(rest l)))))
