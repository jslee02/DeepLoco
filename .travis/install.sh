#Install dependencies from apt-get
APT='
cmake
libboost-all-dev
libeigen3-dev
freeglut3-dev
libxi-dev
libxmu-dev
'
sudo apt-get -qq --yes --force-yes install $APT

# Install caffe
CAFFE_DEPENDS='
doxygen
python-numpy
libprotobuf-dev
libleveldb-dev
libsnappy-dev
libopencv-dev
libhdf5-serial-dev
protobuf-compiler
libboost-all-dev
libgflags-dev
libgoogle-glog-dev
liblmdb-dev
libatlas-base-dev
gcc-4.8-multilib g++-4.8-multilib
libf2c2-dev
libglew-dev
'
sudo apt-get -qq --yes --force-yes install $CAFFE_DEPENDS
git clone https://github.com/BVLC/caffe
cd caffe
mkdir build && cd build && cmake .. && make -j4 && make install

# Install bullet
git clone --depth 1 --single-branch --branch 2.87 https://github.com/bulletphysics/bullet3
cd bullet3
mkdir build && cd build && cmake .. && make -j4 && make install
