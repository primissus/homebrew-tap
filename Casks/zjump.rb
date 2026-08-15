cask "zjump" do
  version "0.6.0"

  on_macos do
    on_intel do
      sha256 "d081b227a228f89ee491454d2f4429884a65db9ac6a21d55a883fa63bd31e477"
      url "https://github.com/primissus/zjump/releases/download/v0.6.0/zjump_#{version}_darwin_amd64.tar.gz",
        verified: "github.com/primissus/zjump"
    end
    on_arm do
      sha256 "cc912c7e6d67eed8ed1d339b6f03135ef1110159f3f682ee6dd57e4ffc9a84fd"
      url "https://github.com/primissus/zjump/releases/download/v0.6.0/zjump_#{version}_darwin_arm64.tar.gz",
        verified: "github.com/primissus/zjump"
    end
  end

  on_linux do
    on_intel do
      sha256 "213166750b38cb6a55c2d6c6bfd37646e778867bcb6741b25caae500b4dccd9f"
      url "https://github.com/primissus/zjump/releases/download/v0.6.0/zjump_#{version}_linux_amd64.tar.gz",
        verified: "github.com/primissus/zjump"
    end
    on_arm do
      sha256 "3bd3c7da553c81b3087f943ec15eda41086f396295a169660a8c780a7de175d2"
      url "https://github.com/primissus/zjump/releases/download/v0.6.0/zjump_#{version}_linux_arm64.tar.gz",
        verified: "github.com/primissus/zjump"
    end
  end

  name "zjump"
  desc "Frecency-based directory-jumping CLI tool (Go reimplementation of zoxide)."
  homepage "https://github.com/primissus/zjump"

  binary "zjump"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/zjump"]
    end
  end

  caveats <<~EOS
    Add the shell hook to your rc file, e.g.:
      eval "$(zjump init bash)"   # or: zjump init zsh
  EOS
end