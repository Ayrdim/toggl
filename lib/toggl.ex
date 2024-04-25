defmodule Toggl do
  @toggl_time_entries_url "https://api.track.toggl.com/api/v9/me/time_entries"

  def get_time_entries_for_range(
        api_token,
        %DateTime{} = datetime_start,
        %DateTime{} = datetime_end
      ) do
    Req.get(
      @toggl_time_entries_url,
      params: [
        start_date: DateTime.to_iso8601(datetime_start),
        end_date: DateTime.to_iso8601(datetime_end)
      ],
      auth: {:basic, api_token}
    )
    |> maybe_get_timers_from_response
  end

  defp maybe_get_timers_from_response({:ok, %{body: timers}}), do: {:ok, timers}
  defp maybe_get_timers_from_response(error), do: error

  def get_time_entries_for_range!(
        api_token,
        %DateTime{} = datetime_start,
        %DateTime{} = datetime_end
      ) do
    Req.get!(
      @toggl_time_entries_url,
      params: [
        start_date: DateTime.to_iso8601(datetime_start),
        end_date: DateTime.to_iso8601(datetime_end)
      ],
      auth: {:basic, api_token}
    )
    |> get_timers_from_response
  end

  defp get_timers_from_response(%{body: timers}), do: timers
end
