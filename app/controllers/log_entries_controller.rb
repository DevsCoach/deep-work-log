class LogEntriesController < ApplicationController
  before_action :set_log_entry, only: %i[show update edit end]
  before_action :set_log_entries

  def index
    active = LogEntry.active
    if active
      redirect_to edit_log_entry_path(active)
    else
      @log_entry = LogEntry.new
    end
  end

  def end
    @log_entry.update!(**log_entry_params,
                       ended_at: Time.current)

    redirect_to root_path
  end

  def show; end

  def create
    @log_entry = LogEntry.create!(ends_at: 90.minutes.from_now)
    redirect_to edit_log_entry_path(@log_entry)
  end

  def edit
    @log_entries = @log_entries.reject { |le| le.id == @log_entry.id }
  end

  def update
    @log_entry.update!(log_entry_params)
    head :ok
  end

  private

    def log_entry_params
      params.require(:log_entry).permit(:content)
    end

    def set_log_entry
      @log_entry = LogEntry.find(params[:id])
    end

    def set_log_entries
      @log_entries = LogEntry.order(created_at: :desc).limit(10)
    end
end
