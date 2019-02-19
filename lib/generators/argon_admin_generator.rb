class ArgonAdminGenerator < Rails::Generators::Base
  include Singleton
  source_root File.expand_path("../templates", __dir__)

  ROUTES_TEXT = <<-RUBY
  namespace :admin do
    root 'pages#dashboard'
    resources :users
  end
  RUBY

  HELPER_TEXT = <<-RUBY
  def flash_class(level)
    case level.to_sym
        when :notice then "alert alert-primary"
        when :success then "alert alert-success"
        when :error then "alert alert-danger"
        when :alert then "alert alert-warning"
    end
  end
  RUBY

  ASSETS_TEXT = <<-RUBY
  Rails.application.config.assets.precompile += %w( admin.js admin.scss )
  Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
  RUBY

  def generate_assets
    copy_file "assets/stylesheets/admin.scss", "app/assets/stylesheets/admin.scss"
    copy_file "assets/javascripts/admin.js", "app/assets/javascripts/admin.js"
    directory "assets/images/admin", "app/assets/images/admin"
    append_to_file 'config/initializers/assets.rb' do
      ASSETS_TEXT
    end
  end

  def generate_views
    directory "layouts", "app/views/layouts"
    directory "views/pages", "app/views/admin/pages"
    directory "views/users", "app/views/admin/users"
    directory "views/shared", "app/views/admin/shared"
    directory "views/sessions", "app/views/devise/sessions"
    directory "views/kaminari", "app/views/kaminari"
  end

  def generate_admin_data
    insert_into_file "config/routes.rb", after: "Rails.application.routes.draw do\n" do
      ROUTES_TEXT
    end
    insert_into_file "app/helpers/application_helper.rb", after: "module ApplicationHelper\n" do
      HELPER_TEXT
    end
    directory "controllers", "app/controllers/admin/"
  end

  def generate_devise_data
    add_secret_key
    update_development_mailer_config
    update_seeds_file
  end

  private

  def add_secret_key
    secret = SecureRandom.hex(64)
    insert_into_file "config/initializers/devise.rb", after: "Devise.setup do |config|\n" do
      "config.secret_key = '#{secret}'"
    end
    gsub_file('config/initializers/devise.rb', "config.sign_out_via = :delete", "config.sign_out_via = :get")
  end

  def update_development_mailer_config
    insert_into_file "config/environments/development.rb", after: "Rails.application.configure do\n" do
      "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }\n"
    end
  end

  def update_seeds_file
    append_to_file 'db/seeds.rb' do
      "User.create!(email: 'admin@gmail.com', password: '987654321', password_confirmation: '987654321')"
    end
  end
end
