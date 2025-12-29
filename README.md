# angryguy

A Hugo-powered static website.

## Prerequisites

- Hugo v0.123.7 or later

## Installation

Hugo has been installed and configured in this repository. The site uses the [Terminal theme](https://github.com/panr/hugo-theme-terminal).

## Usage

### Local Development

To run the site locally:

```bash
hugo server -D
```

Then visit http://localhost:1313 in your browser.

### Building the Site

To build the static site:

```bash
hugo
```

The generated site will be in the `public/` directory.

## Project Structure

- `content/` - Site content (pages, posts, etc.)
- `themes/` - Hugo themes
- `static/` - Static assets (images, CSS, JS)
- `layouts/` - Custom layout templates
- `hugo.toml` - Hugo configuration

## Adding Content

Create a new post:

```bash
hugo new content posts/my-post.md
```

## License

See LICENSE file.