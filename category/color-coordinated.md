---
title: "Color-Coordinated"
last_modified_at: 2024-01-01 13:00 +01:00
excerpt: "Category: Color-Coordinated"
sitemap: true
colorful_index: true
icon: 🏳️‍🌈
---
This category is called color-coordinated, because the color of the emoji fit the background color of the page.

If the ordinary post index is too boring, there’s also a crazy option. Put `colorful_index: true` in a page’s frontmatter, in this case the color-coordinated category page, and the index entries display the full expressiveness of their indexed posts or pages, which belong to this category.

This only works well for posts with backgrounds different from the page’s background, because of the added padding. The posts with default theme color have too much of it.

Also the special theme cases black, white, and grey don’t work well with the link styling of the page’s theme color.

Desktop or mobile screen sizes have a huge impact on the crazy view, which why it makes sense to remove some clutter. Here’s a [reduced version of this page](/category/the-important-bits).

## Configuration for Index Pages

Dates can be removed with `hide_dates: true` in the page’s frontmatter. I removed them here, because it doesn’t look good with the emoji in-between.

Additionally, the list emoji of the `colorful_index` can be removed with `hide_list_icon: true` in the page’s frontmatter.

The site-wide `show_excerpts` under the key `themesettings` can be overridden with `hide_excerpts: true` in the page’s frontmatter to allow for custom index pages tailored to the expressiveness of the listed posts or pages.
