class Times
  RED = "\e[31m"
  GREEN = "\e[32m"
  RESET = "\e[0m"

  def initialize
    @time_zones = [ "Asia/Tokyo", "Eastern Time (US & Canada)", "Europe/Stockholm" ]
    puts "TOKYO EST   STOCK"
  end

  def print_times
    # Start at the beginning of the day in UTC
    time = Time.now.utc.beginning_of_day

    # Print each hour for the next 24 hours
    24.times do
      @time_zones.each do |zone|
        tz_time = time.in_time_zone(zone)
        formatted_time = tz_time.strftime("%H:%M")

        # Determine the color based on the hour
        hour = tz_time.hour
        color = if hour >= 1 && hour < 5
                  RED
                elsif hour >= 8 && hour < 21
                  GREEN
                else
                  ""
                end

        print "#{color}#{formatted_time}#{RESET} "
      end
      puts "" # New line after each hour
      time += 1.hour
    end
  end
end
