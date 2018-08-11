sudo yum install -y epel-release
sudo yum install -y lrzsz python-devel python-pip gcc git tmux java-1.8.0-openjdk the_silver_searcher htop
sudo pip install -U pip -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com
sudo pip install ansible virtualenv -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com

echo "DNS1=8.8.8.8" | sudo tee -a /etc/sysconfig/network-scripts/ifcfg-enp0s3
mkdir -p /home/vagrant/github
mkdir -p /home/vagrant/venv


ANSIBLE_UTIL='/home/vagrant/github/ansible-playground'
if [ ! -d "$ANSIBLE_UTIL" ]; then
    git clone -b vagrant https://github.com/harrifeng/ansible-playground.git ${ANSIBLE_UTIL}
    PASSWD=vagrant
    bash ${ANSIBLE_UTIL}/install.sh
fi

UTIL_BINARY='/home/vagrant/github/binary'
if [ ! -d "$UTIL_BINARY" ]; then
    git clone -b vagrant https://github.com/harrifeng/binary.git ${UTIL_BINARY}
    bash ${UTIL_BINARY}/amd64/dot-cow/prepare.sh
fi

DOT_FILES='/home/vagrant/github/dotfiles'
if [ ! -d "$DOT_FILES" ]; then
    git clone -b vagrant https://github.com/harrifeng/dotfiles.git ${DOT_FILES}
    bash ${DOT_FILES}/run.sh
fi


chown -R vagrant:vagrant /home/vagrant/github
echo "<----------finishing provision--------------->"
