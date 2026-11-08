# Rendered by scripts/bump_tap.py from templates/oi.rb.in; do not edit by hand.
class Oi < Formula
  desc "Point your coding harness (Claude Code, agy, pi, omp, opencode, kilo) at OpenInfer"
  homepage "https://github.com/open-infer/oi"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/open-infer/oi/releases/download/v0.1.0/oi-0.1.0-macos-arm64.tar.gz"
      sha256 "e858a24d8588681770c51cf2474e8c0054c4e53913cbc20fc03c9ff1c8eaafc1"
    end
    on_intel do
      url "https://github.com/open-infer/oi/releases/download/v0.1.0/oi-0.1.0-macos-x86_64.tar.gz"
      sha256 "95bef8dc98966ed22f86852e06c46879519154283d05e998c789ea42e7d87e11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-infer/oi/releases/download/v0.1.0/oi-0.1.0-linux-aarch64.tar.gz"
      sha256 "b0f9f8a86cd4aa183ccc8879735de64a7037be8b9bd47c01fd391e8aa57278c0"
    end
    on_intel do
      url "https://github.com/open-infer/oi/releases/download/v0.1.0/oi-0.1.0-linux-x86_64.tar.gz"
      sha256 "b7bd8bdc2ccaebeef63393e1132303f3a4f41589ec40dc96de48d90a4fa631c0"
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
