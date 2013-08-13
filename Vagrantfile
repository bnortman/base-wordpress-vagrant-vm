Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.synced_folder "_shared/", "/var/_shared/"

  config.vm.provision :shell, :inline => "apt-get clean; apt-get update" 

  config.vm.provision :chef_solo do |chef|

    chef.json = {
      "mysql" => {
      "server_root_password" => "myrootpwd",
      "server_repl_password" => "myrootpwd",
      "server_debian_password" => "myrootpwd"
      },
      "wordpress" => {
        "db" => {
          "database" => "wordpress",
          "user" => "wordpress",
          "password" => "mywppassword"
        }
      }
    }

    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe "wordpress"
    chef.add_recipe "apache2::mod_rewrite"
  end
end