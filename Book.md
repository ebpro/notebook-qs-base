---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.5
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---


# A Book from Base

## Introduction

Il est aussi possible d'écrire des livres jupyter book donc à contenu dynamique avec une syntaxe étendue de markdown : <https://jupyterbook.org/en/stable/reference/cheatsheet.html>

## Blocs

Avec des citations :

> this is a nice book.v

```{epigraph}
Real cool book.

-- John Doe
```

A footnote[^mylabel]: My footnote text.

des blocs

```{note}
Here is a note (not working in slides).
```

```{warning} Avertissement
C'est un outil addictif.
```

+++ {"user_expressions": []}

## Tables

Des tables et figures plus avancées comme {numref}`t_ex-table-01` qui est un exemple de table avec référence. 

```{list-table} Table title
:name: t_ex-table-01
:header-rows: 1

* - Col1
  - Col2
* - Row1 under Col1
  - Row1 under Col2
* - Row2 under Col1
  - Row2 under Col2
```

+++ {"user_expressions": []}

## Math

Ou des Mathématiques 

soit en ligne dans le texte ($z=\sqrt{x^2+y^2}$).

mais avec des références dans les équations :

$$
a^2 + b^2 = c^2
$$(eqn:pyth)

Pythagore cf. {eq}`eqn:pyth`

+++ {"user_expressions": []}

mais aussi des environnements LaTeX comme `align`

\begin{align}
a_{11}& =b_{11}&
  a_{12}& =b_{12}\\
a_{21}& =b_{21}&
  a_{22}& =b_{22}+c_{22}
\end{align}

+++ {"user_expressions": []}

## Code

Il est possible de mettre du code dans le texte : 

en blocs :

```python
note = "Python"
print(node)
```

```java
String note = "Java";
System.out.println(node);
```

ou en ligne : {python}`for i in range(1,5)`

```{code-cell} ipython3
from myst_nb import glue
my_variable = "here is some text!"
sum=0
for i in range(1,10):
    sum+=i
glue("glued_text", my_variable)
glue("ss_sum", sum)
```

+++ {"user_expressions": []}

Here is an example of how to glue text: {glue:}`glued_text` and numbers : {glue:}`ss_sum`

+++ {"user_expressions": []}

```{uml}
Alice -> Bob: Hi!
Alice <- Bob: How are you?
```

```{code-cell} ipython3

```
