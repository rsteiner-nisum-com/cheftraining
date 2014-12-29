require 'spec_helper'

describe 'tomcat_app::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge('tomcat_app::default') }

  subject { chef_run }

  it { is_expected.to include_recipe 'java' }
  it { is_expected.to include_recipe 'tomcat' }
  it { is_expected.to create_directory '/var/lib/tomcat6/webapps/ROOT' }

  it 'creates index.html' do
    expect(chef_run).to create_file('/var/lib/tomcat6/webapps/ROOT/index.html')
      .with(content: /Hello from tomcat :\)/)
  end
end
