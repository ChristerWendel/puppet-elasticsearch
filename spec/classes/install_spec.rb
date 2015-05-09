require 'spec_helper'

describe 'elasticsearch', :type => :class do
  let(:title) { 'elasticsearch::install' }

  context 'with default parameters' do
    it { should contain_aptrepo__addrepo('elasticsearch')
        .with_location('http://packages.elasticsearch.org/elasticsearch/1.4/debian/')
        .with_key('http://packages.elasticsearch.org/GPG-KEY-elasticsearch')
    }

    it { should contain_package('elasticsearch')
        .with_ensure('present')
    }
  end

  context 'version => present' do
    let(:params) { {:version => 'present'} }

    it { should contain_package('elasticsearch')
        .with_ensure('present')
    }
  end

  context 'version => latest' do
    let(:params) { {:version => 'latest'} }

    it { should contain_package('elasticsearch')
        .with_ensure('latest')
    }
  end
end
