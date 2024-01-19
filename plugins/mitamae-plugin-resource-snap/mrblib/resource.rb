module ::MItamae
  module Plugin
    module Resource
      class Snap < ::MItamae::Resource::Base
        define_attribute :action, default: :run
        define_attribute :name, default_name: true
        define_attribute :classic, default: false

        self.available_actions = [:run]
      end
    end
  end
end
