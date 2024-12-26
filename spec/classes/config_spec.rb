# frozen_string_literal: true

require 'spec_helper'

describe 'novnc::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'when using defaults' do
        it { is_expected.to compile }
        it {
          is_expected.to contain_file('/etc/websockify')
            .with_ensure('directory')
            .with_owner('root')
            .with_group('novnc')
            .with_mode('0640')
        }
        it {
          is_expected.to contain_file('/etc/websockify/tokens.cfg')
            .with_ensure('file')
            .with_owner('root')
            .with_group('novnc')
            .with_mode('0640')
        }
        it {
          is_expected.to contain_exec('/bin/mkdir -p /var/www')
            .with_before('File[/var/www/novnc_users_list.html]')
            .with_creates('/var/www')
        }
        it {
          is_expected.to contain_file('/var/www/novnc_users_list.html')
            .with_ensure('file')
            .with_owner('root')
            .with_group('root')
            .with_mode('0644')
        }
      end

      context 'with interesting arguments' do
        let(:params) do
          {
            'websockify_config_dir' => '/tmp',
            'websockify_config_mode' => '0777',
            'websockify_token_plugin' => 'TokenFile',
            'websockify_token_source' => '/tmp/thing',
            'websockify_service_user' => 'test_user',
            'websockify_service_group' => 'test_group',
            'webserver_novnc_location' => '/some/path',
            'webserver_vnc_index' => '/tmp/index',
            'vnc_servers' => { 'a' => '127.0.0.1:5900', 'd' => 'localhost:1', 'c' => '127.0.0.1:12' },
          }
        end

        it { is_expected.to compile }
        it {
          is_expected.to contain_file('/tmp')
            .with_ensure('directory')
            .with_owner('root')
            .with_group('test_group')
            .with_mode('0777')
        }
        it {
          is_expected.to contain_file('/tmp/thing')
            .with_ensure('file')
            .with_owner('root')
            .with_group('test_group')
            .with_mode('0777')
            .with_content(%r{1f188168: 127.0.0.1:5900})
            .with_content(%r{37543173: localhost:5901})
            .with_content(%r{a2cafec2: 127.0.0.1:5912})
        }
        it {
          is_expected.to contain_exec('/bin/mkdir -p /tmp')
            .with_before('File[/tmp/index]')
            .with_creates('/tmp')
        }
        it {
          is_expected.to contain_file('/tmp/index')
            .with_ensure('file')
            .with_owner('root')
            .with_group('root')
            .with_mode('0644')
            .with_content(%r{^<li><a href="/some/path/vnc.html\?resize=remote&path=/some/path/websockify\?token=1f188168">a</a></li>$})
            .with_content(%r{^<li><a href="/some/path/vnc.html\?resize=remote&path=/some/path/websockify\?token=a2cafec2">c</a></li>$})
            .with_content(%r{^<li><a href="/some/path/vnc.html\?resize=remote&path=/some/path/websockify\?token=37543173">d</a></li>$})
        }
      end
    end
  end
end
