# frozen_string_literal: true

module Guard
  class Yarn < Plugin
    module Options
      DEFAULTS = {
        all_on_start: false,
        audit: true,
        install: true
      }.freeze

      class << self
        def with_defaults(options = {})
          DEFAULTS.merge(options)
        end
      end
    end
  end
end
