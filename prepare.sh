sudo yum install -y epel-release
sudo yum install -y lrzsz python-devel python-pip gcc git tmux java-1.8.0-openjdk the_silver_searcher htop
sudo pip install -U pip -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com
sudo pip install ansible virtualenv -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com

echo "DNS1=8.8.8.8" | sudo tee -a /etc/sysconfig/network-scripts/ifcfg-enp0s3
mkdir -p /home/vagrant/github
ANSIBLE_UTIL='/home/vagrant/github/ansible-playground'

if [ ! -d "$ANSIBLE_UTIL" ]; then
    git clone https://github.com/harrifeng/ansible-playground.git /home/vagrant/github/ansible-playground
fi

ansible-playbook -i ${ANSIBLE_UTIL}/etc_ansible_hosts ${ANSIBLE_UTIL}/00-install-common/common.yml --extra-vars "variable_host=localhost ansible_become_pass=vagrant"
echo "<----------finishing provision--------------->"
