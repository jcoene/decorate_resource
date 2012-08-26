# DecorateResource

It decorates your idiomatic Rails controller resources by running them through a decorator.

## Installation

Add this line to your application's Gemfile:

    gem 'decorate_resource'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install decorate_resource

## Usage

Your controllers will gain a decorate_resource macro that will take your instanciated variables and run them through an appropriately named decorator. Here's a before and after:

**Before:**

```ruby
class UsersController < ApplicationController
  load_resource

  def index
    @users # [User, User, ...]
  end

  def show
    @user # User
  end
end
```

**After**

```ruby
class UsersController < ApplicationController
  load_resource
  decorate_resource

  def index
    @users # [UserDecorator, UserDecorator, ...]
  end

  def show
    @user # UserDecorator
  end
end
```

## License

MIT
