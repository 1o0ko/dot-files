$DIR=~/tools/

if [[ ! -e $DIR ]]; then
    mkdir $DIR
elif [[ ! -d $DIR ]]; then
    echo "$DIR already exists but is not a directory" 1>&2
fi

# Go there
cd $DIR 

# Download cmake
wget https://cmake.org/files/v3.8/cmake-3.8.1.tar.gz

# Unpack
tar -xf cmake*.tar.gz

# Remove trash
rm -rf cmake*.tar.gz

# Configure and build cmake
cd cmake*
./configure --prefix=$HOME -- -DCMAKE_USE_OPENSSL=ON
make
make install
