# == Schema Information
#
# Table name: log_entries
#
#  id         :integer          not null, primary key
#  ends_at    :datetime
#  content    :string
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class LogEntry < ApplicationRecord
  after_save :prepend_if_ended
  after_save :update_stats

  def self.active
    now = Time.current
    LogEntry.where(ended_at: nil)
            .where("ends_at > ? AND created_at < ?", now, now)
            .order(ends_at: :desc)
            .limit(1)&.first
  end

  def duration
    if ended_at.nil?
      Time.current - created_at
    else
      ended_at - created_at
    end
  end

  def self.total_duration
    LogEntry.where("created_at > ?", Time.current.beginning_of_day).sum(&:duration)
  end

  def self.total_word_count
    LogEntry.all.sum { |le| le.content&.split&.count || 0 }
  end

  private

    def prepend_if_ended
      return unless saved_change_to_ended_at? && ended_at

      broadcast_prepend_to "log_entries_stream", target: "log_entries"
    end

    def update_stats
      return unless saved_change_to_content?

      broadcast_replace_to "stats_stream",
                           target: "stats",
                           partial: "log_entries/stats"
    end
end
