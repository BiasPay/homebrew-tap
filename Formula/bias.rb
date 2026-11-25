# Written by the release workflow in BiasPay/cli; changes here are overwritten.
class Bias < Formula
  desc "Command-line interface for the Bias payments API"
  homepage "https://biaspay.com/docs"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BiasPay/cli/releases/download/v0.3.0/bias-aarch64-apple-darwin.tar.gz"
      sha256 "153c1c5bcc4558647f966e0e76d2a3070becf280b666380e363faad93254bd42"
    end
    on_intel do
      url "https://github.com/BiasPay/cli/releases/download/v0.3.0/bias-x86_64-apple-darwin.tar.gz"
      sha256 "84daab610db2376970490671cf0e12957916130086b3e04f44567c47b022a4d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BiasPay/cli/releases/download/v0.3.0/bias-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ee94d93e6cd3d3d74700e95a06f7222db06af0ddae8b77ae4a39af6079719757"
    end
    on_intel do
      url "https://github.com/BiasPay/cli/releases/download/v0.3.0/bias-x86_64-unknown-linux-musl.tar.gz"
      sha256 "91c35ae47668f9c6292abe96db40ddf44baffb36c7123f80f8f5007d00dfcba5"
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
