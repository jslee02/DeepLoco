APT='
cmake
libboost-all-dev
libeigen3-dev
freeglut3-dev
libxi-dev
libxmu-dev
libbullet-dev
'

sudo apt-get -qq --yes --force-yes install $APT

CAFFE_DEPENDS='
libprotobuf-dev
libleveldb-dev
libsnappy-dev
libopencv-dev
libhdf5-serial-dev
protobuf-compiler
libboost-all-dev
libatlas-base-dev
libopenblas-dev
libgflags-dev
libgoogle-glog-dev
liblmdb-dev
'

sudo apt-get -qq --yes --force-yes install $CAFFE_DEPENDS

git clone https://github.com/BVLC/caffe
cd caffe
cmake . && make -j4 && make install

