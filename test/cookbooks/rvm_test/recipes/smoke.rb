user 'teddy' do
  home '/home/teddy'
  shell '/bin/bash'
  manage_home true
  action :create
end

include_recipe 'rvm::system'
include_recipe 'rvm::user'

rvm_gem 'git'
