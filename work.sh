#!/bin/bash
#TCP flood mitigation
echo "net.ipv4.tcp_challenge_ack_limit = 999999999" >> sudo /etc/sysctl.conf
sudo sysctl -p
#Prntscreensound
sudo mv /usr/share/sounds/freedesktop/stereo/camera-shutter.oga /usr/share/sounds/freedesktop/stereo/camera-shutter-disabled.oga
#Bluetooth
sudo sed -i 's/InitiallyPowered = true/InitiallyPowered = false/g' /etc/bluetooth/main.conf
rfkill block bluetooth
#Sudo on Files Eos
echo "[Contractor Entry]\nName=Open folder as root\nIcon=gksu-root-terminal\nDescription=Open folder as root\nMimeType=inode;application/x-sh;application/x-executable;\nExec=gksudo pantheon-files -d %U\nGettext-Domain=pantheon-files" >> Open_as_admin.contract
sudo mv Open_as_admin.contract /usr/share/contractor/Open_as_admin.contract
rm Open_as_admin.contract.contract
#mirror
sudo sed -i 's/http://us.archive.ubuntu.com/ubuntu/http://mirrors.mit.edu/ubuntu/g' /etc/apt/sources.list
wget https://raw.githubusercontent.com/abueesp/Scriptnstall/master/bash.bashrc
sudo mv bash.bashrc /etc/bash.bashrc
sudo apt-get update -y
sudo apt-get upgrade -y 
#SSH
sudo apt-get install ssh -y
newsshkey
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/gnome-keyring-ssh.desktop
sudo sed -i 's/PermitRootLogin without password/PermitRootLogin no/' /etc/ssh/sshd_config #noroot
sudo sed -i 's/Port **/Port 1022/' /etc/ssh/sshd_config #SSH PORT OTHER THAN 22, SET 1022
sudo /etc/init.d/ssh restart
sudo chown -R $USER:$USER .ssh
sudo chmod -R 600 .ssh
sudo chmod +x .ssh
#Minus
sudo apt-get purge imagemagick fontforge geary -y
#Docker 
sudo wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $USER
sudo apt-get purge apparmor -y
sudo rm -rf /etc/apparmor.d/
sudo rm -rf /etc/apparmor
git clone https://github.com/CISOfy/lynis
#UFW
sudo apt-get install gufw -y
sudo ufw enable
sudo ufw allow 1022/tcp
sudo iptables -F
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 1022 -j ACCEPT
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT ACCEPT ##If you are a server change this to DROP OUTPUT connections by default too
sudo iptables -P FORWARD DROP
sudo iptables restart
sudo service avahi-daemon stop
sudo cupsctl -E --no-remote-any
sudo service cups-browsed stop
#Some tools
sudo apt-get install baobab -y
sudo apt-get install brasero -y
sudo apt-get install tmux terminator -y
sudo apt-get install traceroute -y
sudo apt-get install zsh -y
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo sed -ir 's/ZSH_THEME="robbyrussell"/ZSH_THEME="norm"/g' ~/.oh-my-zsh #noroot
sudo apt-get install iotop -y
sudo apt-get install fish -y
sudo apt-get install byobu -y
sudo apt-get install autojump -y
sudo apt-get install nmap -y
sudo apt-get install tmux -y
sudo apt-get install htop -y
sudo apt-get install gtk-recordmydesktop recordmydesktop -y
sudo apt-get install vnstat -y
sudo apt-get install fail2ban -y
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
echo "Please write down an email to send you notifications when someone is attacking your ports: "
read email
echo "You entered: $email"
sed "s/destemail = your_email@domain.com/destemail = $email/g" /etc/fail2ban/jail.local
sed "s/action = %(action_)s/action = %(action_mw)s/g" /etc/fail2ban/jail.local
sed -e "s/enabled  = false/enabled  = true/g" /etc/fail2ban/jail.local
sudo apt-get install gnupg gpgv2 pbuilder ubuntu-dev-tools bzr-builddeb -y
sudo apt-get install zenmap -y
sudo apt-get install pandoc -y
sudo apt-get install virtualbox -y
sudo apt-get install gparted -y
sudo apt-get install nemo -y
sudo apt-get install apt-get install amarok -y
sudo apt-get install duplicity deja-dup -y
sudo apt-get install thunderbird -y
mkdir thunderbird
cd
wget https://addons.mozilla.org/thunderbird/downloads/latest/775/addon-775-latest.xpi
cd ..
sudo apt-get install firefox -y
firefox https://addons.mozilla.org/firefox/downloads/file/271802/no_more_install_delay-3.0-fx+sm+fn+tb.xpi

#youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/bin/youtube-dl
sudo chmod a+rx /usr/bin/youtube-dl

##GNUPG
sudo apt-get install libgtk2.0-dev -y
sudo mkdir gpg
cd gpg
sudo wget https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.22.tar.bz2
sudo wget https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.22.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "c40015ed88bf5f50fa58d02252d75cf20b858951" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
sudo tar xvjf **.tar.bz2
cd libgp**
./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig && sudo rm -r libgp**

sudo wget https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.7.0.tar.bz2
sudo wget https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.7.0.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "f840b737faafded451a084ae143285ad68bbfb01" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
sudo tar xvjf **.tar.bz2
cd libgcr**
./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig && sudo rm -r libgcr**

sudo wget https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.3.4.tar.bz2
sudo wget https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.3.4.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "bc84945400bd1cabfd7b8ba4e20e71082f32bcc9" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
sudo tar xvjf **.tar.bz2
cd libks**
./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig && sudo rm -r libks**

sudo wget https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.4.2.tar.bz2
sudo wget https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.4.2.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "ac1047f9764fd4a4db7dafe47640643164394db9" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
sudo tar xvjf **.tar.bz2
cd libas**
./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig && sudo rm -r libas**

sudo wget https://www.gnupg.org/ftp/gcrypt/npth/npth-1.2.tar.bz2
sudo wget https://www.gnupg.org/ftp/gcrypt/npth/npth-1.2.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "3bfa2a2d7521d6481850e8a611efe5bf5ed75200" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
sudo tar xvjf **.tar.bz2
cd npth**
./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig && sudo npth**

sudo wget https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.1.12.tar.bz2
sudo wget https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.1.12.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "3b01a35ac04277ea31cc01b4ac4e230e54b5480c" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
sudo tar xvjf **.tar.bz2
cd gnupg**
./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig && sudo rm -r gnupg**

sudo wget https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.6.0.tar.bz2
sudo wget https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.6.0.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "f840b737faafded451a084ae143285ad68bbfb01" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
sudo tar xvjf **.tar.bz2
cd gpgm**
./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig && sudo rm -r gpgm**

sudo wget https://www.gnupg.org/ftp/gcrypt/gpa/gpa-0.9.9.tar.bz2
sudo wget https://www.gnupg.org/ftp/gcrypt/gpa/gpa-0.9.9.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "1cf86c9e38aa553fdb880c55cbc6755901ad21a4" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
sudo tar xvjf **.tar.bz2
cd gpa**
./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig && sudo rm -r gpa**

cd ..
sudo rm -r gpg

##Github
sudo apt-get install git -y 
git config --global credential.helper cache
# Set git to use the credential memory cache
git config --global credential.helper 'cache --timeout=3600'
# Set the cache to timeout after 1 hour (setting is in seconds)
while true; do
    read -p "Please set your username: " username $username
    git config --global user.name $username
    break
done
while true; do
    read -p "Please set your email: " mail $mail
    git config --global user.email $mail
    break
done

while true; do
    read -p "Please set your core editor: " editor $editor
    git config --global core.editor $editor
    break
done
while true; do
    read -p "Please set your diff app: " diff $diff
    git config --global merge.tool $diff
    break
done
git config --list
echo "Here you are an excellent Github cheatsheet https://raw.githubusercontent.com/hbons/git-cheat-sheet/master/preview.png You can also access as gitsheet"
echo "If you get stuck, run ‘git branch -a’ and it will show you exactly what’s going on with your branches. You can see which are remotes and which are local."
read -p "Do not forget to add a newsshkey or clipboard your mysshkey or mylastsshkey (if you switchsshkey before) and paste it on Settings -> New SSH key and paste it there." $pause

sh -c "curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh"
echo "installed vimcr"
wget https://raw.githubusercontent.com/Russell91/sshrc/master/sshrc && sudo chmod -R 600 sshrc && chmod +x sshrc && sudo mv sshrc /usr/local/bin
echo "ssh bashcr vimcr portability installed"

