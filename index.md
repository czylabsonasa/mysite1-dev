@def title = "mysite1"

@def hasmath = true
@def hascode = true

\toc 

# WTF is it?
- it is a follow-up (???) of this [tutorial](https://www.youtube.com/watch?v=fVBiLEtZB7A)
- [doggo dot jl](https://www.youtube.com/@doggodotjl) has many interesting julia tutorials!


# Set up
- i'm using julia from a terminal and - for me - vscode is only for editing (too old to rock'n roll), so here i'm deviating from doggo's workflow
- the following approach is discussed [here](https://github.com/orgs/community/discussions/63631)
- create a `yourusername.github.io` repo on github and prepare for work on it locally
- start julia in the local `yourusername.github.io` directory
- activate a project
- add Franklin
- issue `newsite("mysite1"; template="sandbox")` and  `serve()`
- now you can browse the site on `localhost:8000`
- the actual site is inside the `mysite1/__site` directory, which is gitignored by default. It means, that you can create a repo named `mysite` on github with the content of this `__site` dir, and u can activate the github-pages on it...
- issue `publish(;prepath="mysite1")`, push it and browse `username.github.io/mysite1`


## Update title
- modify `@def title=...` at the top

## Update config.md file
- `@def author=...`
- `@def prepath=...` (it is "mysite1" here)
  - it can be set as a parameter to `publish`
- TOML syntax can be used within `+++ +++`


## Create a table of contents (optional)
- put `\toc` before the content of `index.md`

## Upload using Github Desktop
- no official Github Desktop on linux (there are some builds, however)
- the approach used here is described in the `Set up` part


# Examples

## How to enter text

### The standard Lorem Ipsum passage, used since the 1500s

"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

## How to render math equations

- this inline (enclosed by dollar-signs) math: for some triangles $a^2 + b^2 = c^2$
- and this is display (enclosed by double-dollar-signs):

$$
t_{i},f_{i},\ i=1\ldots n,\ \ F(t) = \sum_{k=1}^{m} x_{k}\varphi_{k}(t) \\
\sum_{i=1}^{n} \vert F(t_{i})-f_{i}\vert^2 \ \stackrel{x_{1},\ldots,x_{m}}{\to} \min\\
A=\left[ \varphi_{1}(t),\ldots,\varphi_{m}(t)\right]\ \ n\times m\ \text{matrix}\\
A^{T}A \text{ is a } m\times m \text{ non-negative definite matrix }\\
$$

$$
t_{i},f_{i},\ i=1\ldots n,\ \ F(t) = \sum_{k=1}^{m} x_{k}\varphi_{k}(t) \\
\sum_{i=1}^{n} \vert F(t_{i})-f_{i}\vert^2 \ \stackrel{x_{1},\ldots,x_{m}}{\to} \min\\
A=\left[ \varphi_{1}(t),\ldots,\varphi_{m}(t)\right]\ \ n\times m\ \text{matrix}\\
A^{T}A \text{ is a } m\times m \text{ non-negative definite matrix }\\
$$

- brute-force method to get rid the display-math auto numbering of katex:
```css
/* it is somwhere in the franklin.css file */
.katex-display::after {
  counter-increment: eqnum;
  /*content: "(" counter(eqnum) ")";*/
  content: "";
  position: relative;
  float: right;
  padding-right: 5px;
}
```

## How to insert julia code (with outputs!)

- this command will be executed:
```julia:./helloworld
println("hello world!")
```

- and this is the result:
\show{./helloworld}

- a slightly more time consuming (but silly) example:
```julia:./fib
function fib(n)
   n<2 && (return n)
   return fib(n-2)+fib(n-1)
end

for n in 37:42
   t=time()
   fn=fib(n)
   t=round(time()-t, digits=3)
   println("the $(n). Fibonacci is $(fn), computed in $(t)sec")
end
```

\show{./fib}

- if the script is untouched the previous result will be used (reported), which is good seeing the growing running times...


- another example about my machine:
```julia:./mysys
using InteractiveUtils
versioninfo()
```
\show{./mysys}


## How to insert a table from a CSV file
- include and show tables syntax:
```
\tableinput{}{./tableinput/population_by_year.csv}
```

- and the result is:
\tableinput{}{./tableinput/population_by_year.csv}

@@source

Source: Wikipedia
@@


## How to insert an image file

## How to insert clickable thumbnail to a Youtube video

## How to inject raw HTML



<!-- # Franklin syntax sandbox

This page is meant as a sandbox for Franklin Syntax so that you can quickly practice or experience things.

## Sandbox

Write whatever you want here to practice Franklin Syntax:

```julia:./ex1
using LinearAlgebra, Random
Random.seed!(135)
a, b = randn(50), randn(50)
println(dot(a, b))
println(sum(ai * bi for (ai, bi) ∈ zip(a, b)))
```

\output{./ex1}

(yet another example that floating point arithmetics can be complicated).

$$ \forall x \in \R:\quad \scal{x, x} \ge 0 $$

\newcommand{\E}{\mathbb E}

Surely some people remember the ordering, but I always forget:

$$ \varphi(\E[X]) \le \E[\varphi(X)] $$

for $\varphi$ convex. -->

