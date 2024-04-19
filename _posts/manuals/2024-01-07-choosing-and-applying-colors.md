---
title: Choosing and Applying Colors
date: 2024-01-07 22:00 +0100
excerpt: Only named colors and hex codes are supported
categories: Manuals
permalink: /manual/choosing-and-applying-colors
icon: 🎨
theme_color: hotpink
---
Applying different a different color is very simple. Just add `theme_color: hotpink` to the page’s frontmatter.

This page’s relevant frontmatter:

```yaml
---
theme_color: hotpink
---
```

Or the whole site can have the same color declared in the site’s `_config.yml`.

This site’s relevant config:

```yaml
theme_settings:
  theme_color: yellowgreen
```

But for this to work, the colors have to be defined beforehand. This theme has a couple defined, and they can be extended pretty easily.

This page’s `hotpink.scss`:

```scss
---
---
@import "black-white";

:root {
  --bg-color: hsl(330 100% 71%);
  --pre-bg-color: hsl(330 100% 66%);
}
```

For a style with saturated colors, only `--bg-color` and `--pre-bg-color` have to be changed.

For the `--pre-bg-color` color I mostly choose a 5 percentage points lower or higher luminance than the `--bg-color`. That’s the second percentage of this `HSL` color. [Mozilla’s color picker](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Colors/Color_picker_tool) to the rescue.

## Create Your Own

To have a defined color in frontmatter's `theme_color` or `_config.yml`’s `theme_color` be applied, a SCSS file has to exist in `assets/css`. The files in `_sass` don’t need to be changed. Both are located in the theme itself, and not the demo you are using now.

### Named Colors

For named colors like “hotpink“, the file has to be named `hotpink.scss`. Create a folder called `assets` in your site’s root folder, and a subfolder called `css`. In there create a file called `my-color.scss` for example. Change the hotpink’s `71%` to `81%` and the `66%` to`76%`. You can [see the result for my-color here](/my-color).

### Hex Colors

For hex codes like `#c34cff`, the file has to be named `c34cff.scss` *without* the preceding hash. That’s because Jekyll excludes file starting with a hash from its build process. And because file names can be case-sensitive, the code should always be lower-case.

But in frontmatter, the color has to be declared with the hash and in quotes, like `theme_color: "#c34cff"`.

Other ways of expressing HMTL colors are not supported, because the file naming and application in a page’s meta tags becomes cumbersome.

### Favicons

[Favicons should reflect the theme color](/feature/theme-colored-favicons).
