cask "pasteferry" do
  version "2.9.0"
  sha256 "0f1196a2d3754759fb162c86c44c240c28ce9fe8a17ad5e7472462c667c56667"

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
