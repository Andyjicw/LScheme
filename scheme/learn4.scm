#lang racket
#|教程地址->http://deathking.github.io/yast-cn/contents/chapter5.html|#

;;; 分支
;; if表达式 (if predicate then_value else_value)
; #t #f
(null? '())
(null? '(a b c))

; 首项为a0,增长率r,项数为n的几何增长(geometric progression)数列之和
(define (sum-gp a0 r n)
  (* a0
     (if (= r 1)
         n
         (/ (- 1 (expt r n)) (- 1 r)))))   ; !!

; 练习1
; 编写下面的函数。阅读第五节了解如何编写谓词。
; 返回一个实数绝对值的函数。
; 返回一个实数的倒数的函数。如果参数为0,则返回#f。
; 将一个整数转化为ASCII码字符的函数。
  ;只有在33~126之间的ASCII码才能转换为可见的字符
  ;。使用integer->char可以将整数转化为字符。
  ;如果给定的整数不能够转化为字符，那么就返回#f。

(define (my-abs n)
  (if (> n 0)
      n
      (* -1 n)))

(define (inv n)
  (if (= n 0)
      #f
      (/ n)))

(define (i2a n)
  (if (<= 33 n 126)
      (integer->char n)
      #f))

;; and
(and #f 0)
(and 1 2 3)
(and 1 2 3 0 #f)
(and)
;; or
(or 0 #f)
(or #f 0)
(or #f #f #f)

; 练习2
; 编写下面的函数。
; 一个接受三个实数作为参数的函数,若参数皆为正数则返回它们的乘积。
; 一个接受三个实数作为参数的函数，若参数至少一个为负数则返回它们的乘积。

(define (pro3and a b c)  
  (and (positive? a)
       (positive? b)
       (positive? c)
       (* a b c)))

(define (pro3or a b c)
  (if (or (negative? a)
      (negative? b)
      (negative? c))
      (* a b c)
  #f))

;; cond表达式
; 例:城市游泳池的收费。
; Foo市的城市游泳池按照顾客的年龄收费：
; 如果 age ≤ 3 或者 age ≥ 65 则 免费；
; 如果 介于 4 ≤ age ≤ 6 则 0.5美元；
; 如果 介于 7 ≤ age ≤ 12 则 1.0美元；
; 如果 介于 13 ≤ age ≤ 15 则 1.5美元；
; 如果 介于 16 ≤ age ≤ 18 则 1.8美元；
; 其它 则 2.0美元；
; 那么，一个返回城市游泳池收费的函数如下：
(define (free age)
  (cond
    ((or (<= age 3) (>= age 65)) 0)
    ((<= 4 age 6) 0.5)
    ((<= 7 age 12) 1.0)
    ((<= 13 age 15) 1.5)
    ((<= 16 age 18) 1.8)
    (else 2.0)
    ))

; 练习 3
; 编写下列函数。
; 成绩(A-D)是由分数决定的。编写一个将分数映射为成绩的函数,映射规则如下:
; A 如果 score ≥ 80
; B 如果 60 ≤ score ≤ 79
; C 如果 40 ≤ score ≤ 59
; D 如果 score < 40

(define (score n)
  (cond
    ((>= n 80) 'A)
    ((<= 60 n 79) 'B)
    ((<= 40 n 59) 'C)
    (else 'D)
   ))

;; eq?、eqv?和equal?
#|
eq?
该函数比较两个对象的地址,如果相同的话就返回#t。
例如,(eq? str str)返回#t,因为str本身的地址是一致的。
与此相对的,因为字符串”hello”和”hello”被储存在了不同的地址中,函数将返回#f。
不要使用eq?来比较数字,因为不仅在R5RS中,甚至在MIT-Scheme实现中,它都没有指定返回值。
使用eqv?或者=替代。
|#
(define str "hello")
(eq? str str);#t
(eq? "hello" "hello");#t ?
(eq? 'foo 'foo);#t?

#|
eqv?
该函数比较两个存储在内存中的对象的类型和值。
如果类型和值都一致的话就返回#t。
对于过程(lambda表达式)的比较依赖于具体的实现。
这个函数不能用于类似于表和字符串一类的序列比较,因为尽管这些序列看起来是一致的,但它们的值是存储在不同的地址中。
|#
(eqv? 1.0 1.0);#t
(eqv? 1 1.0);#f

#|
equal?
该函数用于比较类似于表或者字符串一类的序列。
|#
(equal? (list 1 2 3) (list 1 2 3));#t
(equal? "hello" "hello");#t

;; 用于检查数据类型的函数
#|
下面列举了几个用于检查类型的函数。这些函数都只有一个参数。

pair? 如果对象为序对则返回#t;
list? 如果对象是一个表则返回#t。要小心的是空表’()是一个表但是不是一个序对。
null? 如果对象是空表’()的话就返回#t。
symbol? 如果对象是一个符号则返回#t。
char? 如果对象是一个字符则返回#t。
string? 如果对象是一个字符串则返回#t。
number? 如果对象是一个数字则返回#t。
complex? 如果对象是一个复数则返回#t。
real? 如果对象是一个实数则返回#t。
rational? 如果对象是一个有理数则返回#t。
integer? 如果对象是一个整数则返回#t。
exact? 如果对象不是一个浮点数的话则返回#t。
inexact? 如果对象是一个浮点数的话则返回#t。
|#

;; 用于比较数的函数
#|
=、>、<、<=、>=
这些函数都有任意个数的参数。如果参数是按照这些函数的名字排序的话,函数就返回#t
|#
(= 1 1 1.0)
(< 1 2 1)

#|
odd?、even?、postitive?、negative?、zero?
这些函数仅有一个参数,如果这些参数满足函数名所指示的条件话就返回#t
|#

;; 用于比较符号的函数
#|
在比较字符的时候可以使用char=?、char<?、char>?、char<=?以及char>=?函数。具体的细节请参见R5RS。
|#

;; 用于比较字符串的函数
#|
比较字符串时,可以使用string=?和string-ci=?等函数。具体细节请参见R5RS。
|#

#|
欢迎指出问题
=========================
联系我  : 479003573@qq.com
github : Andyjicw
=========================
|#