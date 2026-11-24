class Intow < Formula
  desc "Keep Claude Code history and memory attached to folders you move or rename"
  homepage "https://github.com/p10node/intow"
  url "https://github.com/p10node/intow/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "09e7f11cffebe8c6df6bf2c981d879b9b16a5eca2227f2e7918565d787d71f0e"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  def caveats
    <<~EOS
      Turn it on for Claude Code with either:
        intow install                              # SessionStart hook in ~/.claude/settings.json
      or, inside Claude Code, the plugin (then you can skip the hook above):
        /plugin marketplace add p10node/intow
        /plugin install intow@intow
    EOS
  end

  test do
    assert_match "intow #{version}", shell_output("#{bin}/intow version")
    ENV["HOME"] = testpath
    assert_match "STATE", shell_output("#{bin}/intow status")
  end
end
