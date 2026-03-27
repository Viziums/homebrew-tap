class Prezzy < Formula
  desc "Make any CLI output beautiful. Zero config. Just pipe."
  homepage "https://github.com/viziums/prezzy"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/viziums/prezzy/releases/download/v0.1.3/prezzy-aarch64-apple-darwin.tar.gz"
      sha256 "3604770cd92d15fef2bdc8ddd8992ebae808ef435944f8ace6cffa7c523d056f"
    else
      url "https://github.com/viziums/prezzy/releases/download/v0.1.3/prezzy-x86_64-apple-darwin.tar.gz"
      sha256 "0d63574f543b34c74ccac1401666e2e564e3ced42b8c3250b40e26d4e86afef7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/viziums/prezzy/releases/download/v0.1.3/prezzy-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a1d0da80eafcfe4bb8fe87c6917a01163bb6181f112d851e71a6b34804cdb114"
    else
      url "https://github.com/viziums/prezzy/releases/download/v0.1.3/prezzy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62fa4dfe22ff5f167c61363c9ac9fc5c14637f1427075cb344bc07a017db9e18"
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
