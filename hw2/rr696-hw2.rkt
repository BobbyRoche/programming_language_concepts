;;
;; DO NOT REMOVE THESE TWO LINES
;;
#lang racket
(provide (all-defined-out))

(define (integers-from n)
 (stream-cons n (integers-from (+ n 1))))

(define integers
  (integers-from 0))

;;Robert Roche
;;HW2


;; Problem 1
;;

(define (stream-scan f z l)  
  (if(stream-empty? l) (stream z) ;;if the stream is empty return the stream 
     (stream-cons z (stream-scan f (f z (stream-first l))(stream-rest l))))) ;;if not we apply the operator to the operands and list the progressive sum
                                                                          
;;
;; Problem 2
;;

(define (stream-take-n n s)
  (if(<= n 0) '() ;;if we have reached the number specified return the list
     (cons (stream-first s)(stream->list(stream-take-n (- n 1)(stream-rest s)))))) ;;if we are not done cons the first element of the stream to the list
                                                                                   ;;subtract 1 from the number and recurse over the rest of the stream til it is 0

;;
;; Problem 3
;;

(define (stream-pair-with f s)
  (if (stream-empty? s) empty-stream ;;if the stream is empty return empty stream
      (stream-cons(cons (stream-first s)(f (stream-first s))) (stream-pair-with f (stream-rest s))))) ;;iterates over the stream and creates a list first element if the original,
                                                                                                      ;;the second is the func applied to the element. This creates a stream of
                                                                                                      ;;these lists until there are no more elements 
;;
;; Problem 4
;;
(define (inf-stream l copy)
  (if (null? l) (inf-stream copy copy) ;;replenishes empty list with the copy list
  (stream-cons(first l)(inf-stream (rest l) copy)))) ;;recursively iterates over the list to create an infinite stream
  
(define (pair-first xs ys) ;;xs and ys are now infinite streams
  (stream-cons (cons (stream-first xs)(stream-first ys))(pair-first (stream-rest xs)(stream-rest ys)))) ;;returns a stream of pairs of the first element in each list
                                                                                                        ;;recurses over the list infinitely

(define (cycle-lists xs ys)
  (pair-first (inf-stream xs xs)(inf-stream ys ys))) ;;calls inf-stream to convert the lists to infinite streams, then calls pair-first to get the stream of pairs

;;
;; Problem 5
(define seen-list '()) ;;global variable seen list to keep track of seen vars


(define (lookup env v) ;;modified lookup function from lab1
  (if(null? env) #f ;;base case, if there var has not been seen we return false
     (if(equal? (first env) v) #t ;;if the var has been seen, we return true, if not we recurse over the variables
        (lookup (rest env) v))))

(define (seen x)                                                         ;;if lookup returns true the var has been seen and we return true
  (if (lookup seen-list x) #t (not(set! seen-list (cons x seen-list))))) ;;else we return false and cons the value to the list
                                                                         ;;since cons-ing a value to a list will always return true, we just return the not of true


