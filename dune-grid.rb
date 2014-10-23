 # This file is licensed under the GNU General Public License v3.0
require 'formula'

class DuneGrid < Formula
  homepage 'http://www.dune-project.org/'
  url 'http://www.dune-project.org/download/2.3.1/dune-grid-2.3.1.tar.gz'
  sha1 'e00d2386ddbfb73f57e67e9d3c107e59d4232dee'

  depends_on 'autoconf'  => :build
  depends_on 'automake'  => :build
  depends_on 'libtool'   => :build
  depends_on 'pkgconfig' => :build
  depends_on 'dune-geometry' => :build

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
