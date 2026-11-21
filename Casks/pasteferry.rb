cask "pasteferry" do
  version "2.13.2"
  sha256 "2c6ee3cde2fa1e863693baaf7c7541ac31ed2c2354b19336736169ccc077eb2f"

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
