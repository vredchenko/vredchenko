#!/usr/bin/env bash

# Ref: https://kifarunix.com/how-to-install-kvm-on-ubuntu-24-04/

# KVM runs on systems equipped with Intel or AMD processors. You need to verify if this support
# is already enabled on your system by executing the command below.
# The command looks for the CPU flags; Intel vmx (Virtual Machine Extension) or AMD svm (Secure virtual Machine).
# If the command output is empty, find out how to enable virtualization on your respective machine BIOS.
#grep --color -iE 'vmx|svm' /proc/cpuinfo

# Similarly, you can use the command below to check Virtualization support.
#lscpu | grep Virtualization

# You can also use the cpu-checker, kvm-ok, command to check if the system has virtualization support enabled.
sudo apt update
sudo apt install -y cpu-checker
kvm-ok

# Install KVM on a system with GUI
sudo apt install -y virt-manager qemu-system libvirt-daemon-system qemu-utils

# If you are running an headless server with no GUI, then it suffices to just run the command below
#sudo apt install qemu-system libvirt-daemon-system virtinst qemu-utils

# Once the installation is done, check if KVM modules are loaded
lsmod | grep -i kvm

# Thus, start and enable this service to run on system boot
sudo systemctl enable --now libvirtd

# Check the status
systemctl status libvirtd

# add the standard user to libvirt and kvm group
sudo usermod -aG libvirt,kvm "${USER}"
