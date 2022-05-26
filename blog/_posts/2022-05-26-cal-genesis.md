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
1 - + 2
=> -1
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
1 + 2  # + is the operator setting the rule called "add", and 1, 2 are the operands to be "added"
=> 3
1 - 2  # - is the operator setting the rule called "subtract", and the first operand 1 will be "subtracted" by the second operand 2
- 2  # for a single operand, - is also the operator to give its negative value
=> -2
sqrt 4  # sqrt is the operator to give the square root of its operand
=> 2.0
2 3  # space can also be an operator and it gives the product of its two operands
=> 6
[1,2,3]  # the pair of [] is the operator to make its operands (separated by ",") a list
=> [1, 2, 3]  # and the list value is written in the same format
[1, 2][1]  # if the first operand is a list, the following pair of [] is the operator to find its member with the index of the second operand
=> 1
2 in [1, 2]  # in is the operator and its operands are 2 and [1, 2]
=> true
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

And C called a good combination of symbols an *expression*. And C gives all expressions a value. And to find the value of an expression he called *evaluation*.

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

And C said, Let us print the values as we want: and it was so.

```
ret: print a
4.0
print ret  # the value of a print operation is none; none will not be shown after "=>"
none
print $"a={a}, b={b}, a+b={a+b}"
a=4.0, b=3.0
```

And C said, Let parentheses enclose the scope of a definition: and C saw that it was good.

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

And C said, It is not good to allow any symbol to be defined; I forbid the definition of symbols containing anything other than letters, underscores, or numbers, as well as those beginning with numbers: and it was so.

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

And C said, Let symbols be values as well; the value of an undefined symbol is the symbol itself: and C saw that it was good.

```
zzz
=> zzz
ZZZ + 1
=> zzz + 1
a: 1; ((a?; a); a)  # ? frees and returns the symbol in the current scope
=> [a, 1]
b: 2; c: 3; (d: a+b+c; {b,c}?; a? b c d)
# => (d: 6; {b,c}?; a? b c d)
# => (a? b? c? 6)
=> 5 a b c
```

And C said, Let scopes be values as well: and it was so.

```
(a:1; b:2; this)
=> {a: 1, b: 2}
x: {a: 1, b: 2}; [x.a, x.b]
=> [1, 2]
```

And C said, Let there be equations: and it was so.

```
x: 1
=> 1
exp x = 1
=> false
x?  # free x
=> x
exp x = 1
=> {x: 0}
exp x = -1
=> {x: π ı}
exp x = 0  # no solution
=> false
```

……

And C said, Let us find patterns in strings: and there was RegEx.

```
pattern: `[a-z]\d_\d+`;
pattern.match "a0_9"
=> .
```

