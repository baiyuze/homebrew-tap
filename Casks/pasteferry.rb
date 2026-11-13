cask "pasteferry" do
  version "2.12.0"
  sha256 "a85ee69790323cad89f31b53f6d5b700bbbe1136e945aa8f1091a7d261caaada"

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
