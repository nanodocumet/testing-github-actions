#!/bin/bash -l

set -eo pipefail

echo $HUGO_VERSION

# Install Hugo
if [ -z "$HUGO_VERSION" ] || [ "latest" = "$HUGO_VERSION" ]; then
  # https://github.com/gohugoio/hugo/releases/tag/v0.137.0
  # Note that we have no longer build the deploy feature in the standard and extended archives. If you need that,
  # download archives with withdeploy in the filename.
  HUGO_VERSION=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | jq -r '.tag_name')
fi

# Removing the 'v' prefix if present
HUGO_VERSION="${HUGO_VERSION#v}"

echo $HUGO_VERSION
