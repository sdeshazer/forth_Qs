/ comments in forth

/ infix notation: A + B

/ RPN input:                         infix output:
/ 3 4 2 * 1 5 - 2 3 ^ ^ / +        3 + 4 * 2 / (1 - 5) ^ 2 ^ 3

(a) 15 5 / 2 -                       (15/3) - 2
(b) 1 1 2 3 5 + - + -                1-(1_+2-(3+5))
(c) 15 7 1 1 + - / 3 * 2 1 1 + + -   15/(7-(1+1))*3-(2+(1+1))



 / the colon indicates the beginning of a new definition
 / the first word after the colon is the name of the new
 / procedure and the semi colon ends

/ when defining a new procedure, it can consist of a
/ group of words. - can be things or actions

/ you can also use the same word in the definition of any
/ other world by putting its name in the definition

/ CR is a carriage return and line feed at terminal
/ which is a code the moves the cursor to the beginning
/ of the current line.
-------------------------------------------------------------
/ question 1:
: INFIX-NUM 0. bl word count >number 2drop drop ;
: INFIX-SUM INFIX-NUM + .( + ) ;
: INFIX-DIF INFIX-NUM - .( - ) ;
: INFIX-DIV INFIX-NUM / .( / ) ;
: INFIX-MUL INFIX-NUM * .( * ) ;


: check-op S"" S" +" COMPARE 0= IF MSG: "Strings are the same" ELSE MSG: "Strings are different" THEN DEPTH . ;

- (a)
15 INFIX-DIV 5 INFIX-DIF 2 .

: Q1A .( 15 ) 15 INFIX-DIV 5 .( 5 ) INFIX-DIF 2 .( 2 ) . ;

- (b)
5 INFIX-SUM 3 INFIX-DIF 2 INFIX-SUM 1 INFIX-DIFF 1 .

- (c)


------------------------------------------
-Lifo
- question 2

- (a)
: f 2dup + ;

5 6 f .
5 6 20 f .

- duplicates the first two numbers on the stack and sums them.

-(b)
-see stack animation

-(c)
-fibseq which uses f to print the first N fibonachi numbers, rot might be helpful
-1 and 1 are already on the stack


: f 2dup + ;
: fibseq 10 0 do CR f LOOP printStack ;
: printStack BEGIN depth ?dup WHILE 0< IF 0 ELSE . THEN REPEAT ;

-(d)
: placeone 1 CR 1 ;
: fibseq2 placeone 10 0 do CR f LOOP printStack ;
