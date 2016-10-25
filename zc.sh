sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install build-essential pkg-config libgtest-dev libc6-dev m4 autoconf libtool nano htop lm-sensors ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake aptitude -y
sudo aptitude install g++ g++-multilib -y
git clone https://github.com/zcash/zcash.git
cd zcash/
git checkout v1.0.0-rc2
./zcutil/fetch-params.sh
echo "now compilation will start"
./zcutil/build.sh -j$(nproc)
#echo "now testing will start"
#./qa/zcash/full-test-suite.sh
#./qa/pull-tester/rpc-tests.sh
echo "now solo mining will start"
mkdir -p ~/.zcash
echo "testnet=1" >> ~/.zcash/zcash.conf
echo "addnode=betatestnet.z.cash" >> ~/.zcash/zcash.conf
echo "rpcuser=user" >> ~/.zcash/zcash.conf
echo "rpcpassword=password" >> ~/.zcash/zcash.conf
echo "gen=1" >> ~/.zcash/zcash.conf
echo "genproclimit=6" >> ~/.zcash/zcash.conf
echo "equihashsolver=tromp" >> ~/.zcash/zcash.conf
#echo "Check your conf, add new nodes, etc:"
#nano ~/.zcash/zcash.conf
~/zcash/./src/zcashd

#~/zcash/./src/zcashd -daemon
#~/zcash/./src/zcash-cli getmininginfo
#sleep 5
#~/zcash/./src/zcash-cli getwalletinfo
#"Welcome to Zcash. You can check you hashrate using zcbm, consult the info on zcinfo, read the txs with zctxs, and use zcstart and zcstop to manage it. You can also use >>watch free<< to watch your memory consumption."
#~/zcash/./src/zcash-cli getinfo
#~/zcash/src/./zcash-cli zcbenchmark solveequihash 10
#~/zcash/./src/zcash-cli listtransactions
#echo "alias zcbm='watch -n 2 ~/zcash/src/./zcash-cli zcbenchmark solveequihash 10 && watch -n 2 free -m && watch -n 2 ~/zcash/./src/zcash-cli getinfo'"  >> sudo /etc/bash.bashrc
#echo "alias zcinfo='~/zcash/./src/zcash-cli getinfo && ~/zcash/./src/zcash-cli getwalletinfo && ~/zcash/./src/zcash-cli getmininginfo'"  >> sudo /etc/bash.bashrc
#echo "alias zctxs='~/zcash/./src/zcash-cli listtransactions'" >> sudo /etc/bash.bashrc
#echo "alias zcstart='~/zcash/./src/zcashd -daemon'" >> sudo /etc/bash.bashrc
#echo "alias zcstop='lsof -i | grep zcashd && ~/zcash/./src/zcash-cli stop && sudo pkill -9 zcashd && sudo pkill -9 zcash-cli'" >> sudo /etc/bash.bashrc
#echo '\
#\
#zclog() {\
#memory=$(free|awk "/^Mem:/{print $2}")\
#memory=$(echo "$memory/1000" | bc) # integer math in bash\
#mydate=$(date +"%D")\
#echo "$mydate" | tee -a zclog.txt\
#echo "time, block number, difficulty, CPU%, RAM in MB per core" | tee -a zclog.txt\
#c=1\
#until [ $c -gt 240 ]; do # for 1 hour\
#     let c=c+1\
#     mytime=$(date +"%T")\
#     block=$(~/zcash/./src/zcash-cli getblockcount)\
#     difficulty=$(~/zcash/./src/zcash-cli getdifficulty)\
#     difficulty=${difficulty:0:5}\
#     p=$(ps aux | grep zcashd)\
#     q=$(echo "$p" | tail -n1) \
#     cpu=${q:16:3}\
#     if [ "$cpu" == "0.0" ]; then\
#         p=$(echo "$p" | tail -n2)\
#     fi	 	\
#    cpu=${p:16:3}\
#    ram=${p:20:4}\
#     rampercore=$(echo "($ram*$memory/($cpu+1)" | bc)\
#     echo "$mytime $block $difficulty $cpu $rampercore" | tee -a log.txt\
#     sleep 15 # seconds\
#done\
#}'
