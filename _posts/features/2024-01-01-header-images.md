---
title: Header Images
date: 2024-01-01 13:00 +0100
description: Optional header images with `alt` and `title` attributes.
image:
  path: /images/2011/lanterns.webp
  alt: Paper lanterns in Kyoto at night
  title: Paper lanterns in Kyoto at night
category: Features
permalink: /feature/header-images
uuid: 4199C296-DAEC-4F15-9BBE-2AF80F66CB96
icon: 🏞️
theme_color: gold
---
The header image is the hero. But because we use emoji as a major design element, which is located above the title, the hero image has to go below. Not perfect.

In this theme it could have been a normal image at the beginning of a post, but the header image is also used for feeds and in SEO tags for richer embeds.

`alt` and `title` attributes are taken into account if they are set in the frontmatter.

This page’s relevant frontmatter:

```yaml
---
image:
  path: /images/2011/lanterns.webp
  alt: Paper lanterns in Kyoto at night
  title: Paper lanterns in Kyoto at night
---
```
