sudo yum install -y epel-release
sudo yum install -y lrzsz python-devel python-pip gcc git tmux java-1.8.0-openjdk the_silver_searcher htop
sudo pip install -U pip -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com
sudo pip install ansible virtualenv -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com

echo "DNS1=8.8.8.8" | sudo tee -a /etc/sysconfig/network-scripts/ifcfg-enp0s3
echo "<----------finishing provision--------------->"
