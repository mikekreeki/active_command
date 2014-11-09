# ActiveCommand

Extend Rails MVC with Commands and Listeners.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_command'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_command

## Usage

```ruby
# app/controllers/users_controller.rb
class API::V1::UsersController < ApplicationController
  def create
    command = User::CreateService.run(user_params)

    if command.valid?
      render json: command.result, status: 201
    else
      render json: { errors: command.errors }, status: 422
    end
  end
end

# app/listeners/kissmetrics_listener.rb
class EmailListener
  def user_created(user)
    # Send welcome notification
  end
end

# app/services/user/create_service.rb
class User::CreateService < ActiveCommand::Command
  group :user do
    attribute :first_name
    attribute :last_name
  end

  group :address do
    attribute :street
    attribute :city
  end

  subscribe :email_listener

  def execute
    user = create_user!

    publish :user_created, user

    user
  end

  private

  def create_user!
    User.create!(attributes_for(:user)) do
      user.create_address! attributes_for(:address)
    end
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/active_command/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
