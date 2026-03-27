class Prezzy < Formula
  desc "Make any CLI output beautiful. Zero config. Just pipe."
  homepage "https://github.com/viziums/prezzy"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/viziums/prezzy/releases/download/v0.1.2/prezzy-aarch64-apple-darwin.tar.gz"
      sha256 "98c5ec2d625c8a22541b2a0a8629366c9c09e37a270d4ad10b44f517e88f67d6"
    else
      url "https://github.com/viziums/prezzy/releases/download/v0.1.2/prezzy-x86_64-apple-darwin.tar.gz"
      sha256 "6d9eae6329ddfbcf34d38a15a068b5e667006a755b8975134f7d32c8ebd7892b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/viziums/prezzy/releases/download/v0.1.2/prezzy-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7952bf3416dbb18f84611e308ab0528a77ef5f092f8b16d42711c98c3b3f63d4"
    else
      url "https://github.com/viziums/prezzy/releases/download/v0.1.2/prezzy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7eecf9cff151e54527f9ee59c3b559aecc89b2058f9e03d5f70d0010dc91455c"
    end
  end

  def install
    bin.install "prezzy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prezzy --version")
    assert_match "name", pipe_output("#{bin}/prezzy --color=never", '{"name":"test"}')
  end
end
