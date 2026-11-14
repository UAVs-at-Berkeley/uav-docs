# Maintenance

Some content on the websites like leadership and onboarding information should be updated every year. Dependencies should also be kept up to date for security.

## [Main Website](https://github.com/UAVs-at-Berkeley/uav-web)

Generally, all modular editable content are stored as Markdown or JSON files in the `src/content` directory. Media files are stored in the `public` directory.

### Projects

Project pages use Markdown files in the `src/content/projects` directory. Their images are stored in `public/images/projects`. The Markdown renderer supports inline image and `iframe` embeds.

All Markdown files share a standard frontmatter format.

``` md title="example.md"
---
title: "Midair Hotswap"
date: Spring 2017
image: "/images/projects/midair-hotswap/main.jpg"
imageAlt: "Midair Hotswap display"
description: "Aerial battery swapping via a mothership drone"
tag: "Research"
---

...
```

### Leadership

Lead profiles are defined in `src/content/leadership.json`. Their images are stored in `public/images/leadership`.

``` json title="leadership.json"
{
  "members": [
    {
      "name": "John Lomax",
      "title": "President",
      "image": "/images/leadership/john.jpg"
    },
    ...
```

### Sponsors

Corporate sponsors are defined in `src/content/sponsor-logos.json`. Their images are stored in `public/images/sponsors`.

``` json title="sponsor-logos.json"
{
  "logos": [
    {
      "name": "Hargrave Technologies",
      "image": "/images/sponsors/hargrave-black.svg",
      "link": "https://hargravetechnologies.com/"
    },
    ...
```

Private donors are defined in `src/content/donors.json`.

``` json title="donors.json"
{
  "tiers": [
    {
      "tier": "Hexacopter Tier - $1,000+",
      "names": ["David Hooper and The Hooper Family", "Engineering Student Council - UC Berkeley"]
    },
    ...
```
