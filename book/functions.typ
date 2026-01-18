#import "@preview/cetz:0.4.2": canvas, draw, tree

#import "colors.typ": COLORS
#import "symbols.typ": SYMBOLS

#let create_array(rows, cols) = {
  ((none,) * cols,) * rows
}

#let repr(w, h, data: (), symbols: ()) = {
  canvas(length: 0.6cm, {
    import draw: *

    grid(
      (0, 0),
      (w, h),
    )
    for (i, row) in data.enumerate() {
      for (j, idx) in row.enumerate() {
        let el = symbols.at(idx)
        if type(el) == color {
          rect((j, h - i - 1), (j + 1, h - i), fill: el)
        } else if type(el) == str {
          rect((j, h - i - 1), (j + 1, h - i))
          content((j + 0.5, h - i - 0.5), el)
        }
      }
    }
  })
}

#let get_repr_from_int(w, h, n, diversity, symbols) = {
  let data = create_array(w, h)
  for i in range(w) {
    for j in range(h) {
      data.at(i).at(j) = calc.rem(
        calc.div-euclid(n, calc.pow(diversity, (w - i - 1) * w + h - j - 1)),
        diversity,
      )
    }
  }

  repr(
    w,
    h,
    data: data,
    symbols: symbols,
  )
}

#let elements(symbols) = {
  let string_content = ""
  for (i, symbol) in symbols.enumerate() {
    if symbol == COLORS.white {
      symbol = SYMBOLS.empty_square
    }
    string_content += $#i arrow symbol$ + "\n"
  }
  set par(first-line-indent: (amount: 0em, all: true))

  context {
    let height = measure([string_content]).height

    canvas(length: height + 0.3cm, {
      import draw: *
      content((0, 0), (3.5, symbols.len() + 1), box(
        par(
          justify: false,
          leading: 0.3cm,
        )[$E :$\ #string_content],
        stroke: 1pt,
        width: 100%,
        height: 100%,
        inset: 1em,
      ))
    })
  }
}

#let universe(symbols: (), grid_size: (1, 1), state: ()) = {
  grid(
    columns: 2,
    align: horizon,
    gutter: 10pt,
    elements(symbols),
    repr(
      grid_size.at(0),
      grid_size.at(1),
      data: state,
      symbols: symbols,
    ),
  )
}

