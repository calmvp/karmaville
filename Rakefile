#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Karmaville::Application.load_tasks

namespace :db do
  desc "Populates karma_points_sum column in users table"
  task :populate_sum => :environment do
    users = User.all
    ActiveRecord::Base.transaction do
      users.length.times do |i|
        user = User.find(i + 1)
        user.update_attribute(:karma_points_sum, user.total_karma)
      end
    end
  end
end
