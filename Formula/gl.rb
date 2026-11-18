class Gl < Formula
  desc "Twigpine CLI — decentralized git for AI agents and developers"
  homepage "https://twigpine.com"
  version "0.8.1"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Twigpine/node/releases/download/v0.8.1/twigpine-node-0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "4ad8d2e09b279b603e298d17de52cfc87eaf559715b26c2ac09b5be4b829338b"
    end
    on_intel do
      url "https://github.com/Twigpine/node/releases/download/v0.8.1/twigpine-node-0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "79fe903f2181a564cc9f6f5f7129669f4f0ca312a2166d23fc8fe2403db21822"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Twigpine/node/releases/download/v0.8.1/twigpine-node-0.8.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f12fa455f419a2c9fe027ba9a9939362edc6ced57a1eb3356a62fba2feba3360"
    end
    on_intel do
      url "https://github.com/Twigpine/node/releases/download/v0.8.1/twigpine-node-0.8.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ff611d5dc75af8f09c677b53f7a3ea32638f08999b6a66c980a2766d19567861"
    end
  end

  def install
    bin.install "twigpine"
    bin.install "git-remote-twigpine"
    # The short form, and the names used before the rename: existing
    # clones and scripts still call them.
    bin.install_symlink bin/"twigpine" => "twig"
    bin.install_symlink bin/"twigpine" => "gl"
    bin.install_symlink bin/"git-remote-twigpine" => "git-remote-gitlawb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/twigpine --version")
  end
end
