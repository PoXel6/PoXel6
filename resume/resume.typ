#import "vantage-typst.typ": vantage, term, skill, styled-link
#set text(font: "Times New Roman")
#let configuration = yaml("configuration.yaml")
#let icon(name, shift: 1.5pt) = {
  box(
    baseline: shift,
    height: 10pt,
    image("icons/" + name + ".svg")
  )
  h(2pt)
}

#let text_size = 11pt

#vantage(
  name: configuration.contacts.name,
  lastName: configuration.contacts.lastName,

  position: configuration.position,
  links: (
    (name: "email", link: "mailto:"+ configuration.contacts.email, display: configuration.contacts.email),
    (name: "exp", link: configuration.contacts.exp.url, display: configuration.contacts.exp.displayText),
    (name: "github", link: configuration.contacts.github.url, display: configuration.contacts.github.displayText),
    (name: "location", link: "map.google.com", display: configuration.contacts.address)
  ),

  tagline: (configuration.tagline),

  [

    == About Me
    #configuration.tagline

    //== Experience

    //#for job in configuration.jobs [
      //=== #job.position \
      //_#link(job.company.link)[#job.company.name]_ - #styled-link(job.product.link)[#job.product.name] \
      //#term[#job.from --- #job.to][#job.location]

      //#for point in job.description [
        //- #point
      //]
    //]

    == Projects
    #for project in configuration.projects [
      #text(text_size)[
        === #project.name
      ]
      #v(-5pt)
      #icon("calendar") #project.from --- #project.to #h(1fr) #link(project.link)[#icon("github") Personal Project]

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
      === #if edu.place.link != "" [
        #link(edu.place.link)[#edu.place.name]\
      ] else [
        #edu.place.name\
      ]
      #v(-5pt)

      #edu.from - #edu.to #h(1fr) #icon("location") #edu.location
      #v(-5pt)

      #edu.degree in #edu.major
      #v(8pt)

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

    #for skill in configuration.skills [
      #set text(text_size)
      • #skill
    ]

    == Methodology
    #for method in configuration.methodology [
      #set text(text_size)
      • #method
    ]
    
    == Tools
    #for tool in configuration.tools [
      #set text(text_size)
      • #tool
    ]

    //== Achievements/Certifications

    //#for achievement in configuration.achievements [
      //=== #achievement.name
      //\
      //#achievement.description
    //]

  ]
)
