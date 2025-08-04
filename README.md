# Ruby Twitter Clone

## Features

- User authentication and profiles
- Create and view tweets
- Reply to tweets
- Like and share tweets
- User avatars and media support

## Setup

```bash
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec foreman start -f Procfile.dev
```

Visit `http://localhost:3000`

## Stack

- Ruby on Rails 8.0.2
- SQLite3
- Tailwind CSS
