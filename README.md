# homebrew-tap

The Homebrew tap for [k10s](https://github.com/p10node/k10s), the Kubernetes
terminal UI you can click.

```bash
brew install p10node/tap/k10s
```

macOS and Linux, `arm64` and `amd64`. The formula installs the prebuilt
binary from the k10s release, checked against the sha256 that the release's
`checksums.txt` lists for it, so there is nothing to build.

## Upgrading

```bash
brew upgrade k10s
```

From k10s v0.1.9 on, k10s leaves a Homebrew install to Homebrew:
`k10s update`, and `/update` inside k10s, say to run `brew upgrade k10s` and
change nothing. v0.1.8 still updates itself over the Homebrew copy; the next
`brew upgrade k10s` puts that right.

## Tap trust

Since Homebrew 6.0.0, a formula from a tap that is not Homebrew's own loads
only once it is trusted ([Tap Trust](https://docs.brew.sh/Tap-Trust)). The
one-line install above needs nothing more: a fully qualified name trusts that
one formula by itself.

By short name, trust the formula first:

```bash
brew tap p10node/tap
brew trust --formula p10node/tap/k10s
brew install k10s
```

In a Brewfile, mark the entry trusted
([Homebrew Bundle](https://docs.brew.sh/Brew-Bundle-and-Brewfile#trusted)):

```ruby
brew "p10node/tap/k10s", trusted: true
```

Without the trust step Homebrew says "Refusing to load formula
p10node/tap/k10s from untrusted tap p10node/tap", which reads like a broken
formula but is the trust check.

## How the formula is kept current

`Formula/k10s.rb` is written by the k10s release workflow, not by hand. After
every full release,
[`homebrew.yml`](https://github.com/p10node/k10s/blob/main/.github/workflows/homebrew.yml)
checks each archive against `checksums.txt` and against its build provenance
attestation, generates the formula with
[`packaging/homebrew/formula.sh`](https://github.com/p10node/k10s/blob/main/packaging/homebrew/formula.sh),
and pushes it here in a commit named after the version. A change to the
formula belongs in that script: one made here is overwritten by the next
release.

Problems with k10s itself go to
[p10node/k10s](https://github.com/p10node/k10s/issues).
