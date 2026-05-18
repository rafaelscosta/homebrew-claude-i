# typed: false
# frozen_string_literal: true

# claude-i — Like `claude -p`, but driven through an interactive Claude Code session.
#
# Authored for STORY-001.4 (Multi-Target Install).
#
# Dev-pass URL strategy (v0.2.0):
#   url    -> GitHub pre-release "v0.2.0-pre" sdist asset on rafaelscosta/claude-i.
#   sha256 -> sha256 of dist/claude_i-0.2.0.tar.gz built by `python -m build`.
#
# At epic close (per STORY-001.4 Task 5.9), the url + sha256 are flipped to the
# canonical PyPI files.pythonhosted.org artifact. See
# https://github.com/rafaelscosta/claude-i/blob/main/docs/guides/homebrew-tap.md
# for the finalization checklist.
#
# Runtime deps: tmux (required by claude-i.runner), python@3.12 (build + venv).
# claude-i has zero Python package dependencies (pyproject.toml: dependencies = []),
# so this formula uses Homebrew's `Language::Python::Virtualenv` mixin to build a
# clean virtualenv with no `resource` blocks needed.

class ClaudeI < Formula
  include Language::Python::Virtualenv

  desc "Like `claude -p`, driven through an interactive Claude Code session"
  homepage "https://github.com/rafaelscosta/claude-i"
  # v0.2.0 dev-pass URL (pre-release sdist asset). Replace with files.pythonhosted.org
  # at epic close per docs/guides/homebrew-tap.md § Epic-Close Finalization.
  url "https://github.com/rafaelscosta/claude-i/releases/download/v0.2.0-pre/claude_i-0.2.0.tar.gz"
  sha256 "28738be41964796c031f4b2927839e3282a890f906866385ead2279879ec4353"
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
    # AC-1 / Task 5.2 — `claude-i --version` must exit 0 and print the version.
    # This is the same assertion the CI smoke matrix makes.
    assert_match "claude-i 0.2.0", shell_output("#{bin}/claude-i --version")
  end
end
