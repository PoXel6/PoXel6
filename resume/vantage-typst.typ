#let primary_colour = rgb("#000000")
#let link_colour = rgb("#12348e")
#set text(font: "Times New Roman")

#let icon(name, shift: 1.5pt) = {
  box(
    baseline: shift,
    height: 10pt,
    image("icons/" + name + ".svg")
  )
  h(3pt)
}

#let beautify(content, size: 20pt, vert: -10pt) = {
  set text(
    fill: white,
    weight: "medium",
    size
  )

  box(
    inset: 4pt,
    fill: primary_colour,
  )[
    #content
  ]
  v(vert)
}

#let make(name) = {
   link(name.link)[#icon(name.name) #name.display]
}

#let findMe(services) = {
  set text(11pt)
  let icon = icon.with(shift: 1pt)
  let email = services.at(0)
  let website = services.at(1)
  let github = services.at(2)
  let location = services.at(3)

  let left = [
    #v(10pt)
    #make(email)
    #v(10pt)
    #make(website)
  ]

  let right = [
    #v(10pt)
    #make(github)
    #v(10pt)
    #make(location)
  ]
  grid(
    columns: (14fr, 11fr),
    column-gutter: 25pt,
    left,
    right
  )
}

#let term(period, location) = {
  text(9pt)[#icon("calendar") #period #h(1fr) #icon("location") #location]
}

#let max_rating = 5
#let skill(name, rating) = {
  let done = false
  let i = 1

  name

  h(1fr)

  while (not done){
    let colour = rgb("#c0c0c0")
    let strokeColor = rgb("#c0c0c0")
    let radiusValue = (left: 0em, right: 0em)

    if (i <= rating){
      colour = primary_colour
      strokeColor = primary_colour
    }

    // Add rounded corners for the first and last boxes
    if (i == 1) {
      radiusValue = (left: 2em, right: 0em)  
    } else if (i == max_rating) {
      radiusValue = (left: 0em, right: 2em) 
    }

    box(rect(
      height: 0.3em, 
      width: 1.5em, 
      stroke: strokeColor,
      fill: colour,
      radius: radiusValue
    ))

    if (max_rating == i){
      done = true
    }

    i += 1
  }

  [\ ]
}


#let styled-link(dest, content) = emph(text(
    fill: link_colour,
    link(dest, content)
  ))

#let vantage(
  name: "",
  lastName: "",
  position: "",
  links: (),
  tagline: [],
  leftSide,
  rightSide
) = {
  set document(
    title: name + "'s CV",
    author: name,
  )
  set text(9.8pt, font: "Georgia")
  set page(
    margin: (x: 1.2cm, y: 1.2cm),
  )

  show heading.where(level: 1) : it => box(
    fill: black,
    inset: 10pt,
    text(
      fill: white,
      weight: "bold",
      36pt
    )[
      #{it.body}
    ]
  )

  show heading.where(
    level :2,
  ): it => {
    beautify(it.body, size: 16pt, vert: -10pt)
  }

//  show heading.where(
//    level: 2,
//  ): it => text(
//      fill: primary_colour,
//    [
//      #{it.body}
//      #v(-7pt)
//      #line(length: 100%, stroke: 0.5pt + primary_colour)
//    ]
//  )

  show heading.where(
    level: 3
  ): it => text(it.body)
  
  show heading.where(
    level: 4
  ): it => text(
    fill: primary_colour,
    it.body
  )

  grid(
    columns: (11fr, 13fr),
    column-gutter: 1em,
    box()[
      = #name
      #v(-17pt)
      = #lastName
      #v(-12pt)
      #text(16pt, weight: "medium",[#position])
      #v(12pt)
    ],
    findMe(links)
)

  v(10pt)

  grid(
    columns: (7fr, 4fr),
    column-gutter: 2em,
    leftSide,
    rightSide,
  )
}