##Emacs
sudo rm -r /usr/local/stow
set -e
readonly version="24.5"
# install dependencies
sudo apt-get install -y stow build-essential libx11-dev xaw3dg-dev libjpeg-dev libpng12-dev libgif-dev libtiff5-dev libncurses5-dev libxft-dev librsvg2-dev libmagickcore-dev libmagick++-dev libxml2-dev libgpm-dev libghc-gconf-dev libotf-dev libm17n-dev  libgnutls-dev -y
# download source package
sudo wget http://ftp.gnu.org/gnu/emacs/emacs-"$version".tar.xz
sudo tar xvf emacs-"$version".tar.xz
# build and install
sudo mkdir -p /usr/local/stow
cd emacs-"$version"
./configure \
    --with-xft \
    --with-x-toolkit=lucid
sudo make
sudo rm -r /usr/local/stow
sudo make install prefix=/usr/local/stow/emacs-"$version" && cd /usr/local/stow
sudo rm /usr/local/share/info/dir
sudo stow emacs-"$version" 
#spacemacs & plugins
sudo mkdir .emacs.d
sudo mkdir .emacs
sudo git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo wget https://github.com/ethereum/emacs-solidity/blob/master/solidity-mode.el ##solidity
sudo emacs --insecure
cd
sudo rm -r emacs-**
#emacsbrowser
git clone http://repo.or.cz/r/conkeror.git
cd conkeror
make
sudo make install
cd ..
sudo rm -r conkeror

