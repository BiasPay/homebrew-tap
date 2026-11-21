# Written by the release workflow in BiasPay/cli; changes here are overwritten.
class Bias < Formula
  desc "Command-line interface for the Bias payments API"
  homepage "https://biaspay.com/docs"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BiasPay/cli/releases/download/v0.1.1/bias-aarch64-apple-darwin.tar.gz"
      sha256 "504e6db71e5829d16c83ad7a2f3d84eaf42c4d4d396d994d3bbd28e18af5e777"
    end
    on_intel do
      url "https://github.com/BiasPay/cli/releases/download/v0.1.1/bias-x86_64-apple-darwin.tar.gz"
      sha256 "b70353d97a47d955d6d1724bbfefbb98dac2563361f5b6e890c929afb377c344"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BiasPay/cli/releases/download/v0.1.1/bias-aarch64-unknown-linux-musl.tar.gz"
      sha256 "02ae705b90d1f3664c454e1e4598047912fb894d4ea222b1139f3f520ecbbc63"
    end
    on_intel do
      url "https://github.com/BiasPay/cli/releases/download/v0.1.1/bias-x86_64-unknown-linux-musl.tar.gz"
      sha256 "107610142fea043c7a4696966a7599661417bb9bae714e30a6f06e76a542db81"
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
