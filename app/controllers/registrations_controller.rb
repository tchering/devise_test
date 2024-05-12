class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    resource.build_address
    respond_with resource
  end
end
