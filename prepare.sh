sudo yum install -y epel-release
sudo yum install -y lrzsz python-devel python-pip gcc git tmux java-1.8.0-openjdk the_silver_searcher htop
sudo pip install -U pip -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com
sudo pip install ansible virtualenv -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com

mkdir -p /home/vagrant/github
cd /home/vagrant/github
git clone https://github.com/harrifeng/dotfiles.git
ln -s /home/vagrant/dotfiles/tmux/dot_tmux.conf /home/vagrant/.tmux.conf
ln -s /home/vagarnt/dotfiles/git/dot_gitconfig /home/vagrant/.gitconfig
ln -s /home/vagarnt/dotfiles/ansible/dot_ansible.cfg /home/vagrant/.ansible.cfg
ln -s /home/vagrant/dotfiles/vagrant/dot_ssh/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub

git clone https://github.com/harrifeng/ansible-playground.git

cd /home/vagrant/github/ansible-playground/04-install-new-git-on-centos
echo 'vagrant' | bash run.sh

echo "DNS1=8.8.8.8" | sudo tee -a /etc/sysconfig/network-scripts/ifcfg-enp0s3
echo "<----------finishing provision--------------->"
