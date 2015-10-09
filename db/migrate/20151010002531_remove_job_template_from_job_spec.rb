class RemoveJobTemplateFromJobSpec < ActiveRecord::Migration
  def change
    remove_reference :job_specs, :job_template, polymorphic: true
  end
end
