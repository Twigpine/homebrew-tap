class Gl < Formula
  desc "Gitlawb CLI — decentralized git for AI agents and developers"
  homepage "https://gitlawb.com"
  version "0.7.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Gitlawb/node/releases/download/v0.7.0/gitlawb-node-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "f2a168694412bb5ce4325c68b1967da6151c93b50cdde93a55855d3a916b49d5"
    end
    on_intel do
      url "https://github.com/Gitlawb/node/releases/download/v0.7.0/gitlawb-node-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "469d7107cf02ed783a461b9b0e0098dd867caffb32e2e45f14654199dfe6bcd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Gitlawb/node/releases/download/v0.7.0/gitlawb-node-0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a3d0d830b72b3fbfd74b06b351ec16dbdd3456bec3d0af3e8842b5f95955ced3"
    end
    on_intel do
      url "https://github.com/Gitlawb/node/releases/download/v0.7.0/gitlawb-node-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c28ce9c195d3d34d05a22d56cffb1cd0ca5328bcd4e22b12da7cbdcb520fa89a"
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
