--- 
layout: post 
title: A Proof of Euler's Theorem for Polyhedrons using the Fundamental Theorem of Linear Algebra
ttags: [article] 
author: Cai 
---

<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

In this article I am going to prove Euler's theorem $F+V-E=2$
for any normal pokyhedron, where F denotes the number of faces 
of the polyhedron, V the number of vertices, E the number of
edges. The proof will utilize the fundamental theorem of linear 
algebra. The relationship that exists between these two theorems
I think is fascinating.

Let us consider a graph $G=(V,E)$. Let the number of vertices of
$G$ $|V|=n$, and the number of edges $|E|=m$. In order to introduce
the linear algebra, we would like to represent the graph as a matrix
(here our graph is not directed). Let us create an $m\times n$ matrix $M$,
each row representing an edge in $E$. For each row, each of its element 
represent a vertex in $V$. The edge corresponding to this row connects
2 elements; set them to 1 and other elements in this row
to 0. Thus we obtain a matrix $M$ which appropriately represents our graph 
$G$. 

Now, let's study the properties of matrix $M$. What is its rank? 
