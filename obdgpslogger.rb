require 'formula'

class Obdgpslogger < Formula
  homepage 'http://icculus.org/obdgpslogger/'
  url 'http://icculus.org/obdgpslogger/downloads/obdgpslogger-0.16.tar.gz'
  sha1 'a47c79b3c0570ed831f713ebf8c370c6e64b7a6c'

  depends_on 'cmake' => :build
  depends_on 'gpsd'
  depends_on 'fltk'

  def patches
    { :p0 => 'https://gist.github.com/totakke/5574940/raw/8358a4622a5a0aa219e3d281059b48810c18f0e6/obdgpslogger-gpsd3.9-fltk1.3.2.patch' }
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
