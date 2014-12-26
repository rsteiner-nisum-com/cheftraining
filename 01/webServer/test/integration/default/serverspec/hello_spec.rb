require 'serverspec'

set :backend, :exec

describe command("curl -L localhost | grep 'hello from'") do
  its(:exit_status) { should eq 0 }
end
