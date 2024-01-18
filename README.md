# Jekyll Theme Emojification Demo

A demo site for [Jekyll Theme Emojification](https://github.com/michaelnordmeyer/jekyll-theme-emojification), a simple and minimal single-author theme with configurable big emoji as the header link, and configurable background colors, which can be chosen for each post or page.

[Demo](https://jekyll-theme-emojification.michaelnordmeyer.com/)

## Additional Features

Some features cannot applied automatically due to how Jekyll integrates remote themes. They have to be copied manually.

- Category pages
- Custom error pages
- Automatic dark mode favicon
- An in-browser styled Atom feed through a feed XSLT, which is automatically applied by the `jekyll-feed` plugin. It educates people about feeds.
- An in-browser styled sitemap through a sitemap XSLT, which is automatically applied by the `jekyll-sitemap` plugin. Probably only the site owner might look at it every once in a while.
- Minimal build and load times

### Category Navigation Links

For categories to be properly linked, the site needs a `category` folder having separate markdown files for each category. E.g. for the category "Features" a file called `features.md` in the folder `category` with the following content:

```yaml
---
title: "Features"
excerpt: A description for the head's meta description tag created by this theme
permalink: /category/features
sitemap: false
layout: category
---
```

The title and permalink have to match the corresponding filename and category name.

Used categories have to be linked manually, because there is no menu.

### Favicons

`icon.webp` is the favicon for the light mode, and there's also a dark variant `icon-dark.webp` for dark mode. The icons are also used in embedding and SEO headers of pages. If the `jekyll-feed` plugin is used, the light version is embedded there as well.

### Styled Atom Feed and Sitemap

Both are included in the demo. For a standard Jekyll installation, they work out-of-the-box if the files, `feed.xslt.xml` and `sitemap.xsl`, are copied to the site’s Jekyll directory.

The XSLT files style the XML files. If a user selects the link to the feed, a styled version of the feed will be shown in the browser with an explainer of what web feeds are.

Because feeds are generated once, they can only support one icon. The light variant was chosen for the feed. `jekyll-feed` doesn’t support icons in feeds.
