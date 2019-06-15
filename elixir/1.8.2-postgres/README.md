# elixir 1.8.2-postgres

## Usage

```workflow
action "mix deps.compile (test)" {
  uses = "moomerman/actions/elixir/1.8.2-postgres@master"
  runs = "mix"
  args = "deps.compile"
  env = {
    MIX_ENV = "test"
  }
}
```
