#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet/backport/type/package/uninstall_options'

describe Puppet::Type.type(:package) do
  before do
    Puppet::Util::Storage.stubs(:store)
  end

  specify "should have an :uninstall_options feature without any requirements" do
    expect(described_class.provider_feature(:uninstall_options)).to_not be_nil
    expect(described_class.provider_feature(:uninstall_options).methods).to be_nil
  end

  context "when validating attributes" do
    specify "should have a uninstall_options parameter" do
      expect(described_class.attrtype(:uninstall_options)).to be :param
    end
  end
end
