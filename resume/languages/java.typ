#import "../template.typ": resume

#set text(font: "Inter Display")
#set page(margin: 0.3cm)

#let projects = (
  "Snake Game",
  "Twitter Clone",
  "JLox",
  "Tic Tac Toe",
)

#let skills = (
  (
    name: "Backend",
    items: (
      "Spring Boot",
      "REST APIs",
      "HTTP",
      "SQL",
      "JPA / Hibernate",
      "Auth",
      "Microservices",
    ),
  ),

  (
    name: "Databases",
    items: (
      "PostgreSQL",
      "SQLite",
      "MySQL",
      "MariaDB",
      "MongoDB",
      "Redis",
    ),
  ),

  (
    name: "Testing",
    items: (
      "JUnit",
      "Mockito",
      "Integration Testing",
      "E2E Testing",
    ),
  ),

  (
    name: "Tools",
    items: (
      "Git",
      "GitHub",
      "Gradle",
      "Neovim",
      "IntelliJ IDEA",
    ),
  ),
)

#let technical_expertise = (
  "Java",
  "Kotlin",
  "OOP",
  "Clean Code",
  "Rest API",
)

#show: doc => resume(
  projects,
  skills,
  technical_expertise,
)
