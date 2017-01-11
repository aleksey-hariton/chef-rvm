package 'sudo'

user 'teddy' do
  home '/home/teddy'
  shell '/bin/bash'
  manage_home true
  action :create
end

cookbook_file '/rvm_cmd' do
  source 'rvm_cmd'
  mode 0755
end

include_recipe 'rvm::system'
include_recipe 'rvm::user'

rvm_gem 'git'
