#!/usr/bin/env bash
main() {
    HUGO_VERSION="0.153.4"

    export TZ="America/Toronto"

    #Install Hugo
    echo "Installing Hugo ${HUGO_VERSION}..."
    curl -LJO https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
    tar -xf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar
    cp hugo /opt/buildhome
    rm LICENSE README.md hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz

    #Verify installation version
    echo "Verifying installations..."
    echo Go: "$(go version)"
    echo Hugo: "$(hugo version)"
    echo "Node.js: "$(node --version)"

    #Clone themes repository
    echo "Cloning themes repository..."
    git submodule update --init --recursive
    git config core.quotepath false

    #Building the website
    echo "Building the website..."
    hugo --gc --minify
    
}
set -euo pipefail
main "$@"
