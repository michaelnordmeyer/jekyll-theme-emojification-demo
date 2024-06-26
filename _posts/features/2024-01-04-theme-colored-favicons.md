---
title: Theme-Colored Favicons
date: 2024-01-04 16:00 +0100
excerpt: There are favicons for each theme color.
categories: Features
tags: ["Cool Feature"]
permalink: /feature/theme-colored-favicons
icon: 🌟
theme_color: gold
---
Your browser should display a favicon in the color of the background, which applies to all pages of this site. This happens automatically, if they have been created when a [theme with a new background color was created](/manual/choosing-and-applying-colors).

Because a favicon is linked in the site’s feed, it has to be configured as well. It should reflect the homepage’s theme color. It is declared in the site’s `_config.yaml`. For this site it is:

```yaml
favicon: /assets/icons/yellowgreen.webp # optional, is used by the Atom feed
```

If you like to use other icons, you can easily [generate favicons from Unicode glyphs](https://michaelnordmeyer.com/generating-favicons-from-unicode-glyphs), if you are not afraid of the terminal.
