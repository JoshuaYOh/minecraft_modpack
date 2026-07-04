# Minecraft Modpack

This repo is configured to use a Dev Container for Minecraft modpack development.

## Packwiz setup

The `.devcontainer/devcontainer.json` file installs Packwiz on container create/rebuild by downloading the latest `packwiz.jar` and creating a `/usr/local/bin/packwiz` wrapper.

### To use Packwiz

1. Open this workspace in the Dev Container.
2. Run `Dev Containers: Rebuild Container` in VS Code.
3. Verify installation:
   ```bash
   command -v packwiz
   packwiz --version
   ```

### If Packwiz is not found

- Make sure you are inside the Dev Container and not in the local host shell.
- Rebuild/reopen the container again.
- If needed, check `.devcontainer/devcontainer.json` for the install commands.
