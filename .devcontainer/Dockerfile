# Microsoft's official Go dev container image already includes:
# - the Go toolchain (needed to build/install packwiz)
# - a non-root "vscode" user with sudo (works with the Workspace Trust bypass
#   and Docker Engine + docker-group setup described in the repo's README)
# Packwiz currently requires Go 1.23+, so we use a newer Go devcontainer base.
FROM mcr.microsoft.com/devcontainers/go:1-1.23-bookworm

# Install packwiz (a Go-based CLI tool) straight from source.
# --ldflags="-s -w" trims debug symbols for a smaller binary; harmless to drop if you prefer.
RUN go install github.com/packwiz/packwiz@latest

# `go install` puts the binary in $GOPATH/bin (usually ~/go/bin for the vscode user).
# Make sure that's on PATH for interactive shells.
ENV PATH="/home/vscode/go/bin:${PATH}"