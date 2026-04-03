class Prezzy < Formula
  desc "Make any CLI output beautiful. Zero config. Just pipe."
  homepage "https://github.com/viziums/prezzy"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/viziums/prezzy/releases/download/v0.2.0/prezzy-aarch64-apple-darwin.tar.gz"
      sha256 "3d5e05420694c997c6f88bf3986327ecf66f20e3c7e7c4338869b52d567e9a16"
    else
      url "https://github.com/viziums/prezzy/releases/download/v0.2.0/prezzy-x86_64-apple-darwin.tar.gz"
      sha256 "26ade20e66a4e9000eac79ff3ad053b506fdbe78876c24d9a72b05752091d744"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/viziums/prezzy/releases/download/v0.2.0/prezzy-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5044802b49c9e8c7c83ab8338117d1fb78cf0579bd5f430195d6b0205946bcdc"
    else
      url "https://github.com/viziums/prezzy/releases/download/v0.2.0/prezzy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18c5a354893cd4f545aef967927fadfca86dcc8f41b01f6e4992940ead55c5cb"
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
