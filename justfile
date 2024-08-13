set windows-shell := ['powershell.exe', '-NoLogo', '-Command']

# README: This file is used for automating tasks. Read more about `just` on
# their [documentaton site](https://just.systems/man/en/).

alias browser := lite
alias view := lite
alias start := lite

# Sets up the Structurizr Lite instance locally on port 8080. Runs in a detached state by default to free your terminal.
lite:
  docker run -it --rm -p 8080:8080 -v {{ invocation_directory_native() }}:/usr/local/structurizr structurizr/lite

# Exports diagrams in dot format (GraphViz) into a `diagrams/` directory.
diagrams-dot:
  docker run -it --rm -v {{ invocation_directory_native() }}:/usr/local/structurizr structurizr/cli export -workspace workspace.json -format dot -output diagrams

# Exports diagrams in puml format (C4 PlantUML) into a `diagrams/` directory.
diagrams-c4plantuml:
  docker run -it --rm -v {{ invocation_directory_native() }}:/usr/local/structurizr structurizr/cli export -workspace workspace.json -format plantuml/c4plantuml -output diagrams

# Exports diagrams in mmd format (Mermaid) into a `diagrams/` directory. This is useful for quickly including diagrams into GitHub-rendered Markdown.
diagrams-mermaid:
  docker run -it --rm -v {{ invocation_directory_native() }}:/usr/local/structurizr structurizr/cli export -workspace workspace.json -format mermaid -output diagrams

# Working with Architectural Decision Records
mod adr './docs/decisions'
