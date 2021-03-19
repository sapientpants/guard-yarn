# frozen_string_literal: true

require 'guard/compat/plugin'
require 'guard/yarn/options'

module Guard
  class Yarn < Plugin
    attr_accessor :options

    def initialize(options = {})
      super
      @options = Options.with_defaults(options)
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
      Guard::Compat::UI.info 'Guard::Yarn is installing packages'
      system('yarn install')
      Guard::Compat::UI.error 'Yarn failed to install packages' unless $CHILD_STATUS.success?
      $CHILD_STATUS.success?
    end

    def yarn_audit
      Guard::Compat::UI.info 'Guard::Yarn is auditing packages'
      system('yarn audit')
      Guard::Compat::UI.error 'Yarn failed to audit packages' unless $CHILD_STATUS.success?
      $CHILD_STATUS.success?
    end
  end
end
