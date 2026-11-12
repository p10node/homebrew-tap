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
      url "https://github.com/p10node/k10s/releases/download/v0.1.9/k10s_v0.1.9_darwin_arm64.tar.gz"
      sha256 "1dd0eda2da61ba1e874565389c8c18278d501670eeca3169d7bb090299ae7e5f"
    end
    on_intel do
      url "https://github.com/p10node/k10s/releases/download/v0.1.9/k10s_v0.1.9_darwin_amd64.tar.gz"
      sha256 "b0f7b0dbde3a35330c4a5de411737fab37c0dbff0c9e6a8e7cef8bc61e67708e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/p10node/k10s/releases/download/v0.1.9/k10s_v0.1.9_linux_arm64.tar.gz"
      sha256 "9c0541f315f90717269d0e0fdd554b143b12d5f9b50b8b0d77017cc432cdd161"
    end
    on_intel do
      url "https://github.com/p10node/k10s/releases/download/v0.1.9/k10s_v0.1.9_linux_amd64.tar.gz"
      sha256 "55b4d4b1291838d80e171bfa127ea3a344fafde69ce24b5327d70b6ae1ff4dc9"
    end
  end

  def install
    bin.install "k10s"
  end

  test do
    assert_match "k10s v#{version}", shell_output("#{bin}/k10s --version")
  end
end
