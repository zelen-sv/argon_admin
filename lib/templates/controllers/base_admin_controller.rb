class Admin::BaseAdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
end
