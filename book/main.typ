#import "rules.typ": book
#import "functions.typ": elements, repr, universe
#import "colors.typ": COLORS
#import "symbols.typ": SYMBOLS

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
  repr(
    w,
    h,
    data: (
      (1, 2, 0, 0, 0, 0, 0, 0, 0, 2),
      (2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      (0, 0, 0, 0, 4, 0, 0, 0, 0, 6),
      (6, 0, 0, 4, 3, 4, 0, 0, 6, 5),
      (0, 0, 0, 0, 4, 0, 0, 0, 0, 6),
      (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      (2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    ),
    symbols: (
      COLORS.white,
      COLORS.green,
      COLORS.pastel_green,
      COLORS.red,
      COLORS.pastel_red,
      COLORS.blue,
      COLORS.pastel_blue,
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
  elements((
    SYMBOLS.empty_square,
    SYMBOLS.car,
    SYMBOLS.stone,
    SYMBOLS.tree,
    SYMBOLS.cat,
  )),
  caption: [Un univers composé de 5 éléments différents : 0, 1, 2, 3 et 4,
    respectivement représentés par une cellule vide, une voiture, un rocher, un
    arbre et un chat.],
) <elements>

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

=== États d'un univers

Un _état_ correspond à une configuration à un instant $t$ de notre univers.
Mathématiquement, un état correspond à une matrice de dimensions $D$ pour
laquelle chaque élément correspond à un élément de $E$.

Afin de faciliter la représentation des états, ces derniers seront représentés
graphiquement sous forme d'une grille remplie de différents symboles plutôt que
sous la forme d'une matrice. Ainsi, l'état $e_a$ suivant, associé à l'ensemble
des éléments $E$ défini précédemment (voir @elements) peut être représenté de
manière beaucoup plus claire (voir @representation_exemple)

$
  e_a = mat(
    0, 2, 1, 3, 0, 0;
    0, 0, 1, 0, 4, 0;
    0, 3, 0, 2, 0, 0;
    1, 0, 0, 3, 4, 0;
    0, 2, 0, 0, 0, 0;
    2, 0, 3, 0, 0, 0;
  )
$

#figure(
  universe(
    symbols: (
      COLORS.white,
      SYMBOLS.car,
      SYMBOLS.stone,
      SYMBOLS.tree,
      SYMBOLS.cat,
    ),
    state: (
      (0, 2, 1, 3, 0, 0),
      (0, 0, 1, 0, 4, 0),
      (0, 3, 0, 2, 0, 0),
      (1, 0, 0, 3, 4, 0),
      (0, 2, 0, 0, 0, 0),
      (2, 0, 3, 0, 0, 0),
    ),
    grid_size: (6, 6),
  ),
  caption: [Représentation graphique de $e_a$],
) <representation_exemple> // TODO

==== Équivalences d'états

Plusieurs états, bien que différents si l'on compare la matrice qui leur est
associés peuvent être considérés comme équivalents. Cela est notamment dû à la
géométrie de l'univers ainsi qu'aux restrictions sur ses règles. Deux états
$e_a$ et $e_b$ sont notés équivalents ($e_a <=> e_b$) si et seulement si :

- Il est possible d'obtenir $e_b$ à partir de $e_a$ en appliquant une
  translation sur un ou plusieurs axes.
- ...
