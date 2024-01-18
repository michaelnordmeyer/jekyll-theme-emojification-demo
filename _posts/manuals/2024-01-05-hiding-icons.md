---
date: 2024-01-05 20:00 +0100
excerpt: Hiding Icons is an option.
categories: Manuals
permalink: /manual/hiding-icons
hide_icon: true
hide_list_icon: true
theme_color: hotpink
---
# Hiding Icons

If an icon is not appropriate for a page, it can be hidden with `hide_icon: true` in the page's frontmatter.

This page’s relevant frontmatter:

```yaml
---
hide_icon: true
---
```

Without it and just `icon:` (= empty icon), the link above the title would still be present.

If the icon should also be hidden from lists, add `hide_list_icon` to the frontmatter:

```yaml
---
hide_list_icon: true
---
```
