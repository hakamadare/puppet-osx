require 'spec_helper'

describe 'osx::global::screenshots' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'default' do
    it do
      should contain_boxen__osx_defaults('Manage screenshot location').with({
        :key    => 'location',
        :domain => 'com.apple.screencapture',
        :value  => '~/Desktop',
        :user   => facts[:boxen_user]
      })

      should contain_boxen__osx_defaults('Manage screenshot type').with({
        :key    => 'type',
        :domain => 'com.apple.screencapture',
        :value  => 'png',
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'location' do
    let(:params) { {:location => '~/Pictures/Screenshots'} }
    it do
      should contain_boxen__osx_defaults('Manage screenshot location').with({
        :key    => 'location',
        :domain => 'com.apple.screencapture',
        :value  => '~/Pictures/Screenshots',
        :user   => facts[:boxen_user]
      })

      should contain_boxen__osx_defaults('Manage screenshot type').with({
        :key    => 'type',
        :domain => 'com.apple.screencapture',
        :value  => 'png',
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'type' do
    let(:params) { {:type => 'jpg'} }
    it do
      should contain_boxen__osx_defaults('Manage screenshot location').with({
        :key    => 'location',
        :domain => 'com.apple.screencapture',
        :value  => '~/Desktop',
        :user   => facts[:boxen_user]
      })

      should contain_boxen__osx_defaults('Manage screenshot type').with({
        :key    => 'type',
        :domain => 'com.apple.screencapture',
        :value  => 'jpg',
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'location and type' do
    let(:params) { {:location => '~/Pictures/Screenshots', :type => 'jpg'} }
    it do
      should contain_boxen__osx_defaults('Manage screenshot location').with({
        :key    => 'location',
        :domain => 'com.apple.screencapture',
        :value  => '~/Pictures/Screenshots',
        :user   => facts[:boxen_user]
      })

      should contain_boxen__osx_defaults('Manage screenshot type').with({
        :key    => 'type',
        :domain => 'com.apple.screencapture',
        :value  => 'jpg',
        :user   => facts[:boxen_user]
      })
    end
  end
end
