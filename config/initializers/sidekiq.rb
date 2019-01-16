# frozen_string_literal: true

Sidekiq.configure_client do |config|
  config.redis = { url: Rails.application.credentials[:REDIS_URL] }
end

Sidekiq.configure_server do |config|
  config.redis = { url: Rails.application.credentials[:REDIS_URL] }
end
