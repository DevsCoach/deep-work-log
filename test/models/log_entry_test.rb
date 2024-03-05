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
require "test_helper"

class LogEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
