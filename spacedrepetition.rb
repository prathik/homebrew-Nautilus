# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Spacedrepetition < Formula
  desc ""
  homepage ""
  url "https://github.com/prathik/spacedrepetition/archive/1.0.0.tar.gz"
  version "1.0.2"
  sha256 "f872952230d5d3c8eee0896cacc5f33fc9e76475eb72dd999c128f98b7772c03"
  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/prathik/spacedrepetition").install Dir["*"]
    cd buildpath/"src/github.com/prathik/spacedrepetition" do
      system "go", "get", "./..."
      system "go", "build", "-o", bin/"sr"
      prefix.install_metafiles
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test spacedrepetition`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "sr add 'test'"
    system "sr all"
  end
end
