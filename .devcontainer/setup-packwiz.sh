#!/bin/sh
set -eu

if [ -x /usr/local/bin/packwiz ] && [ -f /usr/local/lib/packwiz.jar ]; then
  exit 0
fi

if command -v apt-get >/dev/null 2>&1; then
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y curl git-lfs
elif command -v apk >/dev/null 2>&1; then
  apk add --no-cache curl git-lfs
else
  echo 'No supported package manager found' >&2
  exit 1
fi

mkdir -p /usr/local/bin /usr/local/lib
curl -fsSL -o /usr/local/lib/packwiz.jar https://github.com/packwiz/packwiz/releases/latest/download/packwiz.jar
cat > /usr/local/bin/packwiz <<'EOF'
#!/bin/sh
exec java -jar /usr/local/lib/packwiz.jar "$@"
EOF
chmod +x /usr/local/bin/packwiz
git lfs install
