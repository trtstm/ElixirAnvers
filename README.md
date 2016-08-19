# Anvers

Anvers will be a blogging engine written in Elixir using the Phoenix framework.

Note that I am writing this to learn Elixir, so it will probably contain poorly written code :).

![Admin](admin.png?raw=true "Admin page")
![Post](post.png?raw=true "Show post")


To start:

  * Copy config/dev.exs.example to config/dev.exs and customize it for your environment
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Credits

  * Phoenix: https://github.com/phoenixframework/phoenix
  * SimpleMDE: https://github.com/NextStepWebs/simplemde-markdown-editor
  * Earmark: https://github.com/pragdave/earmark
  * Theme: https://startbootstrap.com/template-overviews/clean-blog/
  * Admin theme: https://startbootstrap.com/template-overviews/sb-admin-2/

## Copyright and License

Copyright (c) 2016, Timo Truyts.

Anvers source code is licensed under the [MIT License](LICENSE.md).
