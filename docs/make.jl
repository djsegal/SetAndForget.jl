using Documenter, SetAndForget

makedocs(
  modules = [SetAndForget],
  format = :html,
  sitename = "SetAndForget.jl",
  pages = Any[
    "Home" => "index.md",
    "Code" => "code.md",
    "Glossary" => "glossary.md"
  ]
)

deploydocs(
  repo = "github.com/djsegal/SetAndForget.jl.git",
  target = "build",
  deps = nothing,
  make = nothing
)
