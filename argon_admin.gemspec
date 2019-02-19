
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "argon_admin/version"

Gem::Specification.new do |spec|
  spec.name          = "argon_admin"
  spec.version       = ArgonAdmin::VERSION
  spec.authors       = ["Stas Zelenko"]
  spec.email         = ["st.zelenko@gmail.com"]

  spec.summary       = %q{Generates admin panel based on Argon Dashboard for Bootstrap 4 by Creative Tim}
  spec.description   = %q{Generates admin panel based on Argon Dashboard for Bootstrap 4 by Creative Tim. Project requires Rails 5, SimpleForm, Kaminari and Devise.}
  spec.homepage      = "https://github.com/zelen-sv/argon_admin"

  spec.files = Dir["{lib,vendor}/**/*"] + ["MIT-LICENSE", "README.md"]

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",        "~> 1.16"
  spec.add_development_dependency "rake",           "~> 10.0"
  spec.add_runtime_dependency "jquery-rails",       "~> 4.3"
  spec.add_runtime_dependency "bootstrap",          "~> 4.2.1"
  spec.add_runtime_dependency "font-awesome-rails", "~> 4.7"
  spec.add_dependency "devise",      "~> 4.6"
  spec.add_dependency "simple_form", "~> 4.1"
  spec.add_dependency "kaminari",    "~> 1.1"
end
