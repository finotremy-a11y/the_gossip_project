# The Gossip Project

A small Ruby on Rails application built as part of The Hacking Project (THP) exercises.
The app models a simple social platform where users create "gossips", can comment, like,
send private messages, and tag gossips. This repository contains the application code,
database migrations, and basic configuration to run the app locally.

## Quick Start

1. Install prerequisites (Ruby, Bundler, SQLite3). See the `Gemfile` for exact Ruby/Rails versions.
2. Install gems:

```bash
bundle install
```

3. Create, migrate and seed the database:

```bash
bin/rails db:setup
```

4. Start the development server (uses `bin/dev` which runs the Rails server and any dev helpers):

```bash
./bin/dev
```

Open http://localhost:3000 in your browser.

## Requirements

- Ruby (see `Gemfile`)
- Bundler
- SQLite3 for development (configurable in `config/database.yml`)
- Node.js / npm or an alternative if you change the JS tooling (this project uses importmap by default)

## Running tests

Run the Rails test suite with:

```bash
bin/rails test
```

## Database

- Migrations are in `db/migrate/`.
- Seeds are in `db/seeds.rb`.
- To reset and reseed the database:

```bash
bin/rails db:reset db:seed
```

## Development notes

- Start the app with `./bin/dev` (uses the `bin/` helpers included in the repo).
- The project includes a `Dockerfile` for container builds; review and adapt it before using in production.

## Project structure (important folders)

- `app/controllers/` — controllers
- `app/models/` — ActiveRecord models (User, Gossip, Tag, Comment, Like, etc.)
- `app/views/` — view templates
- `config/` — Rails configuration and routes
- `db/` — migrations and seeds

## Contributing

- Open an issue describing the change or bug.
- Fork the repository, create a topic branch, implement your changes, add tests where appropriate,
  and open a pull request.

## Notes / Troubleshooting

- If you encounter version conflicts, check `Gemfile` and `Gemfile.lock` for pinned versions.
- If frontend assets behave unexpectedly after changes, try restarting the dev server.

## License

This repository does not include an explicit license file. Add a `LICENSE` if you plan to
open-source the project (for example, MIT or other permissive licenses).

---

If you want, I can add a short section with the exact Ruby and Rails versions and example screenshots.
