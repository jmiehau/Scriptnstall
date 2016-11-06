sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install build-essential pkg-config libgtest-dev libc6-dev m4 autoconf libtool nano htop lm-sensors ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake aptitude -y
sudo aptitude install g++ g++-multilib -y
git clone https://github.com/z-classic/zclassic.git
cd zclassic/
git checkout v1.0.1
./zcutil/fetch-params.sh
echo "now compilation will start"
./zcutil/build.sh -j$(nproc)
#echo "now testing will start"
#./qa/zclassic/full-test-suite.sh
#./qa/pull-tester/rpc-tests.sh
echo "now solo mining will start"
mkdir -p ~/.zclassic
echo "rpcuser=user" >> ~/.zclassic/zclassic.conf
echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >>~/.zclassic/zclassic.conf
echo "gen=1" >> ~/.zclassic/zclassic.conf
echo "genproclimit=3" >> ~/.zclassic/zclassic.conf
echo "equihashsolver=tromp" >> ~/.zclassic/zclassic.conf
#echo "Check your conf, add new nodes, etc:"
#nano ~/.zclassic/zclassic.conf
~/zclassic/./src/zcashd
