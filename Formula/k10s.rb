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
      url "https://github.com/p10node/k10s/releases/download/v0.1.10/k10s_v0.1.10_darwin_arm64.tar.gz"
      sha256 "d687209dead9253e5a886d2a3e9ecb8ebad8abdf70b214f7ae2a897e5ce2170b"
    end
    on_intel do
      url "https://github.com/p10node/k10s/releases/download/v0.1.10/k10s_v0.1.10_darwin_amd64.tar.gz"
      sha256 "c6130d9ef73bd092d1e2507ad0968473d154dc0f30b18534a23fd97427f1f359"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/p10node/k10s/releases/download/v0.1.10/k10s_v0.1.10_linux_arm64.tar.gz"
      sha256 "fb83a5f310a647421dc3720828ad711b096577d261213862b6cd25cb2971de2b"
    end
    on_intel do
      url "https://github.com/p10node/k10s/releases/download/v0.1.10/k10s_v0.1.10_linux_amd64.tar.gz"
      sha256 "c1e62eb672db3c8ffcb0142e36ac8ca5ca6c57baaf5104a2a6933361c0acd868"
    end
  end

  def install
    bin.install "k10s"
  end

  test do
    assert_match "k10s v#{version}", shell_output("#{bin}/k10s --version")
  end
end
