# Copilot Instructions for This Repository

## Purpose
This repository is used to create, organize, and maintain a personal Minecraft modpack while keeping upgrades safe across Minecraft versions. Packwiz is the tool used to manage the modpack contents, and the dev container is expected to provide the required tooling automatically.

## Session-start context
Read this file at the start of every session before making changes. Use it as the repo-specific context for how to work in this project.

## Repository expectations
- Treat this repo as a modpack management project, not as a general application codebase.
- Prefer changes that preserve compatibility with the current Minecraft setup and existing Packwiz-based workflow.
- Keep changes small, targeted, and easy to review.
- Use the dev container environment for Packwiz-related work whenever possible.

## Working conventions
- Inspect the existing repository files and structure before editing anything.
- Preserve formatting, naming, and existing conventions unless a change clearly requires updating them.
- When adding or updating mods, keep the change scoped and explain the reason for the update.
- If a task affects the modpack configuration, verify that the change fits the current repository workflow.

## Practical guidance
- Packwiz is the primary tool for managing modpack contents and versioning.
- If Packwiz is unavailable in the shell, check the dev container setup before assuming a tooling issue.
- Keep documentation such as the README accurate when the workflow or setup changes.
- If something is unclear, ask before making changes to packwiz manifests or mod-related files.