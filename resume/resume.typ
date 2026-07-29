#let primary_colour = rgb("373239")
#let link_colour = rgb("#12348e")
// #set text(font: "Iosevka NFM")
#set text(font: "Inter Display")
#set page(margin: 0.3cm)
#let configuration = yaml("configuration.yaml")
#set document(
  title: "Amir Soofy Doost's CV",
  author: "Amir Soofy Doost",
)
#let email = "iampoxel6@gmail.com"
#let location = "Mashhad, Iran"
#let exp = "2+ years experience"
#let github = (
  url: "https://github.com/PoXel6",
  displayText: "github.com/poxel6",
)

#let icon(name, shift: 1.5pt) = {
  box(
    baseline: shift,
    height: 10pt,
    image("icons/" + name + ".svg"),
  )
  h(0pt)
}

#let gridit(array) = {
  set text(11pt)
  for arr in array {
    " •  " + arr
  }
}

#let make(services) = {
  let (email, website, github, location) = services
  let link = service => link(service.link)[
    #icon(service.name) #service.display
  ]
  v(10pt)
  set text(weight: 500)
  box(
    grid(
      columns: (14fr, 11fr),
      column-gutter: 25pt,
      [
        #link(email)

        #link(website)
      ],
      [
        #link(github)

        #link(location)
      ],
    ),
  )
}

#let findMe(services) = {
  set text(11pt)
  let icon = icon.with(shift: 1pt)
  make(services)
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
      colour = black
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

#let icon(name, shift: 1.5pt) = {
  box(
    baseline: shift,
    height: 10pt,
    image("icons/" + name + ".svg"),
  )
  h(2pt)
}


#show heading.where(level: 1): it => box(
  fill: black,
  inset: 10pt,
  text(
    fill: white,
    weight: "bold",
    36pt,
  )[ #it.body ],
)

#show heading.where(level: 2): it => {
  set text(fill: white, weight: "medium", 20pt)
  v(-5pt)
  box(
    inset: 5pt,
    fill: primary_colour,
  )[ #it.body ]
  v(-15pt)
}

#show heading.where(level: 3): it => box(text(
  14pt,
  fill: primary_colour,
  it.body,
))

#show heading.where(level: 4): it => text(it.body)


#grid(
  columns: (11fr, 13fr),
  column-gutter: 1em,

  box()[
    = Amir
    #v(-17pt)
    = Soofy Doost
    #v(-13pt)
    #text(16pt, weight: "medium")[
      Software Engineer
    ]
    #v(15pt)
  ],

  findMe((
    (name: "email", link: "mailto:" + email, display: email),
    (name: "exp", link: github.url, display: exp),
    (name: "github", link: github.url, display: github.displayText),
    (name: "location", link: "map.google.com", display: location),
  )),
)

#grid(
  columns: (7fr, 4fr),
  column-gutter: 2em,

  [
    == About Me
    Software engineer with 2 years of experience with a strong
    foundation in computer science, and a natural problem-solver.
    Proficient in Java, Kotlin, JavaScript/TypeScript, and Rust with a
    solid understanding of system architecture and design principles.

    == Projects
    #for project in configuration.projects [
      #text(11pt)[
        === #project.name
      ]
      #v(-5pt)
      #icon("calendar") #project.from --- #project.to #h(1fr)
      #link(project.link)[#icon("github") Personal Project]

      #v(-5pt)
      ==== Description:
      #project.description
      #v(-5pt)
      ==== Stack:
      #project.stack
      #v(0pt)
    ]

    == Education
    #for edu in configuration.education [
      #text(weight: 700)[#edu.place.name]
      #v(-8pt)
      #edu.from - #edu.to #h(1fr) #icon("location") #edu.location
      #v(-10pt)
      #edu.degree in #edu.major
      #v(0pt)
    ]

  ],
  [
    == Technical Expertise
    #for expertise in configuration.technical_expertise [
      #set text(14pt)
      #skill(expertise.name, expertise.level)
    ]

    #for (name, items) in configuration.skills [
      #v(0pt)
      == #name
      #v(-4pt)
      // #for (i, item) in items.enumerate() [
      //   #let space = 3pt
      //   #if (i == 0) [
      //     •  #text(size: 11pt)[#item] #h(space)
      //   ] else [
      //     #h(space) • #h(space) #text(size: 11pt)[#item] #h(space)
      //   ]
      // ]
      #grid(
        columns: (9fr, 11fr),
        column-gutter: 10pt,
        ..items.map(item => [
          • #text(size: 11pt)[#item]
          #v(5pt)
        ])
      )
    ]
  ],
)
