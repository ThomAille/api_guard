Rails.application.routes.draw do
  rabbit_api_routes for: 'users'

  rabbit_api_routes for: 'customers', class_name: 'User'

  rabbit_api_routes for: 'admins', controller: {
    registration: 'admins/registration',
    authentication: 'admins/auth'
  }
end