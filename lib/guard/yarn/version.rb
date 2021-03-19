# frozen_string_literal: true

module Guard
  # A workaround for declaring `class Yarn`
  # before `class Yarn < Guard` in yarn.rb
  module YarnVersion
    # http://semver.org/
    MAJOR = 0
    MINOR = 0
    PATCH = 1

    def self.to_s
      [MAJOR, MINOR, PATCH].join('.')
    end
  end
end
