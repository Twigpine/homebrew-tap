class Gl < Formula
  desc "Gitlawb CLI — decentralized git for AI agents and developers"
  homepage "https://gitlawb.com"
  version "0.6.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Gitlawb/node/releases/download/v0.6.0/gitlawb-node-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "645ed36b2ebc187fe4f59d36931b67f21a0dbdece88ada75848c645c9782c760"
    end
    on_intel do
      url "https://github.com/Gitlawb/node/releases/download/v0.6.0/gitlawb-node-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "703538910f88d29895a6f784a30d826e4cf2143cc20a1de6d23e9834b125c31c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Gitlawb/node/releases/download/v0.6.0/gitlawb-node-0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2569b44c7a215c52f6d6860196f84e5baf698723f51d0917afd4fbb2a5a683b9"
    end
    on_intel do
      url "https://github.com/Gitlawb/node/releases/download/v0.6.0/gitlawb-node-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6c4eb402b349ecdf6deb538a17ea79f0a943bb402ba6caf4b8ae74788a338be9"
    end
  end

  def install
    bin.install "gl"
    bin.install "git-remote-gitlawb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gl --version")
  end
end
