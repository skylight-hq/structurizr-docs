set windows-shell := ['powershell.exe', '-NoLogo', '-Command']

# README: This file is used for automating tasks. Read more about `just` on
# their [documentaton site](https://just.systems/man/en/).

alias help := default

[private]
@default:
    just -l

mod adr './docs/decisions'
mod structurizr './docs/.justfile'
