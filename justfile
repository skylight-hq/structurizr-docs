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

# README: This is here to support Shebang recipes across operating systems.
# https://just.systems/man/en/chapter_43.html

node_shebang := if os_family() == "windows" { " node" } else { "/usr/bin/env node" }

# NOTE: The recipe below named `_new` is **only** called from other Justfiles
# that create files from .template files found next to them. Currently it's
# used in `docs/guides`, `docs/runbooks`, and `docs/decisions`.

[private]
_new title type folder:
    #!{{ node_shebang }}
    const fs = require('node:fs');
    const path = require('node:path');

    const today = new Date().toISOString().split('T')[0];
    const title = "{{ title }}";
    const fileTitle = "{{ kebabcase(title) }}";

    console.info(`📝 Creating a new {{ type }} on ${today}`);

    console.info(`🔍 Found {{ type }} title: ${title}`);

    const runningFromDir = path.join("{{ replace(justfile_directory(), '\', '/') }}");
    const folderPath = '{{ folder }}';

    let fullWritePath;
    if (runningFromDir.endsWith(folderPath)) {
      fullWritePath = runningFromDir;
    } else {
      fullWritePath = path.join(runningFromDir, folderPath);
    }

    const isFile = fileName => {
      const re = /[0-9]{4}/g;
      return fs.lstatSync(fileName).isFile() && fileName.match(re);
    };

    console.info(`🔦 Checking for existing {{ type }}s in ${fullWritePath}`);

    const resolvedPath = path.resolve(fullWritePath);

    const template = fs.readFileSync(`${fullWritePath}/.template`)

    const files = fs.readdirSync(resolvedPath)
      .map(fileName => {
        return path.join(fullWritePath, fileName);
      })
      .filter(isFile);

    console.info(`🔍 Found ${(files.length + "").padStart(4, '0')} {{ type }}(s)`);

    const nextNumber = files.length + 1;
    const nextNumberString = (nextNumber + "").padStart(4, '0');

    console.info(`🖊️ Setting your new {{ type }} to #${nextNumberString}`);

    const nextFilePath = path.join(
        resolvedPath,
        `${nextNumberString}-${fileTitle}.md`
    );

    console.info(`📊 Attempting to save {{ type }} #${nextNumberString} to ${nextFilePath}`);

    const content = eval(`\`${template}\``);

    try {
      fs.writeFileSync(nextFilePath, content);
      console.log(`✅ Successfully created {{ type }} #${nextNumberString} for ${title} at ${nextFilePath}`);
    } catch (e) {
      console.error(`❌ ${e}`);
    }
