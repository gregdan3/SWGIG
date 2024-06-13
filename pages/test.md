---
title: secret test page!
date: 2024-06-12
author: you!
description: a secret test page for all formatting
image: /avatar.jpg
---

# Table of Contents

<!-- toc -->

- [Basic formatting](#basic-formatting)
- [Headings](#headings)
- [h1](#h1)
  - [h2](#h2)
    - [h3](#h3)
      - [h4](#h4)
        - [h5](#h5)
- [Tables](#tables)
- [Lists](#lists)
- [Blockquotes](#blockquotes)
- [Codeblocks](#codeblocks)
- [Images](#images)
- [Checklist](#checklist)
- [Footnote](#footnote)
- [Definitions](#definitions)
- [Misc missing or disabled syntax](#misc-missing-or-disabled-syntax)
- [Inline HTML](#inline-html)
  - [Spoilers](#spoilers)
- [Custom CSS](#custom-css)
  - [Info Blocks](#info-blocks)
  - [Blog](#blog)

<!-- tocstop -->

# Basic formatting

**bold text**

_italic text_

**_bold italic text_**

~~strikethrough text~~

`monospaced text`

[link](https://example.com)

[[./test.md|test link]]

---

# Headings

# h1

## h2

### h3

#### h4

##### h5

###### h6

# Tables

| Column1 | Column2 | Column3 |
| ------- | ------- | ------- |
| Item1.1 | Item2.1 | Item3.1 |
| Item1.2 | Item2.2 | Item3.2 |
| Item1.3 | Item2.3 | Item3.3 |
| Item1.4 | Item2.4 | Item3.4 |

|     center aligned     | left aligned  | right aligned | default alignment |
| :--------------------: | :------------ | ------------: | ----------------- |
|        Item1.1         | Item2.1       |       Item3.1 | Item4.1           |
| **_bold italic item_** | Item2.2       |       Item3.2 | `mono item`       |
|        Item1.3         | **bold item** |       Item3.3 | Item4.3           |
|        Item1.4         | Item2.4       |       Item3.4 | Item4.4           |

| Column1 | Column2 | Column3 | Column4 | Column5 |
| ------- | ------- | ------- | ------- | ------- |
| Item1.1 | Item2.1 | Item3.1 | Item4.1 | Item5.1 |
| Item1.2 | Item2.2 |         |         | Item5.2 |
| Item1.3 | Item2.3 | Item3.3 |         | Item5.3 |
|         | Item2.4 | Item3.4 | Item4.4 | Item5.4 |

---

# Lists

1. first
2. second
3. third

- first
- second
- third

1. first
   - first
   - second
   - third
2. second
3. third

- first
  - first
  - second
  - third
- second
  1. first
  2. second
  3. third
- third

---

# Blockquotes

> blockquote

> blockquote
>
> > with a blockquote

> blockquote
>
> > blockquote
> >
> > > blockquote
> > >
> > > > blockquote
> > > >
> > > > > blockquote

---

# Codeblocks

```
generic codeblock
```

```py
# python codeblock
def somefunc(a: int) -> int:
    return a + 5
```

---

# Images

![avatar of the site!](/avatar.jpg)

# Checklist

- [x] one
- [ ] two
- [ ] three

# Footnote

Sentence with a footnote [^1]

Sentence with a much longer footnote [^2]

Sentence with an inline footnote^[the inline content chills right here next to the sentence]

[^1]: footnote

[^2]: A much longer footnote which even has built in [support for random classes]{.example}

# Definitions

term
: definition

# Misc missing or disabled syntax

==Highlighted text==

Some statement needing context [@reference]

[@reference]: mu anpa

@gregdan3 says whatever.

@gregdan3 [p.69] says bruh.

~Subscript text~

^Superscript text^

:joy: emoji

> [!IMPORTANT]
> Important from github syntax!

something else

> [!CAUTION]
> Caution from github syntax!

# Inline HTML

## Spoilers

<details>
<summary>Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.</summary>

Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.

</details>

<details>
<summary>

> blockquote inside summary

</summary>

irrelevant details

</details>

<details>
<summary>

> blockquote nested inside summary multiple times
>
> > blockquote
> >
> > > blockquote
> > >
> > > > blockquote
> > > >
> > > > > blockquote

</summary>

irrelevant details

</details>

<details>
<summary>

blockquote inside details

</summary>

> blockquote inside details with Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat. Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.

</details>

# Custom CSS

## Info Blocks

::: info

Important things to know!

:::

::: warning

Potentially harmful or misleading info you are being warned against!

:::

::: error

Dangerous misunderstandings ahead! Exercise maximum caution!

:::

---

::: info

Some normal info!

> Blockquote inside normal info!

:::

::: warning

Some warning info!

> Blockquote inside warning info!

:::

::: error

Some error info!

> Blockquote inside error info!

:::

---

::: info

Some normal info!

<details>
<summary>Summary content inside info</summary>

Details content under summary inside info

</details>

:::

::: warning

Some warning info!

<details>
<summary>Summary content inside info</summary>

Details content under summary inside info

</details>

:::

::: error

Some error info!

<details>
<summary>Summary content inside info</summary>

Details content under summary inside info

</details>

:::

## Blog

::: blogentry
[[title of the blog](https://example.com)]{.bloglink} (blog date)

[some blog entry content]{.blogdetails}
:::
