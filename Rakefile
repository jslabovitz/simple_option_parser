require 'bundler/gem_tasks'
Bundler.require
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*test.rb']
end
desc "Run tests"

task :default => :test