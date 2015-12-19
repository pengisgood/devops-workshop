* 解压 zip
* cd devops-workshop

devops-workshop
  |_ package
  |   |_ jdk-xxx.gz
  |_ provisioning
      |_ playbook.yml
      |_ hosts

检查 vagrant 是否安装好
vagrant --version
vagrant box add mybox ./package/devops-ubuntu.box
vagrant init mybox
vagrant up
vagrant ssh
vagrant reload



安装ansible： http://docs.ansible.com/ansible/intro_installation.html#installing-the-control-machine

sudo easy_install pip
sudo pip install ansible

检查 ansible 是否安装成功

vagrant provision


