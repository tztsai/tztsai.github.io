---
layout: post
title: The Genesis of Cal Language
categories: [project]
author: Cai
---

In the beginning C created values and symbols.

And values cannot be visible without written in symbols; and symbols are useless without corresponding to values.

```
1     # symbol
=> 1  # value
2
=> 2
3.14
=> 3.14
"abc"
=> "abc"
[]
=> []
+
=> +
^
=> ^
=
=> =
sqrt
=> sqrt
# Not all symbols are created equal – some are more special: anything after “#” is ignored in the world of Cal, and anything after “=>” is the value of the symbols you sent to Cal (still written in symbols).
```

And C said, Let there be combination: and there was combination.

```
1 + 2
=> 3
- (3 - 2)
=> -1
(2 ^ 3) - 1
=> 7
sqrt 4
=> 2.0
2 + 2 = 4
=> true
3 < 4 & 4 > 5
=> false
3 > 4 | 2 ^ 2 - 3
=> 1
[((1+2)*3)/2, [4-5]]
=> [4.5, [-1]]
[1, 3, 5] [2]
=> 3
sum [1, 3, 5]
=> 9
"abc" + "def"
=> "abcdef"
("abc" * 2) [2..-2]
=> "bcab"
```

And C saw the combinations, that some of them are bad: and C divided good combinations from the bad.

```
1 - / 2
!> SyntaxError: invalid syntax
1 - - 2
=> 3
.1
!> SyntaxError: invalid syntax
1 + 2)
!> SyntaxError: unmatched ')'
[1[2]-[3]]
!> TypeError: 'int' object is not subscriptable
[1, 2] 3
!> SyntaxError: invalid syntax
1 - 2 3
=> -5
# "!>" is another special symbol to notice that the following message is a warning or an error
```

And C said, the value of a combination of symbols seems a mystery, but they should not be; Let there be two rules: the first to rule *operation*, and the second to rule *precedence*: and it was so.

And C said, an *operation* is a combination of a single *operator* and one or more *operands*; the operator sets the rule to find the value of this combination, and the rule is applied on the operands: and C saw that it was good.

```
1 + 2  # + is an infix operator setting the rule called "add", and 1, 2 are the operands to be "added"
=> 3
1 - 2  # - is an infix operator setting the rule called "subtract", and its left operand 1 will be "subtracted" by its right operand 2
- 2  # - can also be a prefix operator to give its negative value
=> -2
[1, *[2, 3]]  # * can also be a prefix operator that "unpacks" items of a list into its surrounding list
=> [1, 2, 3]
sqrt 4  # sqrt is a prefix operator to give the square root of its operand
=> 2.0
2 3  # space can also be an infix operator and it gives the product of its two operands
=> 6
[1,2,3]  # the pair of [] is an operator to make its operands (separated by ",") a list
=> [1, 2, 3]  # and the list value is written in the same format
[1, 2].1  # if the first operand is a list, '.' is an infix operator to index it with its right operand
=> 1
1~3  # ~ is an infix operator that gives a range from its left to its right
=> 1~3
2 in 1~3  # 'in' is an infix operator to tell whether its left is in its right
=> true
list 1~3  # list is an operator that iterates over its operand and lists the items
=> [1, 2, 3]
[[] = [], [] is []]  # = tells whether two values are equal, while 'is' tells whether they are identical
=> [true, false]
```

```
# more about list and range
[1, 2].0  # indexing begins from 1
!> IndexError: list index out of range
[[1, 2], [3, 4]].2.[2,1]  # index can be a list
=> [4, 3]
"abcd".2~3  # 2~3 is a range
=> "bc"
"abcd".-1^^-2~1
# ^^ gives a generator beginning with its left operand with a step of its right operand
# if its left operand is a generator, ~ gives a range stopping at its right operand
=> "db"
"abcd".-1-~2  # a-~b is a short hand of a^^-1~b
=> "dcb"
list "a"~"d"
=> ["a", "b", "c", "d"]
next 1~100
=> 1
1~100 take 4
=> [1, 2, 3, 4]
```

And C said, *precedence* is the order to apply the operations; to allow any operation to have the highest precedence, C made the *parentheses* also.

```
6 / 3 + 4 * 2 ^ 3  # follows alrithmetic precedence
=> 34
2 * "abc" [1]  # "indexing" has a very high precedence
=> "aa"
("abc" + "def")[1]  # but parentheses "()" always give the highest precedence 
=> "a"
factorial 3 ^ 2  # almost all operators written in letters have the same high precedence
=> 36
```

And C called a good combination of symbols an *expression*. And C gave all expressions a value. And to find the value of an expression he called *evaluation*.

And C said, Let us define symbols by our expressions: and it was so.

```
a: 9 - 3
=> 6
b: a / 2
=> 3.0
a: b + 1
=> 4.0
a + b
=> 7.0
```

And C said, Let us name the nameless, although the named nameless is no longer itself: and none was named.

```
none  # none is named "none"
# none is shown for its value

# an empty expression has the value none
3;
# still an empty expression in the end
```

And C said, Let us print the values as we want: and it was so.

```
print a
4.0
# the value of a print operation is none
print $"a={a}, b={b}, a+b={a+b}"
a=4.0, b=3.0
```

And C said, Let parentheses enclose the context of a definition: and C saw that it was good.

```
(a: 2) + (b: a)
=> 6.0  # 2 + 4.0
print [a, b]
[4.0, 3.0]
```

And C separated several expressions by semicolons, and allowed them to be evaluated in order: and it was so.

```
a: 3; a + b
=> 6.0
(a: 1; b: 2; a + b)
=> 3
(a: 3; b: a + 1; (a: 5; a + b))
# => (a: 3; b: 4; (a: 5; a + b))
# => (a: 5; a + 4)
=> 9
```

