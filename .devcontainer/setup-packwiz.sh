#!/bin/sh
set -eu

if [ -x /usr/local/bin/packwiz ] && /usr/local/bin/packwiz --version >/dev/null 2>&1; then
  exit 0
fi

if command -v sudo >/dev/null 2>&1; then
  SUDO="sudo"
elif [ "$(id -u)" -eq 0 ]; then
  SUDO=""
else
  echo 'sudo is required to install dependencies' >&2
  exit 1
fi

if command -v apt-get >/dev/null 2>&1; then
  export DEBIAN_FRONTEND=noninteractive
  if ! command -v curl >/dev/null 2>&1 || ! command -v git-lfs >/dev/null 2>&1; then
    $SUDO apt-get update -o Acquire::AllowInsecureRepositories=true -o Acquire::AllowDowngradeToInsecureRepositories=true || true
    $SUDO apt-get install -y curl git-lfs
  fi
elif command -v apk >/dev/null 2>&1; then
  $SUDO apk add --no-cache curl git-lfs
else
  echo 'No supported package manager found' >&2
  exit 1
fi

mkdir -p /usr/local/bin

if [ ! -x /usr/local/go/bin/go ]; then
  tmpdir=$(mktemp -d)
  trap 'rm -rf "$tmpdir"' EXIT HUP INT TERM
  curl -fsSL -o "$tmpdir/go.tar.gz" https://go.dev/dl/go1.25.11.linux-amd64.tar.gz
  $SUDO rm -rf /usr/local/go
  $SUDO tar -C /usr/local -xzf "$tmpdir/go.tar.gz"
fi

export PATH=/usr/local/go/bin:$PATH
if ! command -v go >/dev/null 2>&1; then
  echo 'Go is not available after installation' >&2
  exit 1
fi

$SUDO env PATH="/usr/local/go/bin:$PATH" GOBIN=/usr/local/bin go install github.com/packwiz/packwiz@latest
$SUDO chmod +x /usr/local/bin/packwiz

git lfs install
