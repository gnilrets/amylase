class JobSpec < ActiveRecord::Base
  nilify_blanks

  validates_uniqueness_of :name
  validates_presence_of :name

  belongs_to :job_schedule_group
  belongs_to :client

  has_many :launched_jobs
end
