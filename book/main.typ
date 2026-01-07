#import "rules.typ": book
#import "functions.typ": coord, elements, grid
#import "colors.typ": *

#show: book

= Déterminisme absolu

== Définitions

On appelle _univers_ le quadruplet $U = (D, E, R, e_0)$, où :

- $D$ correspond à ses dimensions.
- $E$ correspond à l'ensemble de ses éléments.
- $R$ correspond à l'ensemble de ses règles.
- $e_0$ correspond à son état initial.

=== Géométrie d'un univers

Un univers est une sphère de dimension $n_d$ (aussi appelée hypersphère),
composée de _cellules_ (voir @hypersphere). Chaque cellule est un hypercube, de
dimension $n_d$ également. Le nombre de cellules sur chaque dimension est donnée
par $D = (d_1, d_2, ..., d_(n_d)) in NN^(n_d)$, avec $d_i$ le nombre de cellules
sur la dimension $i$.

#figure(
  image("data/images/hypersphere.svg", width: 40%),
  caption: [Une sphère de dimension 2, décomposée en plusieurs cellules],
) <hypersphere>

De par le fait que l'univers soit une sphère de dimension $n_d$ et que les
cellules soient des hypercubes de dimension $n_d$, chaque cellule a forcément
$2n_d$ voisins, comme en témoigne @voisins.

Afin de rendre plus simple la visualisation et les explications au cours de ce
livre, je n'utiliserai que des univers de dimension 2 et je ne les représenterai
non pas comme des sphères mais comme des _grilles_. Il faut imaginer que ces
grilles sont la représentation à "plat" de l'hypersphère.

#let w = 10
#let h = 10
#figure(
  grid(
    w,
    h,
    colors: (
      green: ((0, 0),),
      pastel_green: ((0, 1), (1, 0), (-1, 0), (0, -1)),
      red: ((4, 5),),
      pastel_red: ((3, 5), (4, 4), (5, 5), (4, 6)),
      blue: ((9, 5),),
      pastel_blue: ((8, 5), (9, 4), (9, 6), (10, 5)),
    ),
  ),
  caption: [Un univers de dimensions $D = (#w, #h)$, sous forme de grille. Les
    cellules bleue, rouge et verte possèdent chacune $2n_d = 4$ voisins,
    affichés dans leur couleur respective, légèrement estompée.],
) <voisins>

==== Taille d'un univers

La _taille_ d'un univers correspond tout simplement à son nombre de cellules. La
taille d'un univers $U$ est notée $|U|$ et est égale à :

$ |U| = product_i^(n_d) d_i $

=== Éléments d'un univers

D'un point de vue mathématique, l'univers est composé d'un ensemble d'éléments,
chaque élément faisant partie de l'ensemble $E$, avec $E subset NN$. Chaque
cellule de l'univers correspond à l'un des éléments de $E$. Chaque élément
pourra se comporter de manière différente dans l'univers et pourra représenter
diverses choses (véhicule, entité, objet inerte, etc). Afin de rendre les
exemples et diagrammes plus simples à comprendre, j'utiliserai des couleurs /
symboles à la place d'un simple numéro pour représenter chacun de ces différents
éléments, avec une table de correspondance.

==== Diversité d'un univers

La _diversité_ d'un univers correspond tout simplement au nombre d'éléments
différents que l'on peut y rencontrer. La diversité d'un univers $U$ est notée
$d(U)$ et est égale à :

$ d(U) = |E| $

Il n'existe qu'une seule contrainte liée à la diversité d'un univers : il doit y
avoir au mimimum un élément disponible. Autrement dit, $E != nothing$ et
$d(U) gt 0$.

#figure(
  elements(("empty_square", "car", "stone", "tree", "cat")),
  caption: [Un univers composé de 5 éléments différents : 0, 1, 2, 3 et 4,
    respectivement représentés par une cellule vide, une voiture, un rocher, un
    arbre et un chat.],
)

*Remarque : * Puisque qu'il n'y a pas de limite sur le nombre maximal d'éléments
possibles, on peut imaginer un univers $U_1$ avec $d(U_1) > |U_1|$, ce qui
corresponderait à un univers dont la diversité est si importante qu'il est
impossible de représenter tous ses différents éléments au sein d'un même _état_
(voir chapitre sur les états).

==== Profondeur d'un univers

La _profondeur_ d'un univers correspond au nombre d'états distincts qu'il peut
représenter. La _profondeur_ d'un univers $U$ est notée $p(U)$ et est égale à :
$ p(U) = |U| times d(U) $

Comme le montre cette formule, la profondeur d'un univers est intrinsèquement
liée à sa diversité et à sa taille.
