class McpAtlassian < Formula
  desc "Lightweight MCP server for Jira and Confluence"
  homepage "https://github.com/d3lph1/mcp-atlassian"
  license "MIT"

  # The release ships bare binaries rather than archives, one per target;
  # each is the static build CI produced natively for that platform.
  on_macos do
    on_arm do
      url "https://github.com/d3lph1/mcp-atlassian/releases/download/v0.1.2/mcp-atlassian-aarch64-apple-darwin"
      sha256 "95ac6bc5704d93203a5b6ca44b7ac74517f8b5303386b18c49cfddc03c233198"
    end
    on_intel do
      url "https://github.com/d3lph1/mcp-atlassian/releases/download/v0.1.2/mcp-atlassian-x86_64-apple-darwin"
      sha256 "1f2bb6c88439f8a41bb062c8589fcec50460f29611b8183a3879ee5c8e771c6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/d3lph1/mcp-atlassian/releases/download/v0.1.2/mcp-atlassian-aarch64-unknown-linux-musl"
      sha256 "41aae61100ce8c9fadddfb09395d01eb61fd7113cf5b8fd1eda31717b728537a"
    end
    on_intel do
      url "https://github.com/d3lph1/mcp-atlassian/releases/download/v0.1.2/mcp-atlassian-x86_64-unknown-linux-musl"
      sha256 "5edd1d1c3c777f73b9bacc61759201e947a4b0e71bbd7524fd53f2b537402585"
    end
  end

  def install
    bin.install Dir["mcp-atlassian-*"].first => "mcp-atlassian"
  end

  test do
    assert_match "mcp-atlassian #{version}", shell_output("#{bin}/mcp-atlassian --version")
    # Refuses to start unconfigured, and says which variables it wants.
    output = shell_output("#{bin}/mcp-atlassian 2>&1", 1)
    assert_match "JIRA_URL", output
  end
end
