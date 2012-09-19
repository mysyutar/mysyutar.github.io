---
layout: page
title: skhr-blog 
tagline: skhr-blogへようこそ！＞＜ 
---
{% include JB/setup %}

![森田さんは無口](./images/morita_024.4.jpg)

## Recent Entries

<ul class="posts">
  {% for post in site.posts %}
    <li>
      <span>{{ post.date | date_to_string }}</span>
      &raquo;
      <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
