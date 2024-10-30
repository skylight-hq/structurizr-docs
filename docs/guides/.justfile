set windows-shell := ['powershell.exe', '-NoLogo', '-Command']

alias help := default

[private]
@default:
    just --list

# @variable type
# @type string
# @description A string representing the singular name to use when outputting
# messages from the main _new recipe defined at the root `justfile`.

type := "guide"

# @variable folder
# @type string
# @description A string representing the file path relative to the root of the
# repository which contains the .template.md and where the files are being
# created.

folder := "docs/guides"

[doc('Create a new guide from the template found in docs/guides/.template')]
@new title:
    just --justfile {{ justfile() }} _new "{{ title }}" "{{ type }}" "{{ folder }}"