# frozen_string_literal: true

require 'guard/compat/plugin'
require 'guard/rspec/options'

module Guard
  class Yarn < Plugin
    attr_accessor :options

    def initialize(options = {})
      super
      @options = Guard::Yarn::Options.with_defaults(options)
    end

    def start
      run_yarn if options[:all_on_start]
    end

    def reload
      run_yarn
    end

    def run_all
      run_yarn
    end

    def run_on_additions(_paths = [])
      run_yarn
    end

    def run_on_modifications(_paths = [])
      run_yarn
    end

    private

    def run_yarn
      yarn_audit if options[:audit] && (options[:install] && yarn_install)
    end

    def yarn_install
      system('yarn install')
      if $CHILD_STATUS.success?
        Guard::Compat::UI.info 'Yarn installed packages'
      else
        Guard::Compat::UI.error 'Yarn failed to install packages'
      end
      $CHILD_STATUS.success?
    end

    def yarn_audit
      system('yarn audit')
      if $CHILD_STATUS.success?
        Guard::Compat::UI.info 'Yarn audited packages'
      else
        Guard::Compat::UI.error 'Yarn failed to audit packages'
      end
      $CHILD_STATUS.success?
    end
  end
end
