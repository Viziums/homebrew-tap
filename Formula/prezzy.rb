class Prezzy < Formula
  desc "Make any CLI output beautiful. Zero config. Just pipe."
  homepage "https://github.com/viziums/prezzy"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/viziums/prezzy/releases/download/v0.1.0/prezzy-aarch64-apple-darwin.tar.gz"
      sha256 "7a705b87df82dbc1abb4441ac78e5c923767f4aa9d5e3577abe74353e427d9f1"
    else
      url "https://github.com/viziums/prezzy/releases/download/v0.1.0/prezzy-x86_64-apple-darwin.tar.gz"
      sha256 "8ed40caafe6cb5dbdc99177e173b57e202ad435337cd713843120c7a47943e24"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/viziums/prezzy/releases/download/v0.1.0/prezzy-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2f9d5047d4cdb180b30d7f29bfd8b012e4a2bb27ed619b0e8a6a124c608c1bb"
    else
      url "https://github.com/viziums/prezzy/releases/download/v0.1.0/prezzy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f406a7124ee2795dfbd26b335dd168116f0da4451e72ff69db7bb51e1cb1ac9c"
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
