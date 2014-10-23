 # This file is licensed under the GNU General Public License v3.0
require 'formula'

class cjson < Formula
  homepage 'http://sourceforge.net/projects/cjson'
  url 'http://sourceforge.net/projects/cjson/files/cJSONFiles.zip/download'
  sha1 '3a016bc2b75a2eafa5f9ad192b0154a9fa2b2abe'

  depends_on 'autoconf'  => :build
  depends_on 'automake'  => :build
  depends_on 'libtool'   => :build
  depends_on 'pkgconfig' => :build

  # use Apple's Accelerate framework instead

  depends_on 'gmp'
  depends_on 'metis4'
  depends_on 'superlu'
  option 'mpi', 'Enable MPI support'


  # if we are built with c++11, make sure we link to a boost that is
  depends_on 'boost' => ('--with-c++11' if build.with? 'c++11')



  def install
    ENV.fortran

 
    system "./configure", "--prefix=#{prefix}"
    # compile and copy target files to their final location
    system 'make', 'install'

  end
end


