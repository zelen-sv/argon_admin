require 'generators/argon_admin_generator'

namespace :argon_admin do
  desc 'Generate admin panel'
  task :install do
    generator = ArgonAdminGenerator.instance
    generator.generate_assets
    generator.generate_views
    generator.generate_admin_data
    system "rails generate simple_form:install --bootstrap"
    system "rails generate devise:install"
    generator.generate_devise_data
    system "rails generate devise user"
  end
end
