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

    node.vm.provision 'shell' do |shell|
      shell.privileged = true
      shell.inline = <<-SCRIPT
        curl -o - 'https://bootstrap.pypa.io/get-pip.py' | python
        pip install ansible
      SCRIPT
    end

    node.vm.provision 'ansible_local' do |ansible|
      ansible.playbook = '/vagrant/playbook/playbook.yml'
    end
  end
end
