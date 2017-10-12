# login : root password : hdp-master

yum update -y
yum install wget -y

systemctl disable firewalld
systemctl stop firewalld

vi /etc/hosts


ssh-keygen

####
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
159.84.146.112 master.ctest master m
159.84.146.171 slave1.ctest slave1 s1
159.84.146.135 slave2.ctest slave2 s2
####

cat /etc/hosts | ssh root@slave1 'cat > /etc/hosts'


cat ~/.ssh/id_rsa.pub | ssh root@slave1 'mkdir ~/.ssh && cat >> .ssh/authorized_keys'
cat ~/.ssh/id_rsa.pub | ssh root@master 'cat >> .ssh/authorized_keys'
ssh root@slave1 'ambari-agent restart'

wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.5.2.0/ambari.repo -O /etc/yum.repos.d/ambari.repo

yum install ambari-server -y

ambari-server setup
y
y
root
y
1
n

ambari-server start
ambari-server status




psql -Uambari ambari
#mot de passe : bigdata

update ambari.users set user_password='538916f8943ec225d97a9a86a2c6ec0818c1cd400e09e03b660fdaaec4af29ddbb6f2b1033b81b00' where user_name='admin'

ambari-server restart

ssh-keygen

mkdir -m 700 /root/.ssh

echo "<<MA CLE>>" >  ~/.ssh/authorized_keys

hostname slave1.hdpae #sur slave1

vi /etc/ambari-agent/conf/ambari-agent.ini
# mettre à jour la ligne suivante, sur chaque machine !
hostname = master.hdpae
