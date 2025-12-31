#!/usr/bin/env bash
set -euo pipefail

main() {
  HUGO_VERSION="0.153.4"
  export TZ="America/Toronto"

  echo "Installing Hugo ${HUGO_VERSION}..."

  HUGO_TARBALL="hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz"
  curl -L -o "$HUGO_TARBALL" "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_TARBALL}"

  tar -xzf "$HUGO_TARBALL"

  mkdir -p .bin
  mv hugo .bin/
  export PATH="$PWD/.bin:$PATH"

  rm -f LICENSE README.md "$HUGO_TARBALL"

  echo "Verifying installations..."
  command -v go >/dev/null && echo "Go: $(go version)" || echo "Go: not installed"
  echo "Hugo: $(hugo version)"
  echo "Node.js: $(node --version)"

  echo "Cloning themes repository..."
  git submodule update --init --recursive
  git config core.quotepath false

  echo "Building the website..."
  hugo --gc --minify
}

main "$@"