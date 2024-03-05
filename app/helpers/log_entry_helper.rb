module LogEntryHelper
  def human_duration(duration)
    total_seconds = duration.to_i
    return "00:00:00" if total_seconds <= 0

    hours = total_seconds / 3600
    minutes = (total_seconds / 60) % 60
    seconds = total_seconds % 60

    format("%02d:%02d:%02d", hours, minutes, seconds)
  end
end
