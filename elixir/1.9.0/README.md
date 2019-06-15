# elixir 1.9.0

## Usage

Run elixir commands 

```
action "mix deps.get" {
  uses = "moomerman/actions/elixir/1.9.0@master"
  runs = "mix"
  args = "deps.get"
}
```
