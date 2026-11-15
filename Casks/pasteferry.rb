cask "pasteferry" do
  version "2.12.2"
  sha256 "2c5319fcc416e61ed1a5fe658350f92efdb47e76f48cf786dfcd39936384982f"

  url "https://github.com/baiyuze/pasteferry/releases/download/v#{version}/PasteFerry.dmg"
  name "PasteFerry"
  desc "Cross-device clipboard sync and file transfers"
  homepage "https://pasteferry.cc/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "PasteFerry.app"
  binary "#{appdir}/PasteFerry.app/Contents/Helpers/pasteferry-cli"

  uninstall launchctl: [
              "com.pasteferry.daemon",
              "com.pasteferry.picker",
            ],
            quit:      "com.pasteferry.app"
end
