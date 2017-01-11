def rvm_command user, cmd
  %Q(/rvm_cmd sudo -u #{user} -i "#{cmd}")
end

# Version
def check_ruby_version user, version
  describe command(rvm_command(user, 'ruby --version')) do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match(/ruby #{version}p/) }
    its(:stderr) { should eq '' }
  end
end

# Version
def check_rvm_version user, version
  describe command(rvm_command(user, 'rvm version')) do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match(/rvm #{version} \(/) }
    its(:stderr) { should eq '' }
  end
end
