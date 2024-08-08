[doc('Create a new ADR from a template')]
new title:
  #!/usr/bin/env node
  const fs = require('node:fs');
  const path = require('node:path');

  const today = new Date().toISOString().split('T')[0];

  console.info(`Creating a new ADR on ${today}`);

  // README: The title appears here from the args passed to just using the
  // curly braces.
  const title = "{{title}}"
                .replace(/[!@#\$%\^&\*\(\)\-\+=\\\|\}\{\[\];:\/\.,<>\s'"]+/ig, '-')
                .toLowerCase();

  console.info(`Found ADR title: {{title}}`);

  let fullWritePath;
  const runningFromDir = path.join("{{justfile_directory()}}");
  const folderPath = 'decisions';

  if (runningFromDir.endsWith(folderPath)) {
    fullWritePath = runningFromDir;
  } else {
    fullWritePath = path.join(runningFromDir, folderPath);
  }

  const isFile = fileName => {
    const re = /[0-9]{4}/g;
    return fs.lstatSync(fileName).isFile() && fileName.match(re);
  };

  console.info(`Checking for existing ADRs in ${fullWritePath}`);

  const files = fs.readdirSync(fullWritePath)
    .map(fileName => {
      return path.join(fullWritePath, fileName);
    })
    .filter(isFile);

  console.info(`Found ${files.length} ADR(s)`);

  const nextAdrNumber = files.length + 1;
  const nextAdrNumberString = (nextAdrNumber + "").padStart(4, '0');

  console.info(`Setting your new ADR to #${nextAdrNumberString}`);

  const nextAdrFilePath = path.join(fullWritePath, `${nextAdrNumberString}-${title}.md`);

  console.info(`Attempting to save ADR #${nextAdrNumberString} to ${nextAdrFilePath}`);

  // README: This is the ADR template now embedded in this Justfile
  const content = `# ${nextAdrNumber}. {{title}}

  Date: ${today}

  ## Status

  ${today} Proposed

  ## Context and Problem Statement

  Give context and background here around why the decision was necessary

  ## Decision Drivers

  What metrics or factors drove your decision?

  ## Considered Options

  What other options were considered, and what pros and cons exist around these decisions?

  ## Decision Outcome

  What decision did you go forward with, and how does it map to the above decision drivers?

  ## Appendix (OPTIONAL)

  Add any links here that are relevant for understanding your proposal or its background.
  `

  try {
    fs.writeFileSync(nextAdrFilePath, content);
    console.log(`Successfully created ADR #${nextAdrNumberString} for {{title}} at ${nextAdrFilePath}`);
  } catch (e) {
    console.error(e);
  }
