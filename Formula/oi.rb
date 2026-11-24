# Rendered by scripts/bump_tap.py from templates/oi.rb.in; do not edit by hand.
class Oi < Formula
  desc "Point your coding harness (Claude Code, agy, pi, omp, opencode, kilo, codex) at OpenInfer"
  homepage "https://github.com/open-infer/oi"
  version "0.2.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/open-infer/oi/releases/download/v0.2.0/oi-0.2.0-macos-arm64.tar.gz"
      sha256 "58316f19b10f1e4d61460a85971321ec2ac469cb9a40beb2cf3171d1ed398648"
    end
    on_intel do
      url "https://github.com/open-infer/oi/releases/download/v0.2.0/oi-0.2.0-macos-x86_64.tar.gz"
      sha256 "251ac22f2538f2a24970ba68f97a0c3c4332b052e0e2626824ff0539bfe1ee16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-infer/oi/releases/download/v0.2.0/oi-0.2.0-linux-aarch64.tar.gz"
      sha256 "4abfe1aed38b3d9a19e0ab982520c50bbbe2b59afbc70873aa5089fee4a0b6c0"
    end
    on_intel do
      url "https://github.com/open-infer/oi/releases/download/v0.2.0/oi-0.2.0-linux-x86_64.tar.gz"
      sha256 "32609e978e464cd625a8d3a78b907e34d5dee9fe72ef16df0f46604d2c541215"
    end
  end

  def install
    # The tarball's single top-level oi.dist/ is stripped by Homebrew, so the
    # standalone build lands in libexec with the executable beside its
    # libraries; the symlink is the binary itself, which finds them through
    # its own resolved path. No launcher.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"oi"
  end

  test do
    system bin/"oi", "--version"
  end
end
