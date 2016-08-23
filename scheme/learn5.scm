#lang racket
#|教程地址->http://deathking.github.io/yast-cn/contents/chapter6.html|#

;;; 局部变量
;; let表达式 (let ((a 3) (b 2)) (* a b))

; 例1:声明局部变量i和j,将它们与1、2绑定,然后求二者的和。
(let ((i 1) (j 2))
  (+ i j))
; let表达式可以嵌套使用。

; 例2:声明局部变量i和j,并将分别将它们与1和i+2绑定,然后求它们的乘积。
(let ((i 1))
  (let ((j (+ i 2)))
    (* i j)))

; let*表达式可以用于引用定义在同一个绑定中的变量。实际上,let*只是嵌套的let表达式的语法糖而已。
(let* ((i 1) (j (+ i 2)))
  (* i j))

; 例3:函数quadric-equation用于计算二次方程。
  ;它需要三个代表系数的参数:a、b、c (ax^2 + bx + c = 0),返回一个存放答案的实数表。
  ;通过逐步地使用let表达式,可以避免不必要的计算。
(define (quadric-equation a b c)
  (if (zero? a)      
      'error                                      ; 1
      (let ((d (- (* b b) (* 4 a c))))            ; 2
        (if (negative? d)
            '()                                   ; 3
            (let ((e (/ b a -2)))                 ; 4
              (if (zero? d)
              (list e)
              (let ((f (/ (sqrt d) a 2)))         ; 5
                (list (+ e f) (- e f)))))))))
;(quadric-equation 3 5 2)
;solution of 3x^2+5x+2=0
;Value 12: (-2/3 -1)

; 例2:声明局部变量i和j,并将分别将它们与1和i+2绑定,然后求它们的乘积。

(let ((i 1)) (let ((j (+ i 2))) (* i j)))

(let* ((i 1) (j (+ i 2)))
  (* i j))

(let ((a 3) (b 2)) (let ((j a)) (* a b j)))

(let* ((a 3) (b 2) (j a)) (* a b j))

(eq? "1" "1")

(equal? "123" "123")
(eqv? "123" "123")

; 例3:函数quadric-equation用于计算二次方程。
  ;它需要三个代表系数的参数:a、b、c (ax^2 + bx + c = 0),返回一个存放答案的实数表。
  ;通过逐步地使用let表达式,可以避免不必要的计算。
(define (quadric-equation1 a b c)
  (if (zero? a)      
      'error                                      ; 1
      (let ((d (- (* b b) (* 4 a c))))            ; 2
        (if (negative? d)
            '()                                      ; 3
            (let ((e (/ b a -2)))                    ; 4
              (if (zero? d)
              (list e)
              (let ((f (/ (sqrt d) a 2)))        ; 5
                (list (+ e f) (- e f)))))))))

;(quadric-equation 3 5 2)  ; solution of 3x^2+5x+2=0
;Value 12: (-2/3 -1)

(define (throw v a)
  (let ((r (/ (* 4 a (atan 1.0)) 180)))
    (/ (* 2 v v (cos r) (sin r)) 9.8)))

#|
欢迎指出问题
=========================
联系我  : 479003573@qq.com
github : Andyjicw
=========================
|#