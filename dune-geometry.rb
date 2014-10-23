# This file is licensed under the GNU General Public License v3.0
require 'formula'

class DuneGeometry < Formula
  homepage 'http://www.dune-project.org/'
  url 'http://www.dune-project.org/download/2.3.1/dune-geometry-2.3.1.tar.gz'
  sha1 '1928ee494f3fc05f32868723e336184598a600a8'

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
