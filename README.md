# Structurizr Documentation Template

> [!TIP]
> This project leverages `just` as a command runner. To learn more about `just`
> view their documentation at: [https://just.systems/man/en]().

This project is a template for how Skylight projects can use Structurizr for
documentation within a single repository. Structurizr DSL provides a workspace
for C4 model data architecture which integrates documentation, decision records,
and diagrams in a single resource.

> [!IMPORTANT]
> If you're new to the [C4 model][docs-c4-model] for system architecture
> diagrams and/or [Structurizr DSL][docs-structurizr], please read through their
> documentation to get familiar with it.

[docs-c4-model]: https://c4model.com/#Abstractions "The homepage for the C4 model"
[docs-structurizr]: https://docs.structurizr.com/ "The homepage for Structurizr"

## Getting started

To get started, you can copy the `docs/` directory into a new project. This
directory includes the necessary files to use Structurizr Lite in the most
ergonomic way. The documentation found here is only a starting point and should
be modified as needed for your project's documentation.

## Writing Structurizr DSL

Structurizr DSL is based on the C4 model. A Structurizr workspace contains a
`model {}` and a `views {}` block. When writing in the DSL it helps to think of
your software components in the C4 data model as files in the `docs/`
directories. Conveniently, DSL blocks are already setup as directories with
`default.dsl` files.

### Using models 📁

This directory contains any number of subdirectories that make sense for the
architecture of what software systems you're trying to represent in C4. This
directory is also where you will include any documentation related to the
software system directories within an `md/` directory. With this, you can
include blocks of documentation within a software system very easily.

```dsl
!docs md
```

This will embed the Markdown in that directory to the system it is representing.
All documentation shows up by default but can be filtered. To make it easier to
read the Markdown outside of Structurizr, you can name the file `README.md` to
have it render automatically in a VCS system such as GitHub or Gitlab.

```
Name
├── docs
│  ├── models
│  │  ├── default.dsl
│  │  └── systemA
│  │     └── md
│  │        └── README.md
```

Due to the nature of how the models and views are separated into separate files,
relationships between elements in the C4 model should be added within the model
`.dsl` files and not in the main `workspace.dsl` file.

#### Decision records

When it comes to architecture decision records (ADRs), there should be a
`decisions/` directory at the root of the `docs/` directory. These ADRs must
follow the same format as the files created by `adr-tools`.

### Using views 📁

This directory contains any number of `.dsl` files which represent different
diagram outputs. The files in here should be limited to a single diagram output
but can also be organized in a single `default.dsl` file.

### Using styles 📁

This directory contains a `branding.dsl` and a `styles.dsl` file with the
branding and styling definitions along with directories of images such as icons
and logos.
