# homebrew-claude-i

Homebrew tap for [claude-i](https://github.com/rafaelscosta/claude-i) — like `claude -p`, driven through an interactive Claude Code session.

## Status: PENDING UPSTREAM PUBLICATION

The `claude-i` repository (https://github.com/rafaelscosta/claude-i) is currently **PRIVATE**.
The Homebrew formula in [`Formula/claude-i.rb`](Formula/) references a dev-pass URL pointing at the `v0.2.0-pre` GitHub pre-release. It requires upstream PyPI publication (or a Homebrew-readable public source URL) before `brew install` will work for strangers.

### Install alternatives while this is private

Use these collaborator-only paths until the formula goes live:

- **pipx + git:**
  ```sh
  pipx install git+https://github.com/rafaelscosta/claude-i.git@v0.2.0
  ```
- **GitHub Release wheel:**
  ```sh
  gh release download v0.2.0 --pattern '*.whl' -R rafaelscosta/claude-i
  pipx install ./claude_i-0.2.0-py3-none-any.whl
  ```

Both require repo read access (collaborator or PAT with `repo` scope).

### When the tap becomes live

Once `claude-i` flips public and `v0.2.0` lands on PyPI, the formula will be updated (per `claude-i/NOTES.md` Task 5.9) and these commands will work:

```sh
brew tap rafaelscosta/claude-i
brew install claude-i
```

## What is claude-i?

`claude-i` is a CLI tool that wraps Claude Code in an interactive driver so you get the ergonomics of `claude -p` (prompt-and-go) while running inside a full interactive Claude Code session.

See the main repo at [rafaelscosta/claude-i](https://github.com/rafaelscosta/claude-i) for documentation, source, and issue tracking.

## Formula

The formula lives in [`Formula/claude-i.rb`](Formula/) and will be updated on each `claude-i` release.

## License

[MIT](LICENSE)
