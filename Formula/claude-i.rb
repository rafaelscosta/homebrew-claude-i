# typed: false
# frozen_string_literal: true

# claude-i — Like `claude -p`, but driven through an interactive Claude Code session.
#
# v0.2.2 — first canonical release after IP-lock reversal (2026-05-19).
#
# url    -> GitHub Release v0.2.2 sdist asset on rafaelscosta/claude-i (public).
# sha256 -> sha256 of dist/claude_i-0.2.2.tar.gz built by `python -m build`.
#
# If/when PyPI Trusted Publisher is configured and v0.2.2 is published to PyPI,
# the url + sha256 can be flipped to the canonical files.pythonhosted.org artifact.
# Until then, the GitHub Release tarball is the authoritative public source.
#
# Runtime deps: tmux (required by claude-i.runner), python@3.12 (build + venv).
# claude-i has zero Python package dependencies (pyproject.toml: dependencies = []),
# so this formula uses Homebrew's `Language::Python::Virtualenv` mixin to build a
# clean virtualenv with no `resource` blocks needed.

class ClaudeI < Formula
  include Language::Python::Virtualenv

  desc "Like `claude -p`, driven through an interactive Claude Code session"
  homepage "https://github.com/rafaelscosta/claude-i"
  url "https://github.com/rafaelscosta/claude-i/releases/download/v0.2.2/claude_i-0.2.2.tar.gz"
  sha256 "f25d84f24916de2a8f6dc017169de71baea030b2b7e56a06e5e5a08e44719084"
  license "MIT"

  # Build + runtime deps.
  depends_on "python@3.12"
  depends_on "tmux"

  def install
    # Standard Python formula pattern: create a virtualenv at libexec and pip
    # install the package into it, then symlink the entry-point script.
    virtualenv_install_with_resources
  end

  test do
    # `claude-i --version` must exit 0 and print the version string.
    assert_match "claude-i 0.2.2", shell_output("#{bin}/claude-i --version")
  end
end
