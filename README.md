# Toggl

Stupidly simple module for getting timer entries from Toggl.

## Installation

Install from github by adding the following into your `mix.exs` file:

```elixir
def deps do
  [
    {:toggl, git: "https://github.com/ayrdim/toggl.git"}
  ]
end
```

## Usage

Note that when specifying a timezone you'll need to have a timezone database set up.

```elixir
# Replace with your API token
# You token can be found at https://track.toggl.com/profile under the "API Token" section
api_token = "12345678901234567890123456789012:api_token"

datetime_start = DateTime.new!(~D[2024-03-01], ~T[00:00:00], "Australia/Melbourne")
datetime_end = DateTime.new!(~D[2024-03-20], ~T[23:59:59], "Australia/Melbourne")

{:ok, time_entries} = Toggl.get_time_entries_for_range(api_token, datetime_start, datetime_end)

time_entries = Toggl.get_time_entries_for_range!(api_token, datetime_start, datetime_end)
```
