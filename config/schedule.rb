# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

env :PATH, ENV['PATH']
set :environment, "development"
set :output, "log/cron.log"
job_type :runner, "export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rails runner :task ：output"
every 1.days do
  runner "DailyMailer.send_once_a_day.deliver"
end

