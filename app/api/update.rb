class API::Update < API::Base
  helpers do
    def is_sns_message?
      # Validate SNS message here.
    end

    def validate_sns_message_signature!
      
    end
  end
  desc "Webhook for receiving status updates from clients or an AWS SNS subscription"
  get '/update' do
    {}
  end
end