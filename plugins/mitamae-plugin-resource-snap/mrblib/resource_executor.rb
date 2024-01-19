module ::MItamae
  module Plugin
    module ResourceExecutor
      class Snap < ::MItamae::ResourceExecutor::Base
        def apply
          if desired.installed && !current.installed
            cmdline = ['snap', 'install', attributes.name]
            if attributes.classic
              cmdline << '--classic'
            end
            run_command(cmdline)
          end
        end

        private

        def set_current_attributes(current, action)
          cmdline = ['snap', 'list', attributes.name]
          current.installed = run_command(cmdline, error: false).exit_status == 0
        end

        def set_desired_attributes(desired, action)
          desired.installed = true
        end
      end
    end
  end
end
