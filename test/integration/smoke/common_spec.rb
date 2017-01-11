require_relative '../spec_helper'

check_ruby_version('root', '1.9.3')
check_rvm_version('root', '1.28.0')

check_rvm_version('teddy', '1.27.0')
# YOHOO, rvm didn't setup default RVM for user =/
check_ruby_version('teddy', '1.8.7')
