# Written by packaging/homebrew/formula.sh in p10node/k10s, which
# .github/workflows/homebrew.yml runs for every release: edit the script, not
# this file, or the next release overwrites the change.
class K10s < Formula
  desc "Kubernetes terminal UI you can click"
  homepage "https://github.com/p10node/k10s"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/p10node/k10s/releases/download/v0.1.8/k10s_v0.1.8_darwin_arm64.tar.gz"
      sha256 "2596f3081fadc299f03addf4482d0f8c73ecc93148d7288d3b32da3f0c330607"
    end
    on_intel do
      url "https://github.com/p10node/k10s/releases/download/v0.1.8/k10s_v0.1.8_darwin_amd64.tar.gz"
      sha256 "693e6ef98d85ccc7fa9790a5fda6888ea37b25934afbd7202abe134a84b581ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/p10node/k10s/releases/download/v0.1.8/k10s_v0.1.8_linux_arm64.tar.gz"
      sha256 "8d6fd2a6dd1d091c636bf60e49cfe26ad3f894a1f98296e8a0f069c64c6e79cb"
    end
    on_intel do
      url "https://github.com/p10node/k10s/releases/download/v0.1.8/k10s_v0.1.8_linux_amd64.tar.gz"
      sha256 "1bfbd4b85d4977d750ea35a03dbac2dd7ed8bc4c7310e72c9e034f427e8caa54"
    end
  end

  def install
    bin.install "k10s"
  end

  test do
    assert_match "k10s v#{version}", shell_output("#{bin}/k10s --version")
  end
end
