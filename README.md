# ArgonAdmin

Simple admin panel generator with the [Argon Dashboard theme](https://github.com/creativetimofficial/argon-dashboard) for your new project.

![](https://i.ibb.co/DGHc4Q0/argon-dashboard.jpg)

Main features included by default:

- Authentication with [Devise](https://github.com/plataformatec/devise).
- [Argon Dashboard theme](https://github.com/creativetimofficial/argon-dashboard) theme included for the admin panel.
- ERB template engine.
- Pagination with [Kaminari](https://github.com/kaminari/kaminari)
- [Simple form](https://github.com/plataformatec/simple_form) integration
- Сustomized flash messages

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'argon_admin'
```

Next, you need to run the generator:

    $ rails argon_admin:install
    
Generate devise user:

    $ rails db:migrate
    $ rails db:seed
    
And you're ready to go. Test if all it's ok by starting a server and check it with rails s.

Default admin user with email admin@example.com and password 123456789

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zelen-sv/argon_admin.
