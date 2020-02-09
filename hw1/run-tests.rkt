#lang racket
(require rackunit)
(require rackunit/text-ui)
(require "hw1.rkt")

(define hw1-tests
  (test-suite
   "Homework 1 Tests"
   (test-case
    "sigma"
    (check-equal? (sigma 0 5)
                  15
                  "(sigma 0 5)")
    (check-equal? (sigma 162 10056)
                  50553555
                  "(sigma 162 10056)"))

   (test-case
    "log"
    (check-equal? (log 5 100)
                  2
                  "(log 5 100)")
    (check-equal? (log 3 4782968)
                  13
                  "(log 3 4782968)"))

   (test-case
    "choose"
    (check-equal? (choose 13 4)
                  715
                  "(choose 13 4)"))

   (test-case
    "binary"
    (check-equal? (binary 13)
                  1101
                  "(binary 13)")
    (check-equal? (binary 7134)
                  1101111011110
                  "(binary 7134)"))

   (test-case
    "scan"
    (check-equal? (scan + 0 '())
                  '(0)
                  "scan base case")
    (check-equal? (scan + 0 '(1 2 3 4 5 6))
                  '(0 1 3 6 10 15 21)
                  "scan inductive case"))))

(when (not (eq? (run-tests hw1-tests) 0))
    (exit 1))
