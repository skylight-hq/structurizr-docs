mod adr './docs/decisions'
mod structurizr './docs/.justfile'

set windows-shell := ['powershell.exe', '-NoLogo', '-Command']

# README: This file is used for automating tasks. Read more about `just` on
# their [documentaton site](https://just.systems/man/en/).

alias help := default

[private]
@default:
    just -l

[doc('Format justfiles in project using `git`, `grep`, and `just --fmt using `/bin/sh`')]
[unix]
@fmt:
    for file in $(git status --porcelain | grep '^M' | grep -o -E '[a-zA-Z_0-9\./]*justfile'); do if [[ -n $file ]]; then just --justfile=$file --fmt --unstable; fi; done

[doc('Format justfiles in project using `git`, `Select-String`, `ForEach-Object` using powershell.exe')]
[windows]
@fmt:
    (git status --porcelain | Select-String -Pattern '^M' -Raw | Select-String -Pattern '[\d\w/\.]*justfile').Matches.Value | ForEach-Object -Process { if ($_) { just.exe --justfile=$_ --fmt --unstable } }
