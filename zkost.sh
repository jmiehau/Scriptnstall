cd ~/
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install qt5-default -y
sudo apt-get install git -y
sudo apt-get install make -y
sudo apt-get install g++ -y
sudo rm -r ~/nheqminer
sudo apt-get install cmake build-essential libboost-all-dev -y
git clone --recursive https://github.com/kost/nheqminer.git
#git clone https://github.com/etherchain-org/nheqminer.git
cd nheqminer/nheqminer
mkdir build
cd build
cmake -DXENON=2 ..
make
NPROC=$(nproc)
#~/nheqminer/nheqminer/build/nheqminer -t $NPROC -l eu1-zcash.flypool.org:3333 -u address.worker
#~/nheqminer/build/nheqminer -l zec-eu.suprnova.cc:2142 -u username.workername -p workerpassword