##Geth
echo "Geth"
cd linux
wget https://github.com/ethereum/go-ethereum/releases/download/v1.4.18/geth-linux-amd64-1.4.18-ef9265d0.tar.gz
tar -zxvf geth**.tar.gz
sha1 = $(sha1sum geth**.tar.gz)
if [ $sha1 "efbace0ef748974becd563803b518965f1567de55b51a444d54a619ed3dae612" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
read -p "Please ENTER if PACKAGE VERIFIED. Otherwise Ctrl-C " pause
sudo rm geth**.tar.gz
./geth

#Ethr
sudo apt-get install gfortran aptitude libghc-curl-dev liblzma-dev -y 
sudo aptitude install r-base -y
sudo aptitude install openjdk-7-source -y
sudo updatedb
sudo wget https://cran.r-project.org/src/base-prerelease/R-latest.tar.gz
tar -xvzf R-latest.tar.gz Rfolder
sudo rm -r -f R-latest.tar.gz
cd Rfolder
sudo wget  ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre2-10.20.tar.bz2
sudo wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre2-10.20.tar.bz2.sig
sudo gpg --verify prce**sig pcre**bz2
sudo bzip2 -d pcre**bz2
sudo tar -xvf pcre**tar
sudo rm pcre**.bz2 pcre**.bz2.sig pcre**.tar
cd pcre**
sudo ./configure --prefix=$HOME/$USER/R**
sudo make -j3
sudo make install
cd ..
./configure --prefix=$HOME/$USER/Rfolder '--with-cairo' \
 '--with-jpeglib' '--with-readline' '--with-tcltk' \
 '--with-blas' '--with-lapack' '--enable-R-profiling' \
 '--enable-R-shlib' \
 '--enable-memory-profiling'
sudo make
sudo make install
echo "install Geth if you want to see EthR working"
cd
sudo wget https://www.mpfr.org/mpfr-current/mpfr-3.1.4.zip
sudo wget https://www.mpfr.org/mpfr-current/mpfr-3.1.4.tar.xz.asc
gpg --recv-keys 98C3739D
gpg --verify mpfr**.asc
sudo unzip mpfr**
sudo rm -r -f mpfr**.zip
sudo rm -r -f mpfr**.asc
cd mpfr**
./configure
sudo make
sudo make install

echo ' *****************
Install those packages in R. To exit type quit()
setRepositories()
install.packages("Rmpfr", repos="http://cran.cnr.berkeley.edu")
install.packages("devtools", repos="http://cran.cnr.berkeley.edu")
devtools::install_github("BSDStudios/ethr")
install.packages("plyr", repos="http://cran.cnr.berkeley.edu")
install.packages("dplyr", repos="http://cran.cnr.berkeley.edu")
install.packages("httr", repos="http://cran.cnr.berkeley.edu")
install.packages("igraph", repos="http://cran.cnr.berkeley.edu")
install.packages("gmp", repos="http://cran.cnr.berkeley.edu")

Install those packages in R. To exit type quit()' 
sudo R

##Nodejs & NPM 
cd /usr/local

sudo apt-get purge npm nodejs -y
sudo apt-get build-dep nodejs -y
sudo npm build-dep npm -g
versionnpm=v6.8.0
sudo wget $(echo "https://nodejs.org/dist/"$versionnpm"/node-$versionnpm-linux-x64.tar.xz")
gpg --keyserver pool.sks-keyservers.net --recv-keys DD8F2338BAE7501E3DD5AC78C273792F7D83545D
sudo wget $(echo "https://nodejs.org/dist/"$versionnpm"/SHASUMS256.txt.asc")
gpg --verify SHASUMS256.txt.asc
sudo rm SHASUM**
sudo tar --strip-components 1 -xf /usr/local/node**.tar.xz
npm init -y
cd
npm init -y
sudo npm install error-stack-parser lodash minimatch graceful-fs secp256k1 fs-extra

##Meteor & Web3 Library & Atmosphere
curl https://install.meteor.com/ | sh
meteor create mydapp
cd mydapp
sudo npm install -g harp
meteor add ethereum:web3
meteor add mrt:moment
cd

##Dapple
sudo npm uninstall parse-stack
sudo npm install error-stack-parser lodash minimatch graceful-fs secp256k1 fs-extra
sudo npm install -g dapple leveldown
mkdir myapp
cd mydapp
dapple init
dapple --help
cd

#Uglify
git clone git://github.com/mishoo/UglifyJS2.git
cd UglifyJS2
sudo npm link .
cd
sudo rm -r UglifyJS2

#Grunt for js
sudo npm install -g grunt-cli
#Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript: grunt.loadNpmTasks('grunt-contrib-watch');
sudo npm install grunt-contrib-watch --save-dev
#Once that's done, add this line to your project's Gruntfile: grunt.loadNpmTasks('grunt-embark');
sudo npm install embark --save-dev
sudo npm install grunt-embark --save-dev
#And so on
sudo npm install grunt-contrib-clean --save-dev
sudo npm install grunt-contrib-jshint --save-dev
sudo npm install grunt-contrib-copy --save-dev
sudo npm install grunt-contrib-uglify --save-dev
sudo npm install grunt-mkdir --save-dev
#those have different flavours https://www.npmjs.com/package/grunt-shell
sudo npm install --save-dev grunt-shell
#https://www.npmjs.com/package/grunt-contrib-htmlmin
sudo npm install grunt-contrib-htmlmin --save-dev

##Other npm
sudo npm install -g jshint
sudo npm install -g coffeescript-compiler
sudo npm install -g coffee-script

##npm JS React Boilerplate
sudo npm cheerio
git clone --depth=1 https://github.com/mxstbr/react-boilerplate.git
cd react**
sudo npm run setup
cd
##MongoDB
sudo npm install mongodb

##Frameworks
sudo npm -g install embark-framework
sudo npm install -g truffle
#Install solidity compiler
sudo npm install solc


##Contracts
git clone https://github.com/ethereum/dapp-bin

#Text Edition Tools
sudo apt-get install unoconv -y
sudo apt-get install detox -y
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y 
sudo apt-get update -y
sudo apt-get install vim vim-scripts -y
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
sudo apt-get install gedit -y
sudo apt-get install sublime-text-installer -y
sudo apt-get install libreoffice -y
wget http://www.literatureandlatte.com/scrivenerforlinux/scrivener-1.9.0.1-amd64.deb
sudo dpkg -i scrivener**
sudo rm scrivener**

##readthedocs
sudo apt-get install build-essential python-dev python-pip python-setuptools python-virtualenv libxml2-dev libxslt1-dev zlib1g-dev -y
sudo pip install --upgrade pip
virtualenv rtd
cd rtd
source bin/activate
git clone https://github.com/rtfd/readthedocs.org.git
cd readthedocs.org
sudo pip install -r requirements.txt
sudo easy_install --upgrade pip
sudo pip uninstall pyopenssl
sudo pip install mozdownload
sudo ./manage.py migrate
sudo ./manage.py createsuperuser
sudo ./manage.py collectstatic
#sudo ./manage.py loaddata test_data
#sudo ./manage.py update_repos pip
echo "alias readthedocs='sudo ./manage.py runserver && firefox -new-tab -url http://127.0.0.1:8000'" >> /etc/bash.bashrc

##Automatic Django Project setup, with git, heroku, rvmrc, coffeescript, less, automatic deployment, and many more features from https://github.com/andres-torres-marroquin/django-sparker
curl -L https://raw.github.com/andres-torres-marroquin/django-sparker/master/sparker.sh | bash -s stable

##Jaxx
wget https://jaxx.io/files/1.0.5/Jaxx-v1.0.5-linux-x64.tar.gz
sha1sum Jaxx-v1.0.5-linux-x64.tar.gz d0d74e52d2e8e654d27a6653ed058b412b52d583
tar -xvzf Jaxx**.tar.gz
sudo rm -r -f Jaxx**.tar.gz

##Icecold
git clone https://github.com/ryepdx/ethaddress.org
cd ethaddress.org
gpg --verify ryep**.asc
cd ..
echo "alias coldstorage = 'cd /home/$USER/ethaddress.org && firefox -new-tab -url index.html'"
git clone https://github.com/pointbiz/bitaddress.org
cd bitaddress.org
gpg --verify CHANGE**.asc
cd ..
git clone https://github.com/litecoin-project/liteaddress.org
cd liteaddress.org
gpg --verify CHANGE**.asc
cd ..


##Electrum
sudo apt-get install python-qt4 python-pip -y
sudo pip install https://download.electrum.org/2.6.4/Electrum-2.6.4.tar.gz

##Ruby Version Manager (RVM) with Ruby on Rails
#RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems.
sudo apt-get install -y git-core subversion gnupg2
curl -sSL https://get.rvm.io | bash -s stable --rails --ruby
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer
curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc
sudo gpg --verify rvm-installer.asc 
sudo curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
bash rvm-installer stable
rvm list
rvm rubies

#https://github.com/Nerian/simple_gemset
sudo gem install simple_gemset
##Bundler provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed. 
sudo gem install bundler
#Etherum
sudo gem install ethereum
##Install ribbot
git clone https://github.com/barmstrong/ribbot
cd ribbot
bundle install
git add Gemfile Gemfile.lock
cd
rvm list
rvm rubies

##Mail
sudo apt-get install mailutils ssmtp -y
read -p "Email Configuration for a mail integrated on terminal. Introduce email  \n" emmail
read -p "Password  \n" Passs
read -p "SMTP. Gmail uses smtp.gmail.com:587    \n" SMTP
sudo sed -i 's/#FromLineOverride=YES/FromLineOverride=YES \AuthUser=$emmail \AuthPass=$Passs \mailhub=$SMTP \UseSTARTTLS=YES/g' /etc/ssmtp/ssmtp.conf

#Other browsers
wget https://ftp.opera.com/pub/opera-developer/41.0.2349.0/linux/opera-developer_41.0.2349.0_amd64.deb
sudo dpkg -i opera**.deb
sudo rm opera**.deb
wget http://www.srware.net/downloads/iron64.deb

sudo dpkg -i iron64.deb
sudo rm iron64.deb
echo "alias iron='/usr/share/iron/iron'" >> sudo /etc/bash.bashrc

wget https://ftp.gnu.org/gnu/icecat/38.8.0-gnu2/icecat-38.8.0.en-US.linux-x86_64.tar.bz2
wget https://ftp.gnu.org/gnu/icecat/38.8.0-gnu2/icecat-38.8.0.en-US.linux-x86_64.tar.bz2.sig
gpg --output icecat**tar.bz2 --decrypt icecat**tar.bz2.sig
tar -jxvf **tar.bz2

wget http://downloads.sourceforge.net/project/dooble/Version%201.56b/dooble-master.zip


#IPFS 
wget https://dist.ipfs.io/go-ipfs/v0.4.3/go-ipfs_v0.4.3_linux-amd64.tar.gz
tar -zxvf go-ipfs**tar.gz
rm go-ipfs**tar.gz
cd go-ipfs
sudo sh install.sh 

#Go
cd /usr/local
sudo wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz
sudo tar -zxvf go1**.tar.gz
export PATH=$PATH:/usr/local/go/bin


#FTP VSFTPD
wget https://security.appspot.com/downloads/vsftpd-3.0.3.tar.gz
wget https://security.appspot.com/downloads/vsftpd-3.0.3.tar.gz.asc
gpg --keyserver pgpkeys.mit.edu --recv-key 3C0E751C
gpg --with-fingerprint vsftpd**.asc
sudo rm vsftpd**.asc
read "Is verified?" pause
tar xvzf vsftpd**.tar.gz
sudo rm vsftpd-**tar.gz
cd vsftpd**
make
sudo cp -r /usr/share/man/man5/ /usr/local/man/man5
sudo cp /usr/local/sbin/vsftpd /usr/sbin/vsftpd
sudo make install
cd ..

