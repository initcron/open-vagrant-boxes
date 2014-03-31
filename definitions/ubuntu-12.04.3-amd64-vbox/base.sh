set -ex

# Apt-install various things necessary for Ruby, guest additions,
# etc., and remove optional things to trim down the machine.
apt-get -y update
apt-get -y upgrade
apt-get -y install build-essential linux-headers-$(uname -r)
apt-get -y install vim curl
apt-get clean

# Set up sudo
( cat <<'EOP'
%vagrant ALL=NOPASSWD:ALL
EOP
) > /tmp/vagrant
chmod 0440 /tmp/vagrant
mv /tmp/vagrant /etc/sudoers.d/

# Install NFS client
apt-get -y install nfs-common

#Install some additional useful packages
apt-get install -y git curl wget python-yaml libssl-dev

# Set Locale
locale-gen en_US.UTF-8
