# frozen_string_literal: true

require 'guard/compat/test/helper'
require 'guard/yarn'

RSpec.describe Guard::Yarn do
  let(:default_options) { Guard::Yarn::Options::DEFAULTS }
  let(:options) { {} }
  let(:package_json) { 'package.json' }
  let(:plugin) { Guard::Yarn.new(options) }

  before do
    allow(Guard::Compat::UI).to receive(:info)
  end

  describe '.initialize' do
    it 'instanciates with default and custom options' do
      guard_yarn = Guard::Yarn.new(foo: :bar)
      expect(guard_yarn.options).to eq(default_options.merge(foo: :bar))
    end
  end

  describe '#start' do
    it "doesn't call #run_all by default" do
      expect(plugin).to_not receive(:run_all)
      plugin.start
    end

    context 'with all_on_start at true' do
      let(:options) { { all_on_start: true } }

      it 'calls #run_all' do
        expect(plugin).to receive(:run_all)
        plugin.start
      end
    end
  end

  describe '#run_all' do
    it 'calls run_yarn' do
      expect(plugin).to receive(:run_yarn)
      plugin.run_all
    end
  end

  describe '#reload' do
    it 'reloads via runner' do
      expect(plugin).to receive(:run_yarn)
      plugin.reload
    end
  end

  describe '#run_on_additions' do
    let(:paths) { %w[path1 path2] }
    it 'calls run_yarn' do
      expect(plugin).to receive(:run_yarn)
      plugin.run_on_additions(paths)
    end

    it 'does nothing if paths empty' do
      expect(plugin).to_not receive(:run_yarn)
      plugin.run_on_additions([])
    end
  end

  describe '#run_on_modifications' do
    let(:paths) { %w[path1 path2] }
    it 'calls run_yarn' do
      expect(plugin).to receive(:run_yarn)
      plugin.run_on_modifications(paths)
    end

    it 'does nothing if paths empty' do
      expect(plugin).to_not receive(:run_yarn)
      plugin.run_on_modifications([])
    end
  end
end
