cask "pasteferry" do
  version "2.9.0"
  sha256 "751169c921aedcc5703d355f5013d8bfcb128c0f420a85c01cbbafb465966ed2"

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
