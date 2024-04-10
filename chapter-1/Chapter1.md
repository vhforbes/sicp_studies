Computation Processes are like begins that inhabit computers.

Process manipulate _data,_ people create programs, they are a pattern of rules that direct processes.

A computation process is like a spirit. It cannot be seen or touched, but it can affect the world in many powerful ways.

### Lisp

Is the language chosen by the author, he says is very powerful so we can see that _procedures_ in lisp can be represented and manipulated as Lisp _Data_.

This is important because there are powerful program-design techniques that rely on the ability to _blur_ the distinction between “passive” data and “active” process.

Is an **_applicative-order_** language. All arguments to scheme procedures are evaluated when the procedure is applied.

### 1.1 The Elements Of Programming

More than instructing a computer to complete tasks, a language is a framework where we can organize our ideas about processes.

- Primitive expressions, the simplest entities the language is concerned with.
- Means of combination, compound elements are build from simpler ones
- Means of abstraction, compound elements can be named and manipulated as units.

Expressions are interpreted by the _interpreter_ … They can be simple like `>>> 432`

or be combined with a _primitive_ procedure `>>> (+ 432 32)` evals to 464.

They can be nested with no limit.

The interpreter will always operate in the same basic cycle:

- reads the expression
- evaluate the expression
- print the result

This is known as REPL, Read Eval Print Loop.

Naming values is a important mean of abstraction where we

`(define x 3)` x will be 3.

The interpreter has a memory that is called the _environment_ and that keeps track of the name-object-pairs.

We must be able to isolate issues about thinking procedurally.

To evaluate combinations the interpreter is following a procedure:

1. Evaluate subexpression of the combination
2. Apply the procedure, that is the value of the leftmost subexpression (operator) to the arguments that are the values of the other subexpressions (the operands)

This is a recursive rules:

It includes as one of its steps the need to invoke the rule itself.

Example 1:

**`(+ 3 (* 2 4))`** the subexpressions are 3 and (\* 2 4), then in here it will need to **_evaluate_** the combination, that is inside the first combination.

It will do so by starting at 1 and going to 2.

This will only stop when all the subexpressions have been evaluated and the last procedure applied.

Example 2:

**`(* (+ 2 (* 4 6)) (+ 3 5 7))`**

```scss
                          (*)
                         /   \
                       (+)   (+)
                      /  \   /|\
                    2   (*) 3 5 7
                        / \
                       4   6
```

What we have so far that makes a powerful programming language:

- Numbers and arithmetic as primitive data and procedures
- Nesting of combinations provides a mean to combine operations
- Definitions provide a mean of abstraction

Now we learn procedure definitions. A much more powerful abstraction technique.

`(define (<name> <formal parameters>) <body>)`

We can call this procedures jut like we call primitive procedures.

One could not tell if this was defined or built into the interpreter like + and \* or defined as a compound procedure.

The **_substitution model_** is a way to think when we have compound procedures.

- To apply a compound procedure to arguments evaluate the body of the procedure with each formal parameter replaced by the corresponding argument.

This model of evaluating procedures and passing their result as arguments to the “father procedure” is a way to help us think about procedure application **NOT** a description of how the interpreter works.

**_Conditional expressions_** are a way to makes tests and perform different operations accordingly.

In the square root exercise we’ve seen that the problem can be divided into a number of subproblems.

Is important that each procedure that solve one of those problems have a identifiable task and can be used as a module for defining other procedures.

There’s no need to know the **_how_** the procedure computes the result or its implementation. We just need to know it works!

We can regard the procedure as a **_black box_** this is called procedural abstraction.

So when we define a procedure, it should be able to suppress detail. A user don’t need to know how it was implemented in order to use it!

Procedures to be actually a black box need to have their arguments names in the local scope of the procedure itself. The name of the arguments used by the one who implements should not matter to the user of that procedure.

In a procedure we have two types of variables:

- Bound variable ⇒ The ones passed as arguments. We can change them however we want as long as we change them inside the procedure.
- Free variable ⇒ If is not bound is free. (ex. < , abs , - ).

If we change a name of a bound variable to _abs_ for example, we would capture the meaning of it and introduce a bug.

The bond variables declaration inside a procedure is called **_scope._**

In the sqrt example, we have a bunch of auxiliary procedures define in the same scope as it.

What if it was a large program and somebody defined a procedure also called good-enough?.

So avoid this clashing, we can allow the procedure to have internal definitions.

Procedures defined inside the procedure itself.

Since X was defined in the sqrt-lexical procedure, the procedures insidealso have access to the x.
So we can make them FREE VARIABLES inside the definitions of the subprocedures. (see: lexical-scope.rkt)
