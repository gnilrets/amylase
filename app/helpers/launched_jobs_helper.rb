module LaunchedJobsHelper
  def pretty_print_duration(seconds)
    return '0s' unless seconds
    Rufus::Scheduler.to_duration(seconds.floor)
  end

  def format_datetime(time)
    time.strftime "%Y-%m-%d %H:%M:%S %Z"
  end

  def row_functions(launched_job_id)
    render partial: "row_functions", locals: { launched_job_id: launched_job_id }, formats: [:html]
  end
end
