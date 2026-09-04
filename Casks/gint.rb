cask "gint" do
  version "1.7.0"

  on_macos do
    on_arm do
      sha256 "7d2ad836ce80ea8728df2b91ac7c416b165fba2eeef05dcb1e937cdffcde770a"
      url "https://github.com/primissus/git-interactive/releases/download/v#{version}/gint_#{version}_darwin_arm64.zip"
      binary "gint_#{version}_darwin_arm64/gint"
    end
    on_intel do
      sha256 "92ab59501c1b6080b278b023303f17a59cdc46b79d60fe61a4cdc0c029356a68"
      url "https://github.com/primissus/git-interactive/releases/download/v#{version}/gint_#{version}_darwin_amd64.zip"
      binary "gint_#{version}_darwin_amd64/gint"
    end
  end
  on_linux do
    on_arm do
      sha256 "a0c48f9859a7d95d766a2e7b5f7c3299899a32da190465e96fbc3c6a745d489c"
      url "https://github.com/primissus/git-interactive/releases/download/v#{version}/gint_#{version}_linux_arm64.zip"
      binary "gint_#{version}_linux_arm64/gint"
    end
    on_intel do
      sha256 "bbad4418ad205e00b7ee0a52dfee5986fb9070aa1364002caf37b59fa94ee50d"
      url "https://github.com/primissus/git-interactive/releases/download/v#{version}/gint_#{version}_linux_amd64.zip"
      binary "gint_#{version}_linux_amd64/gint"
    end
  end

  name "gint"
  desc "Interactive TUI wrapping common git operations"
  homepage "https://github.com/primissus/git-interactive"

  livecheck do
    skip "Updated on release."
  end

  depends_on formula: "git"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path.to_s]
    end
  end

  # No zap stanza required

  caveats <<~EOS
    Optional: install the shell wrapper so `gint worktree` checkout can cd:
      eval "$(gint shell-init zsh)"   # or: gint shell-init bash
  EOS
end
