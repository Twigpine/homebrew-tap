class Gl < Formula
  desc "Gitlawb CLI — decentralized git for AI agents and developers"
  homepage "https://gitlawb.com"
  version "0.7.1"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Gitlawb/node/releases/download/v0.7.1/gitlawb-node-0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "ebc0b453ce5c0e88154cc0d274535c461f30edbcab3c8fe9ab79d02d7f890247"
    end
    on_intel do
      url "https://github.com/Gitlawb/node/releases/download/v0.7.1/gitlawb-node-0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "699da7c2abf3f360a22fa4e57e9558231530e544e2d4c5bbaa62be5abe79bbcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Gitlawb/node/releases/download/v0.7.1/gitlawb-node-0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "63210ab5066ce764857875d08d2a38654b17e2d940dac041bde107d4308cfc46"
    end
    on_intel do
      url "https://github.com/Gitlawb/node/releases/download/v0.7.1/gitlawb-node-0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9de100fba5bacecf48ef0a3fdfd10df6d45c51a01d3f6546ae99b014ab0eb0f6"
    end
  end

  def install
    bin.install "gl"
    bin.install "git-remote-gitlawb"
  end

  def caveats
    <<~CAVEATS
      oh-my-zsh's git plugin aliases gl='git pull', which shadows this
      binary in interactive shells. If `gl` prints "fatal: not a git
      repository", run:
        echo 'unalias gl 2>/dev/null' >> ~/.zshrc && source ~/.zshrc
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gl --version")
  end
end
