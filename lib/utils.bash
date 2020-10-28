#!/usr/bin/env bash

set -euo pipefail

fail() {
  echo -e "asdf-purty: $*"
  exit 1
}

curl_opts=(-fsSL)

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
  curl -s https://api.bintray.com/packages/joneshf/generic/purty |
    cat |
    sed 's/.*versions":\[//' |
    sed 's/\].*//' |
    sed 's/"//g' |
    tr ',' '\n'
}

download_release() {
  local version os filename url
  version="$1"
  filename="$2"

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    os="linux"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    os="osx"
  else
    fail "unrecognized operating system $OSTYPE"
  fi

  url="https://dl.bintray.com/joneshf/generic/purty-${version}-${os}.tar.gz"

  echo "* Downloading purty release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-purty supports release installs only"
  fi

  local release_file="$install_path/purty-$version.tar.gz"
  (
    mkdir -p "$install_path"
    download_release "$version" "$release_file"
    tar -xzf "$release_file" -C "$install_path" || fail "Could not extract $release_file"
    rm "$release_file"

    test -x "$install_path/purty" || fail "Expected $install_path/purty to be executable."

    mkdir "$install_path/bin"
    mv "$install_path/purty" "$install_path/bin"

    echo "purty $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error occurred while installing purty $version."
  )
}
