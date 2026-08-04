#import "../template.typ": resume

#set text(font: "Inter Display")
#set page(margin: 0.3cm)

#let projects = (
  "CLox",
  "Web Server in Assembly",
  "NEWJ",
)

#let skills = (
  (
    name: "Systems Programming",
    items: (
      "Manual Memory Management",
      "Pointers",
      "Data Structures",
      "File I/O",
      "POSIX APIs",
      "Linux Syscalls",
    ),
  ),

  (
    name: "Performance",
    items: (
      "Performance Optimization",
      "CPU Profiling",
      "Cache-Aware Programming",
      "SIMD",
      "SSE",
      "AVX",
      "Benchmarking",
    ),
  ),

  (
    name: "Debugging",
    items: (
      "GDB",
      "Valgrind",
      "AddressSanitizer",
      "Memory Debugging",
      "Profiling",
    ),
  ),

  (
    name: "Build & Tooling",
    items: (
      "GCC",
      "Clang",
      "Make",
      "CMake",
      "Linux",
      "Neovim",
      "Emacs",
    ),
  ),
)

#let technical_expertise = (
  "C",
  "Assembly",
  "Rust",
  "GCC/Clang",
  "GDB/Gf2",
  "Make/CMake",
)

#show: doc => resume(projects, skills, technical_expertise)

