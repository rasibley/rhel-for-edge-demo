#!/usr/bin/env bash

USER=$1
PASS=$2

subscription-manager register --username $USER --password $PASS
subscription-manager role --set="Red Hat Enterprise Linux Server"
subscription-manager service-level --set="Self-Support"
subscription-manager usage --set="Development/Test"
subscription-manager attach

sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm; sudo dnf config-manager --set-enabled epel
sudo dnf install -y ansible jq qemu-img qemu-kvm libvirt-client libvirt-daemon-kvm virt-install git
git clone https://github.com/virt-s1/rhel-edge.git; cd rhel-edge
chmod 600 key/ostree_key
./ostree.sh

echo "Done"
