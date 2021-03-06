require 'spec_helper'

describe 'elasticsearch', :type => :class do
  let(:title) { 'elasticsearch::install' }

  context 'with default parameters' do
    it { should_not contain_aptrepo__addrepo('elasticsearch')
        .with_location('http://packages.elasticsearch.org/elasticsearch/1.6/debian/')
        .with_key('http://packages.elasticsearch.org/GPG-KEY-elasticsearch')
    }

    it { should contain_package('elasticsearch')
        .with_ensure('present')
    }
  end

  context 'architecture => amd64' do
    let(:facts) { {:architecture => 'amd64'} }

    it { should contain_aptrepo__addrepo('elasticsearch')
        .with_location('http://packages.elasticsearch.org/elasticsearch/1.6/debian/')
        .with_key('http://packages.elasticsearch.org/GPG-KEY-elasticsearch')
    }
  end

  context 'architecture => i386' do
    let(:facts) { {:architecture => 'i386'} }

    it { should contain_aptrepo__addrepo('elasticsearch')
        .with_location('http://packages.elasticsearch.org/elasticsearch/1.6/debian/')
        .with_key('http://packages.elasticsearch.org/GPG-KEY-elasticsearch')
    }
  end

  context 'architecture => armv7l' do
    let(:facts) { {:architecture => 'amdv7l'} }

    it { should_not contain_aptrepo__addrepo('elasticsearch')
        .with_location('http://packages.elasticsearch.org/elasticsearch/1.6/debian/')
        .with_key('http://packages.elasticsearch.org/GPG-KEY-elasticsearch')
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
