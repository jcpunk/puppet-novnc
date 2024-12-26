# frozen_string_literal: true

require 'spec_helper'

describe 'novnc' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('novnc::install') }
      it { is_expected.to contain_class('novnc::config').that_requires('Class[novnc::install]') }
      it { is_expected.to contain_class('novnc::config').that_notifies('Class[novnc::service]') }
      it { is_expected.to contain_class('novnc::install').that_notifies('Class[novnc::service]') }
    end
  end
end
