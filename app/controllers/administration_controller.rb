# frozen_string_literal: true

class AdministrationController < ApplicationController
  before_action :authenticate_admin!
  layout "administration"

  def export; end
end
