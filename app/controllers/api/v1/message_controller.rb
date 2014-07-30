class Api::V1::MessageController < ApplicationController
	  include ApiHelper
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter :authenticate_scope!, :only => [:update]
  before_filter :validate_auth_token, :except => [:create,:list]
  before_filter :checklogin, :only => [:list]
  respond_to :json
end
