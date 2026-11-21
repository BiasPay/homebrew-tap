# Written by the release workflow in BiasPay/cli; changes here are overwritten.
class Bias < Formula
  desc "Command-line interface for the Bias payments API"
  homepage "https://biaspay.com/docs"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BiasPay/cli/releases/download/v0.1.0/bias-aarch64-apple-darwin.tar.gz"
      sha256 "dc1fa74eb5f7d94b920fb1a7a3c60f0172662dd57f3131d68dac2a1a033089e2"
    end
    on_intel do
      url "https://github.com/BiasPay/cli/releases/download/v0.1.0/bias-x86_64-apple-darwin.tar.gz"
      sha256 "7064c4bdde10accd34521a030daaa5475d2bc8c8501f0222c6cd6117f1a34bdb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BiasPay/cli/releases/download/v0.1.0/bias-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0e522163f0b66109c7f2d714777d8f3b93402476c6bd0e5dca6fd759df3e1555"
    end
    on_intel do
      url "https://github.com/BiasPay/cli/releases/download/v0.1.0/bias-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1b2f4144cd23ded615479fadfe6bdd0f8a5a75d7f4ce67859cacb002d871b4cd"
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
