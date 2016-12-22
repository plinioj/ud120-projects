#!/usr/bin/env bash

apt-get update


anaconda=Anaconda2-4.2.0-Linux-x86_64.sh
cd /vagrant
if [[ ! -f $anaconda ]]; then
    wget --quiet http://repo.continuum.io/archive/$anaconda
fi
chmod +x $anaconda
./$anaconda -b -p /opt/anaconda

cat >> /home/vagrant/.bashrc << END
# add for anaconda install
PATH=/opt/anaconda/bin:\$PATH
END

apt-get install -y python-pip

cd /vagrant

jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser titanic_survival_exploration.ipynb


#Enrol dataset....
#https://www.cs.cmu.edu/~./enron/enron_mail_20150507.tgz