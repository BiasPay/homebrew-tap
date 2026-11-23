# Written by the release workflow in BiasPay/cli; changes here are overwritten.
class Bias < Formula
  desc "Command-line interface for the Bias payments API"
  homepage "https://biaspay.com/docs"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BiasPay/cli/releases/download/v0.2.0/bias-aarch64-apple-darwin.tar.gz"
      sha256 "a9f44d039f7ceca8a5c779d349c84a7e35cf367f030ae27c799abf22fda758ac"
    end
    on_intel do
      url "https://github.com/BiasPay/cli/releases/download/v0.2.0/bias-x86_64-apple-darwin.tar.gz"
      sha256 "447282e424baed1f43135a88de7768d1f0fa176d6684b345b5e58fec3293cc57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BiasPay/cli/releases/download/v0.2.0/bias-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7a05ff183a4aeb8b3f8599d51e88a387e030b0f01794efa368e38aeb705f9790"
    end
    on_intel do
      url "https://github.com/BiasPay/cli/releases/download/v0.2.0/bias-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4a664ce8368bb1ce9d196dad076475adbf18c76a59cc97b9993e5bf8435dbe39"
    end
  end

  def install
    bin.install "bias"
    generate_completions_from_executable(bin/"bias", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bias version")
  end
end
