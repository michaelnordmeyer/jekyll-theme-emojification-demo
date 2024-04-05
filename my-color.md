---
title: The Result of my-color.scss
excerpt: The result of creating our own color
permalink: /my-color
sitemap: false
icon: 😎
theme_color: my-color
---
This page’s relevant frontmatter:

```yaml
theme_color: my-color
```

The contents of `assets/css/my-color.scss`

```scss
---
---
@import "black-white";

:root {
  --bg-color: hsl(330 100% 81%);
  --pre-bg-color: hsl(330 100% 76%);
}
```
