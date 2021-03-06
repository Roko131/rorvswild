module RorVsWild
  class Installer
    PATH = "config/rorvswild.yml"

    def self.create_rails_config(api_key)
      if File.directory?("config")
        if !File.exists?(PATH)
          File.write(PATH, template(api_key))
          puts "File #{PATH} has been created. Restart / deploy your app to start collecting data."
        else
          puts "File #{PATH} already exists."
        end
      else
        puts "There is no config directory to create #{PATH}."
      end
    end

    def self.template(api_key)
      <<YAML
production:
  api_key: #{api_key}
    # ignore_requests: # Do not monitor the following actions
    #   - SecretController#index
    # ignore_jobs: # Do not monitor the following jobs
    #   - SecretJob
    # ignore_exceptions: # Do not record the following exceptions
    #   - ActionController::RoutingError  # By default to ignore 404
    # ignore_plugins:
    #   - ActionController
    #   - ActionMailer
    #   - ActionView
    #   - ActiveJob
    #   - ActiveRecord
    #   - DelayedJob
    #   - Elasticsearch
    #   - Mongo
    #   - NetHttp
    #   - Redis
    #   - Resque
    #   - Sidekiq
    # logger: log/rorvswild.log # By default it uses Rails.logger or Logger.new(STDOUT)
YAML
    end
  end
end
