sudo yum install -y epel-release
sudo yum install -y python-devel python-pip gcc git
echo "pip----------->"
sudo pip install -U pip -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com
sudo pip install ansible -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com
echo "finishing provision--------------->"