And C said, It is not good to allow any arbitrary symbol to be defined; I forbid the definition of symbols containing anything other than letters, underscores, or numbers, as well as those beginning with numbers: and it was so.

```
a+3: 4
!> SyntaxError: cannot define 'a+3'
2a: 6
!> SyntaxError: cannot define '2a'
```

And C called the remaining symbols *names*; and C told the users, saying, Of every name in Cal thou mayest freely define:

But of the special names that I have protected, thou shalt not fiddle with them: for otherwise thou definest thereof thou shalt surely mess up.

```
in: 3
!> SyntaxError: invalid syntax
for: 2
!> SyntaxError: invalid syntax
```

And C said, Let symbols be values as well; the value of an undefined name is the its own symbol, and the value of an expression containing undefined names is the expression itself: and C saw that it was good.

```
z
=> z
2 (z + 1)
=> 2 (z + 1)  # its value is a symbolic expression
```

And C called it “free” if a symbol is undefined; and C said, Let free symbols be created as you want: and it was so.

```
a: 1; [$a, a]  # $ makes a free symbol, no matter whether the name has been defined
=> [a, 1]
# ? frees and returns the symbol in the current context
x: 1; y: 2; [x, y, (x+2y)?]  # ? after an expression frees all names in it
=> [1, 2, x + 2 y]
b: 2; c: 3; (d: a+b+c; [a,b,c]?; a b c d)
# => (d: 6; [a?,b?,c?]; a b c d)
=> 6 a b c
```

And C said, Let contexts be values as well: and it was so. And the defined names in a context he called *attributes*.

```
(a:1; b:2; this)  # "this" is another special name whose value is the current context
=> (a: 1, b: 2)  # a context is simply written in this way
x: (a: 1, b: 2); [x.a, x.b]  # access of attributes in a context
=> [1, 2]
x.a: 3; x.c: 4; x  # define an attribute
=> (a: 3, b: 2, c: 4)
(a * b + c)? x  # the space before x is the operator that substitutes free symbols in the expression before it with their values defined in the following context
# => (a * b + c)? (a: 3, b: 2, c: 4)
=> 10
f: [a-b, a*b]?;
f (a: 2, b: 4)
=> [-2, 8]
```

And C said, I allow you to make your own operations: and C saw that it was good.

```
x -> 2x + 1
=> x -> 2x + 1
(x -> 2x + 1) 2
=> 5
f: x -> 2x + 1; f 1
=> 3
g x: f (2x)  # another way to define an operation
=> x -> f (2 x)
g 4
# => f 8
=> 17
g map [1, 2, 3]  # the "map" operator maps an operation to the values in a list
=> [5, 9, 13]
[1, 2, 3].map g
=> [5, 9, 13]
h: f compose g;
h 2
# => f (g 2)
# => f 9
=> 19
g [a, b]: a + 2b;
g [1, 2]
=> 5
g [a, *b]: [a, b];
g [1, 2, 3]
# since [a, *b] = [1, 2, 3], a = 1 and b = [2, 3]
=> [1, [2, 3]]
x dot y: sum (([a, b] -> a * b) map (x zip y));
# [1, 2] zip [3, 4] = [[1, 3], [2, 4]]
[1, 2] dot [3, 4]
=> 11

# experimental:
# f (a: 1, b: 2): a + b
# f (a: 2, b: 5)
# => 7
# f (b: 1)
# => 2
```

And C said, I allow you to equate two expressions and find the answer: and C saw that it was good.

```
x: 1
=> 1
exp x = 1
=> false
x?  # free x
=> x
exp x = 1
=> (x: 0)
exp x = 0  # no solution
=> false
[a+b, a-2b] = [3, 0]
=> (a: 2, b: 1)
```

And C said, Let there be sets: and there were sets.

```
s: {1, 2, 3}
=> {1, 2, 3}
1 in s
=> true
x <: Natural  # this declares that x is in the set of natural numbers
=> x <: Natural
2 x = 3
=> false
y <: Real;
y ^ 2 = 4
=> y <: {2, -2}
y <: Integer - Natural;  # negative integers
y ^ 2 = 4
=> (y: -2)
z ^ 2 = -1  # an undefined symbol, by default, is in the set of complex numbers
=> z <: {exp ((k + 1/2) π i) : k <: Integer}

# what is the answer of [x^2 + y - 3, 2x + y] = [0, 0] ?
```

And C said, I teach you *comprehensions* of lists and sets: Behold.

```
[x: x=4]
=> [4]
[x+1 : x in [1, 2, 3]]
=> [2, 3, 4]
[x y : x in [1, 2, 3, 4], y = 5 - x, x % 2 = 0]
# => [x y : x in [2, 4], y = 5 - x]
=> [6, 4]
{[x, y]: [x, y] in Integer ^ 2, x^2 + y^2 <= 1}
=> {[0, 0], [1, 0], [-1, 0], [0, 1], [0, -1]}
```

And C said, you should differentiate between *countable* and *uncountable* sets: Behold.

```
g: $[x : x in Rational, x notIn Integer];  # $[] makes a generator
next g  # every countable set has a method to enumerate its elements
=> 1/2
next g
=> -1/2
g next 6  # list the next 6 elements in g
=> [1/3, -1/3, 3/2, -3/2, 2/3, -2/3]
g: $[x : x in Real, x notIn Integer];
!> UncountableRange: the range of 'x' 
```

……

And C said, Let us find patterns in strings: and there was RegEx.

```
pattern: `[a-z]\d_\d+`;
pattern.match "a0_9"
=> .
```

