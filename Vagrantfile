Vagrant.configure("2") do |config|
    config.vagrant.plugins= ["vagrant-env"]
    config.vm.box = "generic/rhel8"
    config.env.enable
    config.vm.provision :shell, path: "bootstrap.sh", 
         args: "#{ENV['USER']} #{ENV['PASS']}"
    config.vm.network "forwarded_port", guest: 9090, host: 9091
    # enable nested virtualization
    config.vm.provider :libvirt do |vm|
         vm.memory = 8192
         vm.cpus = 4
         vm.nested = true
    end
end
