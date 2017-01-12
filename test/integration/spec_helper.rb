def rvm_command user, cmd
  %Q(su -l -c #{Shellwords.escape(cmd)} #{user})
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

def run_nokogiri_openssl_test(user, ruby)
  script = "require 'nokogiri'; puts Nokogiri::HTML(open('https://google.com/')).css('input')"

  describe command(rvm_command(user, "rvm #{ruby} do gem install nokogiri --no-ri --no-rdoc")) do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match(/XXX/) }
    its(:stderr) { should eq '' }
  end

  describe command(rvm_command(user, %Q(rvm #{ruby} do ruby -rrubygems -ropen-uri -e "#{script}"))) do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match(/XXX/) }
    its(:stderr) { should eq '' }
  end
end