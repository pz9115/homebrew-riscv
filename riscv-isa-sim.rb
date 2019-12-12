require "formula"

class RiscvIsaSim < Formula
  homepage "http://riscv.org"
  url "https://github.com/riscv/riscv-isa-sim.git"

  bottle do
    root_url 'http://riscv.org.s3.amazonaws.com/bottles'
    rebuild 10
    sha256 "c22de5879f7a15737a359c6cb1ed86bc3bb3dd000bbca582db45e3e7c76fd105" => :mojave
    sha256 "34f9d39b9cc7f674ae8c5443233ee6d8fad9d3d132410e65c3e93af06930d7a3" => :high_sierra
  end

  depends_on "dtc"


  def install
    # this + prefixes below help spike find pk after being installed
    ENV['CXXFLAGS'] = "-DTARGET_ARCH=\"\""

    mkdir "build"
    cd "build" do
      system "../configure", "--prefix=#{prefix}"
      system "make", "prefix=#{HOMEBREW_PREFIX}"
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
