# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.ssh.insert_key = false

  config.vm.define :highSierra do |node|
    node.vm.box = 'osx-high-sierra-10.13.2'
    node.vm.box_check_update = false
    node.vm.network :forwarded_port, guest: 22, host: 2001, id: 'ssh'
    node.vm.network :private_network, ip: '192.168.33.11'
    node.vm.synced_folder '.', '/vagrant', type: 'nfs', nfs: true

    node.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'playbook/playbook.yml'
      ansible.compatibility_mode = '2.0'
    end
  end
end
