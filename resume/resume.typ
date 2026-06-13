#let primary_colour = rgb("#000001")
#let link_colour = rgb("#12348e")
#set text(font: "Libertinus Serif")
#let text_size = 11pt

#let icon(name, shift: 1.5pt) = {
  box(
    baseline: shift,
    height: 10pt,
    image("icons/" + name + ".svg"),
  )
  h(3pt)
}

#let gridit(array) = {
  set text(text_size)
  for arr in array {
    " •  " + arr
  }
}

#let make(name) = {
  v(10pt)
  link(name.link)[#icon(name.name) #name.display]
}

#let findMe(services) = {
  set text(11pt)
  let icon = icon.with(shift: 1pt)
  let email = services.at(0)
  let website = services.at(1)
  let github = services.at(2)
  let location = services.at(3)
  grid(
    columns: (14fr, 11fr),
    column-gutter: 25pt,
    [#make(email), #make(website)], [#make(github), #make(location)],
  )
}

#let max_rating = 5
#let skill(name, rating) = {
  let done = false
  let i = 1

  name

  h(1fr)

  while (not done) {
    let colour = rgb("#c0c0c0")
    let strokeColor = rgb("#c0c0c0")
    let radiusValue = (left: 0em, right: 0em)

    if (i <= rating) {
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
      radius: radiusValue,
    ))

    if (max_rating == i) {
      done = true
    }

    i += 1
  }

  [\ ]
}

#set text(font: "Times New Roman")
#let configuration = yaml("configuration.yaml")
#let icon(name, shift: 1.5pt) = {
  box(
    baseline: shift,
    height: 10pt,
    image("icons/" + name + ".svg"),
  )
  h(2pt)
}

#let vantage(
  name: "",
  lastName: "",
  position: "",
  links: (),
  tagline: [],
  leftSide,
  rightSide,
) = {
  set document(
    title: name + "'s CV",
    author: name,
  )
  set text(9.8pt, font: "Georgia")
  set page(
    margin: (x: 1.2cm, y: 1.2cm),
  )
  grid(
    columns: (11fr, 13fr),
    column-gutter: 1em,
    box()[
      = #name
      #v(-17pt)
      = #lastName
      #v(-12pt)
      #text(16pt, weight: "medium", [#position])
      #v(12pt)
    ],
    findMe(links),
  )

  v(10pt)

  grid(
    columns: (7fr, 4fr),
    column-gutter: 2em,
    leftSide, rightSide,
  )
}

#show heading.where(level: 1): it => box(
  fill: black,
  inset: 10pt,
  text(
    fill: white,
    weight: "bold",
    36pt,
  )[
    #{ it.body }
  ],
)

#show heading.where(
  level: 2,
): it => {
  set text(
    fill: white,
    weight: "medium",
    20pt,
  )

  box(
    inset: 4pt,
    fill: primary_colour,
  )[
    #it.body
  ]
  v(-10pt)
}

#show heading.where(
  level: 3,
): it => text(it.body)

#show heading.where(
  level: 4,
): it => text(
  fill: primary_colour,
  it.body,
)


#vantage(
  name: configuration.contacts.name,
  lastName: configuration.contacts.lastName,

  position: configuration.position,
  links: (
    (name: "email", link: "mailto:" + configuration.contacts.email, display: configuration.contacts.email),
    (name: "exp", link: configuration.contacts.exp.url, display: configuration.contacts.exp.displayText),
    (name: "github", link: configuration.contacts.github.url, display: configuration.contacts.github.displayText),
    (name: "location", link: "map.google.com", display: configuration.contacts.address),
  ),

  tagline: (configuration.tagline),

  [

    == About Me
    #configuration.tagline

    == Projects
    #for project in configuration.projects [
      #text(text_size)[
        === #project.name
      ]
      #v(-5pt)
      #icon("calendar") #project.from --- #project.to #h(1fr)
      #link(project.link)[#icon("github") Personal Project]

      #v(0pt)
      ==== Description:
      #project.description
      #v(0pt)
      ==== Tech Stack:
      #project.stack
      #v(8pt)
    ]

    == Objective
    #configuration.objective

    == Education

    #for edu in configuration.education [
      #text(weight: 700)[#edu.place.name]
      #v(-7pt)

      #edu.from - #edu.to #h(1fr) #icon("location") #edu.location
      #v(-7pt)

      #edu.degree in #edu.major
      #v(1pt)
    ]

  ],
  [
    == Technical Expertise
    #for expertise in configuration.technical_expertise [
      #set text(
        14pt,
      )
      #skill(expertise.name, expertise.level)
    ]

    == Skills
    #gridit(configuration.skills)

    == Frameworks
    #gridit(configuration.libs)

    == Tools
    #gridit(configuration.tools)
  ],
)
