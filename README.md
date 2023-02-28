# Official Lucky Framework Heroku Buildpack

You can create an app in Heroku with:

```bash
$ heroku create myapp --buildpack lucky-framework/lucky
```

The default behaviour is to use the [latest crystal release](https://github.com/crystal-lang/crystal/releases/latest).
If you need to use a specific version create a `.crystal-version` file in your
application root directory with the version that should be used (e.g. `1.2.0`).

## Requirements

You will need:

- Setup your heroku config:

  - lucky_env variable: `heroku config:set LUCKY_ENV=production`
  - secret key base: `heroku config:set SECRET_KEY_BASE=$(lucky gen.secret_key)`
  - app domain: `heroku config:set APP_DOMAIN=$(heroku apps:info | grep 'Web URL' | awk '{print $3}')`
  - sendgrid key: `heroku config:set SEND_GRID_KEY=unused`

- Configure your lucky and node buildpacks:

  - `heroku buildpacks:add heroku/nodejs`
  - `heroku buildpacks:add lucky-framework/lucky`

- Attach a postgres database service:

  - `heroku addons:create heroku-postgresql:hobby-dev`

- Ensure your crystal version is specified in a `.crystal-version` file
- If your application was generated with `lucky` before 2021-Feb, you may need to add a shard target to your shard.yml file:

```diff
name: project_name

targets:
# replace project_name with the name of your project
+  project_name:
+    main: src/project_name.cr
```

## Testing

To test a change to this buildpack, write a unit test in `tests/run` that asserts your change and
run `make test` to ensure the change works as intended and does not break backwards compatibility.

## Publishing Buildpack

* Log in to Heroku
* Visit partner dashboard for buildpacks https://addons-next.heroku.com/buildpacks
* Read more on Publishing buildpacks https://devcenter.heroku.com/articles/buildpack-registry

## More info

- [Luckyframework.org](https://luckyframework.org) has a guide on [Deploying to Heroku](https://luckyframework.org/guides/deploying/heroku)
- Lucky is written in [crystal](https://crystal-lang.org/)
- [Official Lucky Buildpack](https://elements.heroku.com/buildpacks/luckyframework/heroku-buildpack-lucky)
