---
title: Custom Error Pages
date: 2024-01-03 14:00 +0000
description: Custom error pages can have custom emoji and colors.
tags: ["Cool Feature"]
permalink: /feature/custom-error-pages
uuid: F05B8799-A6D5-4298-8C21-259E16C335CC
icon: 🎏
theme_color: gold
---
There are some default custom error pages, for HTTP errors like [403](/error/403), [404](/error/404), [410](/error/410), [418](/error/418), [429](/error/429), [451](/error/451), or [503](/error/503), which all can have custom emoji and colors. If no icon is set, the site’s default icon is used, like always. A great way to use humorous emoji.

The web server has to be configured to return those files for each error state, which a Jekyll theme cannot do. Managed hosting is not enough, self hosting will do the trick. On nginx, the following declared in the site’s server block will do the trick:

```nginx
error_page 403 /error/403.html;
error_page 404 /error/404.html;
error_page 410 /error/410.html;
error_page 418 /error/418.html;
error_page 429 /error/429.html;
error_page 451 /error/451.html;
error_page 503 /error/503.html;
```

By the way, my nginx server is configured to serve files without a subsequent slash or file extension:

```nginx
location / {
  try_files $uri $uri.html $uri/ =404;
}
```

The important part is the added `$uri.html` to serve e.g. the file `about.html` at address `example.com/about`.
