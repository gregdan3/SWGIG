# SWGIG

Static Website Generator I Guess, a static website generator of questionable veracity and dubious tooling

## Why?

I just wanna write Markdown files for my site. The little bit of tooling around them to make it more convenient and readable is that much better!

## Build

To build the site, `make` / `make all`. Most of the work can be done in parallel with `make -j`.

The makefile has a `dev` target which starts a Docker container, forwarding an Apache webserver from its port `80` to your host's port `8080`. This means you access the site at <localhost:8080/>.

## Setup

Here's everything to fix:

`git grep -n "TODO" | sed 's/README.md.*//g' | awk 'NF'`

```
pages/index.md:2:title: TODO
static/LICENSE.txt:1:TODO: Your license here for your creative content.
static/humans.txt:2:    TODO
static/style.css:1:/* TODO: This is my own CSS. You may want to do some thing else! */
templates/blog_header.md:2:title: TODO's Blog
templates/default.html:12:    <meta property="og:title" content="TODO - $pagetitle$" />
templates/default.html:15:    <meta property="og:url" content="https:/TODO/$directory$" />
templates/default.html:19:    <meta property="og:site_name" content="TODO" />
templates/default.html:21:    <meta property="og:description" content="TODO" />
templates/default.html:23:    <title>TODO - $pagetitle$</title>
templates/default.html:24:    <link href="TODO" rel="canonical" />
templates/default.html:36:      <h2><a href="/">TODO</a></h2>
```

Also, the `avatar.jpg` and `favicon.ico` say TODO. You may re-design to remove the avatar, though.

## Customizing

[Everything you'd do with a Markdown file](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) can still be done. Here's the extras:

#### Necessary information

- Add a new page by creating a markdown file under the `pages` dir.
- Add a new directory by making that directory under the `pages` directory. Note that the directory must be populated with at least one markdown file.
- Adding an `index.md` to a directory creates a link to that directory: `/dir/`
  - `mkdir -p pages/art && touch pages/art/index.md pages/art/other.md` will link `/art/ and /art/other.html`
- Every markdown file needs a frontmatter of the following form at the top of the file:

```yml
---
title: My Title
author: My Name
date: 2023-03-07
---
```

Note `title` is needed for all files; `date` is also required for blog posts.

#### Extra Syntax

These two are from `pandoc`:

You can add `<div>` (multiline) with a class with the following syntax:

```md
::: classname

My content

:::
```

You can add `<span>` (inline) with a class with the following syntax:

```md
[My content]{.classname}
```

#### Extra Frontmatter

You can add extra css, an open graph image which will appear on the page in the header, and an open graph description with any of these frontmatter tags:

```yml
---
extracss: /gallery/style.css
image: /buttons/discord-pixelized.png
description: "A gallery of fanart I've received."
---
```

You can add extra functionality to the frontmatter by checking for the variables you specify in `templates/default.html`.

#### Special strings

Any file may have a table of contents by adding the line `<!-- toc -->`. On build, `markdown-toc-redux` will replace that with a generated table of contents based on the file's headings.

Blog posts with a line of text then `<!-- preamble -->` between the frontmatter and content, will have that line appear on the blog below the entry.

#### Other notes

- You may link to other files with `.md`, thanks to the [lua filter](./pandoc/filters.lua).
  - Github Pages's router lets you omit the `.html`, but the dev server will not.

## Deployment

See [the github workflow](./.github/main.yml). It'll happen automatically when you push.

## Tools

- [Make](https://www.gnu.org/software/make/) <!-- this is so foundational that it's hard to even bother mentioning it -->
- [Pandoc](https://pandoc.org/), markdown to HTML
- [markdown-toc-redux](https://github.com/gregdan3/markdown-toc-redux/), make tables of contents
- [minify](https://www.npmjs.com/package/minify), to deliver tinier HTML
- [bash](https://www.gnu.org/software/bash/) for a some scripts to generate certain pages
- [python](https://www.python.org/) for dev

## Other thoughts

If you really want a static website generator you know all the ins and outs of, pick some tools off the shelf and build one. `make` is your friend. If you just want it to work, slap together [Sveltekit](https://kit.svelte.dev/) or [Astro](https://astro.build/) with [MDsveX](https://github.com/pngwn/MDsveX/) or [mdx](https://github.com/withastro/astro/tree/main/packages/integrations/mdx), respectively, and you're set.
