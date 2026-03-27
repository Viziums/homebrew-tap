class Prezzy < Formula
  desc "Make any CLI output beautiful. Zero config. Just pipe."
  homepage "https://github.com/viziums/prezzy"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/viziums/prezzy/releases/download/v0.1.1/prezzy-aarch64-apple-darwin.tar.gz"
      sha256 "fe38884b36012765222ed730d83f99e9bac9caf3224174d974cd326a262f211d"
    else
      url "https://github.com/viziums/prezzy/releases/download/v0.1.1/prezzy-x86_64-apple-darwin.tar.gz"
      sha256 "904b21f05c8996e82a8899f84986626266b63d093aba17b7ce490e0afc3742e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/viziums/prezzy/releases/download/v0.1.1/prezzy-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5dbddcd3d8c3626a76afac2431ee90284ae4a7f71c39c66e0f25f742a4787f9"
    else
      url "https://github.com/viziums/prezzy/releases/download/v0.1.1/prezzy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a75e5fa34010dab48af8f7b674c408f27140570b2cb26aae0b0f4a1121d77d9"
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
