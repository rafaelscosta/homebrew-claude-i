# homebrew-claude-i

Homebrew tap for [claude-i](https://github.com/rafaelscosta/claude-i) — like `claude -p`, driven through an interactive Claude Code session.

## Install

```sh
brew tap rafaelscosta/claude-i
brew install claude-i
```

Verify:

```sh
claude-i --version    # → claude-i 0.2.2
claude-i doctor       # 5/5 PASS
```

## Use

### Interactive (single-shot)

```sh
claude-i "What is 2+2?"
# → 4
```

### Automation / CI

```sh
claude-i --retries 3 "<prompt>"
```

The `--retries 3` flag absorbs an upstream Anthropic-side burst-load session hang (Bug 5 in [main repo NOTES.md](https://github.com/rafaelscosta/claude-i/blob/main/NOTES.md)). Recommended for any non-interactive use.

## What is claude-i?

`claude-i` is a CLI tool that wraps Claude Code in an interactive driver so you get the ergonomics of `claude -p` (prompt-and-go) while running inside a full interactive Claude Code session — meaning hooks, MCPs, skills, and plugins are all loaded.

See the main repo at [rafaelscosta/claude-i](https://github.com/rafaelscosta/claude-i) for documentation, source, and issue tracking.

## Formula

The formula lives in [`Formula/claude-i.rb`](Formula/) and is updated on each `claude-i` release. Currently pinned to v0.2.2 (2026-05-19) — the first canonical release after the upstream IP-lock reversal.

The formula's `url` points at the [GitHub Release tarball](https://github.com/rafaelscosta/claude-i/releases/download/v0.2.2/claude_i-0.2.2.tar.gz). When PyPI Trusted Publisher is configured upstream, the url + sha256 can be flipped to `files.pythonhosted.org/...`. Until then, the GitHub Release tarball is the authoritative public source.

## License

[MIT](LICENSE)
