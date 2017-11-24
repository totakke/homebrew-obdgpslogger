require 'formula'

class Obdgpslogger < Formula
  homepage 'http://icculus.org/obdgpslogger/'
  url 'http://icculus.org/obdgpslogger/downloads/obdgpslogger-0.16.tar.gz'
  sha256 '7255307b846c19c1ebd7c79bd0d9a5759a6f88917b9a6b01f8e52cc7f98025d2'

  depends_on 'cmake' => :build
  depends_on 'gpsd'
  depends_on 'fltk'

  patch :p0 do
    url "https://gist.github.com/totakke/5574940/raw/8358a4622a5a0aa219e3d281059b48810c18f0e6/obdgpslogger-gpsd3.9-fltk1.3.2.patch"
    sha256 "0ce82045a1aaccd426b5eb4e697582718aa2c525019825f189fe657fbbd87e4d"
  end

  def install
    args = ["..",
            "-DCMAKE_INSTALL_PREFIX=#{prefix}"]

    mkdir 'build'
    cd 'build'
    system 'cmake', *args
    system 'make'
    system 'make install'
  end
end
