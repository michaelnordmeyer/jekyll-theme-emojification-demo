---
title: Automatic Dark Mode Favicon
date: 2024-01-04 16:00 +0100
excerpt: There are favicons for light and dark mode, which switch automatically.
categories: Features
tags: ["Cool Feature"]
permalink: /feature/automatic-dark-mode-favicon
icon: 🌟
theme_color: gold
---
Depending on the users computer settings, a light or dark variant is used as a favicon (currently not support by Safari). It’s always the light version for feeds and SEO tags. They are declared in the site’s `_config.yaml` including the media type and can be replaced by the site owner.

This page’s relevant config:

```yaml
favicon: /icon.webp # optional, needs to be 180x180
favicon_dark: /icon-dark.webp # optional, needs to be 180x180
favicon_media_type: image/webp # mandatory, if favicon* is set
```

![Light Icon](/icon.webp "Light Favicon"){: loading="lazy"}

![Dark Icon](/icon-dark.webp "Dark Favicon"){: loading="lazy"}

If you like to use other icons, you can easily [generate favicons from Unicode glyphs](https://michaelnordmeyer.com/generating-favicons-from-unicode-glyphs), if you are not afraid of the terminal.

If you want to use the default, fetch them from the [demo repo](https://github.com/michaelnordmeyer/jekyll-theme-emojification-demo).
