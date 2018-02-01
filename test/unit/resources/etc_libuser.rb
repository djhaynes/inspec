# encoding: utf-8
# author: Danny Haynes

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::LibUserConfig' do

  it 'verify login_defs' do
    resource = MockLoader.new(:centos7).load_resource('etc_libuser')
    _(resource.value(['import','login_defs'])).must_equal ['/etc/login.defs']
  end

  it 'verify default_useradd' do
    resource = MockLoader.new(:centos7).load_resource('etc_libuser')
    _(resource.value(['import','default_useradd'])).must_equal ['/etc/default/useradd']
  end

  it 'verify crypt_style' do
    resource = MockLoader.new(:centos7).load_resource('etc_libuser')
    _(resource.value(['defaults','crypt_style'])).must_equal ['md5']
  end

  it 'verify modules' do
    resource = MockLoader.new(:centos7).load_resource('etc_libuser')
    _(resource.value(['defaults','modules'])).must_equal ['files shadow']
  end

  it 'verify create_modules' do
    resource = MockLoader.new(:centos7).load_resource('etc_libuser')
    _(resource.value(['defaults','create_modules'])).must_equal ['files shadow']   
  end

  it 'verify LU_USERNAME' do
    resource = MockLoader.new(:centos7).load_resource('etc_libuser')
    _(resource.value(['userdefaults','LU_USERNAME'])).must_equal ['%n']
  end

  it 'verify LU_GIDNUMBER' do
    resource = MockLoader.new(:centos7).load_resource('etc_libuser')
    _(resource.value(['userdefaults','LU_GIDNUMBER'])).must_equal ['%u']
  end

  it 'verify LU_GROUPNAME' do
    resource = MockLoader.new(:centos7).load_resource('etc_libuser')
    _(resource.value(['groupdefaults','LU_GROUPNAME'])).must_equal ['%n']
  end
end