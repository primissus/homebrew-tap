cask "gint" do
  version "1.6.0"

  on_macos do
    on_intel do
      sha256 "61d6e9998cb3ad432a70c44f5fc0128ad514b44c578c7e8541544c4d3524b476"
      url "https://github.com/primissus/git-interactive/releases/download/v#{version}/gint_#{version}_darwin_amd64.zip",
        verified: "github.com/primissus/git-interactive"
      binary "gint_#{version}_darwin_amd64/gint"
    end
    on_arm do
      sha256 "aa31219d7827182bed880246dd1df5c8fdb1032e0d16bc998fbfb507e15875d9"
      url "https://github.com/primissus/git-interactive/releases/download/v#{version}/gint_#{version}_darwin_arm64.zip",
        verified: "github.com/primissus/git-interactive"
      binary "gint_#{version}_darwin_arm64/gint"
    end
  end

  on_linux do
    on_intel do
      sha256 "e41eb3e89ebfcac4f59be17af882cc580b9628e54842e00b941a516acbc84f62"
      url "https://github.com/primissus/git-interactive/releases/download/v#{version}/gint_#{version}_linux_amd64.zip",
        verified: "github.com/primissus/git-interactive"
      binary "gint_#{version}_linux_amd64/gint"
    end
    on_arm do
      sha256 "06402ca5582af63cdf376688bb790bd9ea1b2c36f43703131df052602341967a"
      url "https://github.com/primissus/git-interactive/releases/download/v#{version}/gint_#{version}_linux_arm64.zip",
        verified: "github.com/primissus/git-interactive"
      binary "gint_#{version}_linux_arm64/gint"
    end
  end

  name "gint"
  desc "Interactive TUI wrapping common git operations"
  homepage "https://github.com/primissus/git-interactive"

  depends_on formula: "git"

  livecheck do
    skip "Updated on release."
  end

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}"]
    end
  end

  # No zap stanza required

  caveats <<~EOS
    Optional: install the shell wrapper so `gint worktree` checkout can cd:
      eval "$(gint shell-init zsh)"   # or: gint shell-init bash
  EOS
end
