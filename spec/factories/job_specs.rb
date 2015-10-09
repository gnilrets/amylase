# spec/factories/job_specs.rb

FactoryGirl.define do
  factory :job_spec do
    sequence(:name) { |n| "job_spec_collection-#{n}" }

    trait :with_schedule do
      association :job_schedule_group, :in_1s
    end

    # Schedule associations

    trait :schedule_maintenance do
      association :job_schedule_group, factory: :job_schedule_group_with_schedules
    end

    trait :schedule_in_1s do
      association :job_schedule_group, :in_1s
    end

    trait :schedule_interval_1s do
      association :job_schedule_group, :interval_1s
    end

    # Client associations
    trait :with_client do
      association :client
    end

  end
end
