require 'spec_helper'

describe 'awskit::create_linux_node' do
  let(:params) do
    {
      'instance_name' => 'my-instance-name',
      'count'         => 1,
    }
  end

  # it { pp catalogue.resources }
  it { is_expected.to compile }

  context 'count => 1' do
    it {
      # binding.pry
      is_expected.to contain_awskit__create_host("#{params['instance_name']}-1")
    }
  end

  context 'count => 2' do
    let(:params) do
      super().merge('count' => '2')
    end

    it {
      # binding.pry
      is_expected.to contain_awskit__create_host("#{params['instance_name']}-1")
      is_expected.to contain_awskit__create_host("#{params['instance_name']}-2")
    }
  end
end
