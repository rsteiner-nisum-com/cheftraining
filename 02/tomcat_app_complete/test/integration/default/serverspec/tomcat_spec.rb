require 'serverspec'

set :backend, :exec

describe command("curl -L localhost:8080 | grep 'Hello from tomcat :)'") do
  its(:exit_status) { should eq 0 }
end

describe service('tomcat6') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/var/lib/tomcat6/webapps/ROOT/index.html') do
  it { should be_file }
  its(:content) { should match 'Hello from tomcat :)' }
end

describe port('8080') do
  it { should be_listening }
end
